// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../models/api/api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkerResponse _$WorkerResponseFromJson(Map json) => $checkedCreate(
      'WorkerResponse',
      json,
      ($checkedConvert) {
        final val = WorkerResponse(
          status: $checkedConvert('status', (v) => v as int?),
          error: $checkedConvert('error', (v) => v),
          success: $checkedConvert('success', (v) => v as bool?),
          message: $checkedConvert('message', (v) => v as String?),
          body: $checkedConvert('body', (v) => v),
        );
        return val;
      },
    );

Map<String, dynamic> _$WorkerResponseToJson(WorkerResponse instance) => <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
      'message': instance.message,
      'body': instance.body,
      'success': instance.success,
    };

D1Result<T> _$D1ResultFromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) =>
    $checkedCreate(
      'D1Result',
      json,
      ($checkedConvert) {
        final val = D1Result<T>(
          success: $checkedConvert('success', (v) => v as bool),
          error: $checkedConvert('error', (v) => v as String?),
          results: $checkedConvert('results', (v) => (v as List<dynamic>?)?.map(fromJsonT).toList() ?? const []),
        );
        return val;
      },
    );

Map<String, dynamic> _$D1ResultToJson<T>(
  D1Result<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'results': instance.results.map(toJsonT).toList(),
    };

UserBattleData _$UserBattleDataFromJson(Map json) => $checkedCreate(
      'UserBattleData',
      json,
      ($checkedConvert) {
        final val = UserBattleData(
          id: $checkedConvert('id', (v) => v as int),
          ver: $checkedConvert('ver', (v) => v as int),
          userId: $checkedConvert('userId', (v) => v as String),
          questId: $checkedConvert('questId', (v) => v as int),
          phase: $checkedConvert('phase', (v) => v as int),
          enemyHash: $checkedConvert('enemyHash', (v) => v as String),
          record: $checkedConvert('record', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$UserBattleDataToJson(UserBattleData instance) => <String, dynamic>{
      'id': instance.id,
      'ver': instance.ver,
      'userId': instance.userId,
      'questId': instance.questId,
      'phase': instance.phase,
      'enemyHash': instance.enemyHash,
      'record': instance.record,
    };
