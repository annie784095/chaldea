import 'dart:math';

import 'package:chaldea/components/components.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:intl/intl_standalone.dart';

const _hjs = 'https://hm.baidu.com/hm.js?';
const _hgif = 'https://hm.baidu.com/hm.gif?';

const _kBDID = '9de65dbb7a214ca258974c37c5e060d2';

class Analyzer {
  const Analyzer._();

  static bool skipReport() {
    if (kDebugMode || AppInfo.isDebugDevice) {
      return true;
    }
    return false;
  }

  static Future<void> sendStat() async {
    if (!db.hasNetwork) return;

    String size = '';
    if (kAppKey.currentContext != null) {
      final mq = MediaQuery.of(kAppKey.currentContext!);
      // use logical pixel, don't multiple devicePixelRatio
      int w = (mq.size.width).round();
      int h = (mq.size.height).round();
      size = '${w}x$h';
    }
    String zone = 'unknown';
    try {
      final Response cipRes = await Dio().get('http://cip.cc',
          options: Options(
            contentType: 'text/plain',
            headers: {'User-Agent': 'curl/7.71.1'},
          ));
      zone = cipRes.data.toString().trim().split('\n')[1].split(':')[1].trim();
    } catch (e, s) {
      logger.e('fetch cip failed', e, s);
    }
    // await Dio(BaseOptions(baseUrl: 'http://localhost:8083'))
    //     .get('/analytics', queryParameters: {
    await db.serverDio.get('/analytics', queryParameters: {
      'uuid': AppInfo.uuid,
      'os': PlatformU.operatingSystem,
      'os_ver': PlatformU.isAndroid
          ? AppInfo.androidSdk ?? PlatformU.operatingSystemVersion
          : PlatformU.operatingSystemVersion,
      'app': AppInfo.packageName,
      'app_ver': AppInfo.version,
      'build': AppInfo.originBuild,
      'dataset': db.gameData.version,
      'lang': Language.current.code,
      'locale': await findSystemLocale(),
      'data_ver': db.gameData.version,
      'abi': AppInfo.abi.toStandardString(),
      'mac': AppInfo.macAppType.index,
      'time': DateTime.now().toString().split('.').first,
      'size': size,
      'zone': zone,
    }).catchError((e, s) async {
      logger.e('report analytics failed', e, s);
    });
  }

  static Future<void> sendBdtj({String? bdId}) async {
    if (!db.hasNetwork) return;
    // TODO: invalid, ignored by bdtj
    try {
      if (PlatformU.isIOS || PlatformU.isAndroid) {
        launchStaticUrl(_constructUrl());
        return;
      }
      if (kReleaseMode) {
        // don't send for desktop
        return;
      }
      String url = _constructUrl();
      bdId ??= _kBDID;
      final String hjs = _hjs + bdId;

      final size = MediaQuery.of(kAppKey.currentContext!).size;
      final random = Random(DateTime.now().microsecondsSinceEpoch);

      final cookieJar = PersistCookieJar();
      final cookies = await cookieJar.loadForRequest(Uri.parse(hjs));
      String? hca() => cookies
          .firstWhereOrNull((c) => c.name.trim() == 'HMACCOUNT_BFESS')
          ?.value;

      bool fresh = hca() == null;
      bool first = true;

      Map<String, String> genMap() {
        print('bdtj: fresh=$fresh, first=$first');
        final Map<String, dynamic> _param = {
          // 'hca':null,
          'cc': 1,
          'ck': 1,
          'cl': '24-bit',
          'ds': '${size.width}x${size.height}',
          'vl': 750,
          // 'ep': null,
          // 'et':xxx?3:0,
          'ja': 0,
          'ln': Intl.getCurrentLocale(),
          'lo': 0,
          'rnd':
              (random.nextInt(90000) + 10000) * 100000 + random.nextInt(100000),
          'si': bdId,
          'v': '1.2.80',
          'lv': fresh ? 1 : 2,
          'sn': fresh
              ? 1917
              : first
                  ? 2091
                  : 2096,

          /// wrong
          'r': 0,
          'ww': size.width,
          // 'ct':null,
          'u': url,
          // 'tt':null,
        };
        if (!fresh) {
          _param['lt'] = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        }
        if (!fresh && first) {
          _param['hca'] = hca();
        }
        if (!fresh && first) {
          _param['ep'] = '5207,2678';

          /// wrong
        }
        _param['et'] = _param['ep'] == null ? 0 : 3;
        if (fresh || !first) {
          _param['ct'] = '!!';
        }
        if (fresh || !first) {
          _param['uu'] = 'Chaldea ${PlatformU.operatingSystem}';
        }
        // logger.i(_param);
        return _param.map((key, value) => MapEntry(key, value.toString()));
      }

      final _dio = HttpUtils.defaultDio;
      _dio.interceptors.add(CookieManager(cookieJar));
      await _dio.get(hjs);
      String gifUrl1 =
          Uri.parse(_hgif).replace(queryParameters: genMap()).toString();
      first = false;
      var gif1 = _dio.get(gifUrl1);
      await Future.delayed(const Duration(milliseconds: 66));
      String gifUrl2 =
          Uri.parse(_hgif).replace(queryParameters: genMap()).toString();
      var gif2 = _dio.get(gifUrl2);
      await Future.wait([gif1, gif2]);
    } catch (e, s) {
      logger.e('bdtj failed', e, s);
    }
  }

  static Future<void> launchStaticUrl(String url) async {
    final plugin = FlutterWebviewPlugin();
    await plugin.launch(url, hidden: true).catchError((e, s) async {
      logger.e('loading webview failed, url=$url', e, s);
    });
    print('$url launched');
    await Future.delayed(const Duration(seconds: 10));
    plugin.dispose();
  }

  static String _constructUrl({String? platform}) {
    return '$kServerRoot/bdtj/${Language.currentLocaleCode}/${platform ?? PlatformU.operatingSystem}/${AppInfo.version}';
  }
}
