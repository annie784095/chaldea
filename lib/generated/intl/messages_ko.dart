// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ko';

  static String m0(curVersion, newVersion, releaseNote) =>
      "현재 버전 : ${curVersion}\nL최신 버전 : ${newVersion}\n개발 노트:\n${releaseNote}";

  static String m1(url) =>
      "Chaldea - 멀티 플랫폼의 Fate/GO 아이템 계획 어플. 게임정보의 열람 및 서번트/이벤트/아이템 계획, 마스터 미션 계획, 가챠 시뮬레이터 등의 기능을 서포트합니다.\n\n자세히 보기: \n${url}\n";

  static String m2(version) => "필요한 앱 버전: ≥ ${version}";

  static String m3(n) => "최대 ${n}회 제한";

  static String m4(n, total) => "전승결정으로 대체되는 성배의 개수 : ${n}/${total}";

  static String m15(filename, hash, localHash) =>
      "${filename} 파일을 찾을 수 없거나 해시가 일치하지 않습니다 : ${hash} - ${localHash}";

  static String m16(rarity) => "${rarity}☆ 개념예장 픽업";

  static String m17(rarity) => "${rarity}☆ 서번트 픽업";

  static String m5(error) => "불러오기 실패. Error:\n${error}";

  static String m6(name) => "${name}은 이미 존재합니다";

  static String m7(site) => "${site}(으)로 이동";

  static String m18(shown, total) => "${shown} 표시 (합계 ${total})";

  static String m19(shown, ignore, total) =>
      "${shown} 표시, ${ignore} 무시 (합계 ${total})";

  static String m8(first) => "${Intl.select(first, {
            'true': '이미 첫번째입니다.',
            'false': '이미 마지막입니다.',
            'other': '마지막입니다.',
          })}";

  static String m9(n) => "제${n}절";

  static String m20(region) => "문제가 발생했거나 ${region}에 이 퀘스트의 데이터가 없습니다.";

  static String m21(unknown, dup, valid, total, selected) =>
      "${unknown}불명, ${dup}중복, ${valid}/${total}유효, ${selected}선택된";

  static String m10(region) => "${region} 공고";

  static String m11(n) => "계획 초기화 ${n}(모두)";

  static String m12(n) => "계획 초기화 ${n}(표시된)";

  static String m22(battles, ap) => "합계 ${battles}회 전투, ${ap} AP";

  static String m13(n) => "프로필${n}";

  static String m14(a, b) => "${a} ${b}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about_app": MessageLookupByLibrary.simpleMessage("에 관해"),
        "about_app_declaration_text": MessageLookupByLibrary.simpleMessage(
            "이 어플리케이션에 사용되는 데이터는 게임 Fate/GO 및 게임 사이트에서 가져왔습니다. 게임의 텍스트, 그림, 음성의 저작권은 TYPE MOON/FGO PROJECT에 있습니다.\n\n프로그램의 설계는 WeChat의 프로그램인  \"Material Programe\" 과 IOS 앱인  \"Guda\"를 기반으로 제작되었습니다.\n"),
        "about_data_source": MessageLookupByLibrary.simpleMessage("데이터 소스"),
        "about_data_source_footer": MessageLookupByLibrary.simpleMessage(
            "출처가 표시되어 있지 않거나 침해가 있는 경우 알려주세요"),
        "about_feedback": MessageLookupByLibrary.simpleMessage("피드백"),
        "about_update_app_detail": m0,
        "account_title": MessageLookupByLibrary.simpleMessage("계정"),
        "active_skill": MessageLookupByLibrary.simpleMessage("보유 스킬"),
        "active_skill_short": MessageLookupByLibrary.simpleMessage("보유"),
        "add": MessageLookupByLibrary.simpleMessage("추가"),
        "add_feedback_details_warning":
            MessageLookupByLibrary.simpleMessage("피드백 내용을 작성해주세요"),
        "add_to_blacklist": MessageLookupByLibrary.simpleMessage("블랙리스트 추가"),
        "anniversary": MessageLookupByLibrary.simpleMessage("주년"),
        "ap": MessageLookupByLibrary.simpleMessage("AP"),
        "ap_efficiency": MessageLookupByLibrary.simpleMessage("AP 효율"),
        "app_data_folder": MessageLookupByLibrary.simpleMessage("데이터 폴더"),
        "app_data_use_external_storage":
            MessageLookupByLibrary.simpleMessage("부 스토리지 (SD 카드)를 사용"),
        "append_skill": MessageLookupByLibrary.simpleMessage("어펜드 스킬"),
        "append_skill_short": MessageLookupByLibrary.simpleMessage("어펜드"),
        "april_fool": MessageLookupByLibrary.simpleMessage("만우절"),
        "ascension": MessageLookupByLibrary.simpleMessage("영기"),
        "ascension_short": MessageLookupByLibrary.simpleMessage("영기"),
        "ascension_up": MessageLookupByLibrary.simpleMessage("영기재림"),
        "attach_from_files": MessageLookupByLibrary.simpleMessage("파일에서"),
        "attach_from_photos": MessageLookupByLibrary.simpleMessage("앨범에서"),
        "attach_help": MessageLookupByLibrary.simpleMessage(
            "앨범에서 이미지를 가져올 때 문제가 있는 경우 파일로 가져오세요"),
        "attachment": MessageLookupByLibrary.simpleMessage("애정"),
        "auto_reset": MessageLookupByLibrary.simpleMessage("자동 리셋"),
        "auto_update": MessageLookupByLibrary.simpleMessage("자동 업데이트"),
        "background": MessageLookupByLibrary.simpleMessage("배경"),
        "backup": MessageLookupByLibrary.simpleMessage("백업"),
        "backup_failed":
            MessageLookupByLibrary.simpleMessage("백업 불러오기를 실패하였습니다"),
        "backup_history": MessageLookupByLibrary.simpleMessage("백업 기록"),
        "bgm": MessageLookupByLibrary.simpleMessage("BGM"),
        "blacklist": MessageLookupByLibrary.simpleMessage("블랙리스트"),
        "bond": MessageLookupByLibrary.simpleMessage("인연"),
        "bond_craft": MessageLookupByLibrary.simpleMessage("인연예장"),
        "bond_eff": MessageLookupByLibrary.simpleMessage("인연 효율"),
        "bond_limit": MessageLookupByLibrary.simpleMessage("인연 상한"),
        "bootstrap_page_title": MessageLookupByLibrary.simpleMessage("가이드 페이지"),
        "branch_quest": MessageLookupByLibrary.simpleMessage("브랜치 퀘스트"),
        "bronze": MessageLookupByLibrary.simpleMessage("동색"),
        "cache_icons": MessageLookupByLibrary.simpleMessage("캐시 아이콘"),
        "calc_weight": MessageLookupByLibrary.simpleMessage("몸무게"),
        "cancel": MessageLookupByLibrary.simpleMessage("취소"),
        "card_asset_chara_figure":
            MessageLookupByLibrary.simpleMessage("타치에 차분"),
        "card_asset_command": MessageLookupByLibrary.simpleMessage("커맨드 카드"),
        "card_asset_face": MessageLookupByLibrary.simpleMessage("아이콘"),
        "card_asset_narrow_figure":
            MessageLookupByLibrary.simpleMessage("파티 타치에"),
        "card_asset_status": MessageLookupByLibrary.simpleMessage("상태 아이콘"),
        "card_description": MessageLookupByLibrary.simpleMessage("상세 정보"),
        "card_info": MessageLookupByLibrary.simpleMessage("정보"),
        "card_name": MessageLookupByLibrary.simpleMessage("카드명"),
        "carousel_setting": MessageLookupByLibrary.simpleMessage("배너 설정"),
        "cc_equipped_svt": MessageLookupByLibrary.simpleMessage("장착된 서번트"),
        "ce_max_limit_break": MessageLookupByLibrary.simpleMessage("최종 재림"),
        "ce_status": MessageLookupByLibrary.simpleMessage("도감 상태"),
        "ce_status_met": MessageLookupByLibrary.simpleMessage("이미 조우"),
        "ce_status_not_met": MessageLookupByLibrary.simpleMessage("미조우"),
        "ce_status_owned": MessageLookupByLibrary.simpleMessage("계약자"),
        "ce_type_mix_hp_atk": MessageLookupByLibrary.simpleMessage("혼합"),
        "ce_type_none_hp_atk": MessageLookupByLibrary.simpleMessage("ATK"),
        "ce_type_pure_atk": MessageLookupByLibrary.simpleMessage("ATK"),
        "ce_type_pure_hp": MessageLookupByLibrary.simpleMessage("HP"),
        "chaldea_account": MessageLookupByLibrary.simpleMessage("Chaldea 계정"),
        "chaldea_account_system_hint": MessageLookupByLibrary.simpleMessage(
            "V1 데이터와 호환되지 않습니다\n사용자 데이터 백업 및 다중 장치 동기화를 위한 간단한 계정 시스템입니다\n보안이 보장되지 않는 한 일반 비밀번호를 설정하지 마십시오\n위의 서비스가 필요하지 않으시면 회원가입을 하지 않으셔도 됩니다"),
        "chaldea_backup": MessageLookupByLibrary.simpleMessage("Chaldea 백업"),
        "chaldea_gate": MessageLookupByLibrary.simpleMessage("칼데아 게이트"),
        "chaldea_server": MessageLookupByLibrary.simpleMessage("Chaldea 서버"),
        "chaldea_server_cn": MessageLookupByLibrary.simpleMessage("중국"),
        "chaldea_server_global": MessageLookupByLibrary.simpleMessage("국제성"),
        "chaldea_server_hint":
            MessageLookupByLibrary.simpleMessage("게임 데이터와 스크린샷 레코그나이저에 사용"),
        "chaldea_share_msg": m1,
        "change_log": MessageLookupByLibrary.simpleMessage("업데이트 내역"),
        "characters_in_card": MessageLookupByLibrary.simpleMessage("캐릭터"),
        "check_file_hash": MessageLookupByLibrary.simpleMessage("파일 완전성 확인"),
        "check_update": MessageLookupByLibrary.simpleMessage("업데이트 확인"),
        "clear": MessageLookupByLibrary.simpleMessage("지우기"),
        "clear_cache": MessageLookupByLibrary.simpleMessage("캐시 삭제하기"),
        "clear_cache_finish": MessageLookupByLibrary.simpleMessage("캐시 삭제됨"),
        "clear_cache_hint":
            MessageLookupByLibrary.simpleMessage("일러스트와 음성을 포함"),
        "clear_data": MessageLookupByLibrary.simpleMessage("데이터 클리어"),
        "coin_summon_num": MessageLookupByLibrary.simpleMessage("소환 소득"),
        "command_code": MessageLookupByLibrary.simpleMessage("커맨드 코드"),
        "confirm": MessageLookupByLibrary.simpleMessage("확인"),
        "consumed": MessageLookupByLibrary.simpleMessage("소비량"),
        "contact_information_not_filled":
            MessageLookupByLibrary.simpleMessage("연락처 정보가 입력되어있지 않습니다"),
        "contact_information_not_filled_warning":
            MessageLookupByLibrary.simpleMessage("개발자는 당신의 피드백에 응답할 수 없게 됩니다"),
        "copied": MessageLookupByLibrary.simpleMessage("복사됨"),
        "copy": MessageLookupByLibrary.simpleMessage("복사하기"),
        "copy_plan_menu": MessageLookupByLibrary.simpleMessage("다른 플랜에서 복사"),
        "costume": MessageLookupByLibrary.simpleMessage("영의"),
        "costume_unlock": MessageLookupByLibrary.simpleMessage("영의개방"),
        "counts": MessageLookupByLibrary.simpleMessage("카운트"),
        "craft_essence": MessageLookupByLibrary.simpleMessage("개념예장"),
        "create_account_textfield_helper":
            MessageLookupByLibrary.simpleMessage("더 많은 계정을 나중에 추가할 수 있습니다"),
        "create_duplicated_svt":
            MessageLookupByLibrary.simpleMessage("2호기 생성하기"),
        "crit_star_mod": MessageLookupByLibrary.simpleMessage("스타 보정"),
        "cur_account": MessageLookupByLibrary.simpleMessage("계정"),
        "current_": MessageLookupByLibrary.simpleMessage("현재"),
        "current_version": MessageLookupByLibrary.simpleMessage("현재 버전"),
        "custom_mission": MessageLookupByLibrary.simpleMessage("맞춤 임무"),
        "custom_mission_nothing_hint":
            MessageLookupByLibrary.simpleMessage("미션이 없습니다 +를 클릭하여 추가합시다"),
        "custom_mission_source_mission":
            MessageLookupByLibrary.simpleMessage("오리지널 미션"),
        "dark_mode": MessageLookupByLibrary.simpleMessage("다크 모드"),
        "dark_mode_dark": MessageLookupByLibrary.simpleMessage("다크"),
        "dark_mode_light": MessageLookupByLibrary.simpleMessage("라이트"),
        "dark_mode_system": MessageLookupByLibrary.simpleMessage("시스템"),
        "database": MessageLookupByLibrary.simpleMessage("데이터베이스"),
        "database_not_downloaded":
            MessageLookupByLibrary.simpleMessage("데이터베이스를 다운로드하지 않지만 계속됩니까?"),
        "dataset_version": MessageLookupByLibrary.simpleMessage("데이터 세트 버전"),
        "date": MessageLookupByLibrary.simpleMessage("일"),
        "debug": MessageLookupByLibrary.simpleMessage("Debug"),
        "debug_fab": MessageLookupByLibrary.simpleMessage("Debug FAB"),
        "debug_menu": MessageLookupByLibrary.simpleMessage("Debug Menu"),
        "def_np_gain_mod": MessageLookupByLibrary.simpleMessage("적 공격 보정"),
        "delete": MessageLookupByLibrary.simpleMessage("삭제"),
        "demands": MessageLookupByLibrary.simpleMessage("요구량"),
        "desktop_only": MessageLookupByLibrary.simpleMessage("데스크탑 만"),
        "display_grid": MessageLookupByLibrary.simpleMessage("그리드"),
        "display_list": MessageLookupByLibrary.simpleMessage("리스트"),
        "display_setting": MessageLookupByLibrary.simpleMessage("화면 설정"),
        "display_show_window_fab":
            MessageLookupByLibrary.simpleMessage("멀티 윈도우 버튼 표시"),
        "done": MessageLookupByLibrary.simpleMessage("완성"),
        "download": MessageLookupByLibrary.simpleMessage("다운로드"),
        "download_latest_gamedata_hint": MessageLookupByLibrary.simpleMessage(
            "호환을 위해 앱을 최신 버전으로 업그레이드하십시오."),
        "download_source": MessageLookupByLibrary.simpleMessage("다운로드 소스"),
        "download_source_hint":
            MessageLookupByLibrary.simpleMessage("중국 대륙이라면 중국 엔드포인트를 선택"),
        "downloaded": MessageLookupByLibrary.simpleMessage("다운로드 끝남"),
        "downloading": MessageLookupByLibrary.simpleMessage("다운로드 중"),
        "drop_calc_empty_hint":
            MessageLookupByLibrary.simpleMessage("+를 클릭하여 아이템 추가"),
        "drop_calc_min_ap": MessageLookupByLibrary.simpleMessage("최소 AP"),
        "drop_calc_solve": MessageLookupByLibrary.simpleMessage("풀이"),
        "drop_rate": MessageLookupByLibrary.simpleMessage("드롭률"),
        "duplicated_servant": MessageLookupByLibrary.simpleMessage("2호기"),
        "duplicated_servant_duplicated":
            MessageLookupByLibrary.simpleMessage("2호기"),
        "duplicated_servant_primary":
            MessageLookupByLibrary.simpleMessage("초호기"),
        "edit": MessageLookupByLibrary.simpleMessage("수정"),
        "effect_scope": MessageLookupByLibrary.simpleMessage("효과 범위"),
        "effect_search": MessageLookupByLibrary.simpleMessage("효과 검색"),
        "effect_target": MessageLookupByLibrary.simpleMessage("효과 대상"),
        "effect_type": MessageLookupByLibrary.simpleMessage("효과 타입"),
        "effective_condition": MessageLookupByLibrary.simpleMessage("발동 조건"),
        "efficiency": MessageLookupByLibrary.simpleMessage("효율"),
        "efficiency_type": MessageLookupByLibrary.simpleMessage("효율 타입"),
        "efficiency_type_ap": MessageLookupByLibrary.simpleMessage("20AP 효율"),
        "efficiency_type_drop": MessageLookupByLibrary.simpleMessage("드롭률"),
        "email": MessageLookupByLibrary.simpleMessage("메일"),
        "enemy": MessageLookupByLibrary.simpleMessage("적인"),
        "enemy_filter_trait_hint":
            MessageLookupByLibrary.simpleMessage("특성 필터는 프리퀘스트 적에게만 적용"),
        "enemy_list": MessageLookupByLibrary.simpleMessage("적"),
        "enhance": MessageLookupByLibrary.simpleMessage("강화"),
        "enhance_warning":
            MessageLookupByLibrary.simpleMessage("강화하게 되면 다음 아이템이 소비됩니다"),
        "error": MessageLookupByLibrary.simpleMessage("오류"),
        "error_no_data_found":
            MessageLookupByLibrary.simpleMessage("버전 정보를 찾을 수 없습니다"),
        "error_no_internet": MessageLookupByLibrary.simpleMessage("인터넷 연결 없음"),
        "error_required_app_version": m2,
        "event_ap_cost_half":
            MessageLookupByLibrary.simpleMessage("소비 AP 50% DOWN"),
        "event_bonus": MessageLookupByLibrary.simpleMessage("보너스"),
        "event_bulletin_board": MessageLookupByLibrary.simpleMessage("피전 레포트"),
        "event_campaign": MessageLookupByLibrary.simpleMessage("캠페인"),
        "event_collect_item_confirm": MessageLookupByLibrary.simpleMessage(
            "모든 아이템을 창고에 추가하고 플랜에서 이벤트를 삭제합니다"),
        "event_collect_items": MessageLookupByLibrary.simpleMessage("아이템 수집"),
        "event_cooltime": MessageLookupByLibrary.simpleMessage("쿨타임"),
        "event_digging": MessageLookupByLibrary.simpleMessage("파다"),
        "event_item_extra": MessageLookupByLibrary.simpleMessage("기타 아이템"),
        "event_item_fixed_extra":
            MessageLookupByLibrary.simpleMessage("기타 고정 아이템"),
        "event_lottery": MessageLookupByLibrary.simpleMessage("룰렛"),
        "event_lottery_limit_hint": m3,
        "event_lottery_limited": MessageLookupByLibrary.simpleMessage("제한된 룰렛"),
        "event_lottery_unit": MessageLookupByLibrary.simpleMessage("룰렛"),
        "event_lottery_unlimited":
            MessageLookupByLibrary.simpleMessage("무제한 룰렛"),
        "event_not_planned":
            MessageLookupByLibrary.simpleMessage("이벤트가 계획되지 않았습니다"),
        "event_point": MessageLookupByLibrary.simpleMessage("이벤트 포인트"),
        "event_point_reward": MessageLookupByLibrary.simpleMessage("포인트"),
        "event_progress": MessageLookupByLibrary.simpleMessage("진행 중인 이벤트"),
        "event_quest": MessageLookupByLibrary.simpleMessage("이벤트 퀘스트"),
        "event_recipe": MessageLookupByLibrary.simpleMessage("레시피"),
        "event_rerun_replace_grail": m4,
        "event_shop": MessageLookupByLibrary.simpleMessage("상점"),
        "event_title": MessageLookupByLibrary.simpleMessage("이벤트"),
        "event_tower": MessageLookupByLibrary.simpleMessage("타워"),
        "event_treasure_box": MessageLookupByLibrary.simpleMessage("보물 상자"),
        "exchange_ticket": MessageLookupByLibrary.simpleMessage("교환 티켓"),
        "exchange_ticket_short": MessageLookupByLibrary.simpleMessage("티켓"),
        "exp_card_plan_lv": MessageLookupByLibrary.simpleMessage("레벨"),
        "exp_card_plan_next": MessageLookupByLibrary.simpleMessage("다음"),
        "exp_card_same_class": MessageLookupByLibrary.simpleMessage("같은 클래스"),
        "exp_card_title": MessageLookupByLibrary.simpleMessage("경험치 카드"),
        "failed": MessageLookupByLibrary.simpleMessage("실패"),
        "faq": MessageLookupByLibrary.simpleMessage("FAQ"),
        "favorite": MessageLookupByLibrary.simpleMessage("즐겨찾기"),
        "feedback_add_attachments":
            MessageLookupByLibrary.simpleMessage("e.g. 스크린샷, 기타 파일"),
        "feedback_contact": MessageLookupByLibrary.simpleMessage("연락처 정보"),
        "feedback_content_hint":
            MessageLookupByLibrary.simpleMessage("피드백 또는 제안"),
        "feedback_form_alert":
            MessageLookupByLibrary.simpleMessage("피드백은 전송되지 않습니다만, 종료하시겠습니까?"),
        "feedback_info": MessageLookupByLibrary.simpleMessage(
            "피드백을 전송하기 전에, <**FAQ**>를 확인해주세요. 피드백을 적을 때에는 상세하게 적어주시길 바랍니다.\n- 재현 방법/기대하고 있는 퍼포먼스\n- 앱/데이터의 버전, 디바이스 시스템/버전\n- 스크린샷과 로그를 첨부한다\n- 마지막으로, 연락처 정보(전자메일 등)을 적어주시는 것이 좋습니다"),
        "feedback_send": MessageLookupByLibrary.simpleMessage("전송"),
        "feedback_subject": MessageLookupByLibrary.simpleMessage("항목명"),
        "ffo_body": MessageLookupByLibrary.simpleMessage("몸"),
        "ffo_crop": MessageLookupByLibrary.simpleMessage("자르기"),
        "ffo_head": MessageLookupByLibrary.simpleMessage("머리"),
        "ffo_missing_data_hint":
            MessageLookupByLibrary.simpleMessage("먼저 FFO데이터를 다운로드하거나 가져오세요↗"),
        "ffo_same_svt": MessageLookupByLibrary.simpleMessage("동일 서번트"),
        "fgo_domus_aurea": MessageLookupByLibrary.simpleMessage("도무스 아우레아"),
        "file_not_found_or_mismatched_hash": m15,
        "filename": MessageLookupByLibrary.simpleMessage("파일명"),
        "fill_email_warning":
            MessageLookupByLibrary.simpleMessage("연락처 정보가 없다면 답장이 불가능합니다."),
        "filter": MessageLookupByLibrary.simpleMessage("필터"),
        "filter_atk_hp_type": MessageLookupByLibrary.simpleMessage("타입"),
        "filter_attribute": MessageLookupByLibrary.simpleMessage("속성"),
        "filter_category": MessageLookupByLibrary.simpleMessage("카테고리"),
        "filter_effects": MessageLookupByLibrary.simpleMessage("효과"),
        "filter_gender": MessageLookupByLibrary.simpleMessage("성별"),
        "filter_match_all": MessageLookupByLibrary.simpleMessage("모두 선택"),
        "filter_obtain": MessageLookupByLibrary.simpleMessage("습득 방법"),
        "filter_plan_not_reached":
            MessageLookupByLibrary.simpleMessage("계획 미달성"),
        "filter_plan_reached": MessageLookupByLibrary.simpleMessage("계획 달성"),
        "filter_revert": MessageLookupByLibrary.simpleMessage("역선택"),
        "filter_shown_type": MessageLookupByLibrary.simpleMessage("표시"),
        "filter_skill_lv": MessageLookupByLibrary.simpleMessage("스킬 레벨"),
        "filter_sort": MessageLookupByLibrary.simpleMessage("정렬"),
        "filter_sort_class": MessageLookupByLibrary.simpleMessage("클래스"),
        "filter_sort_number": MessageLookupByLibrary.simpleMessage("번호"),
        "filter_sort_rarity": MessageLookupByLibrary.simpleMessage("레어도"),
        "foukun": MessageLookupByLibrary.simpleMessage("포우"),
        "free_progress": MessageLookupByLibrary.simpleMessage("퀘스트"),
        "free_progress_newest": MessageLookupByLibrary.simpleMessage("최신(일그오)"),
        "free_quest": MessageLookupByLibrary.simpleMessage("프리 퀘스트"),
        "free_quest_calculator": MessageLookupByLibrary.simpleMessage("프리 퀘스트"),
        "free_quest_calculator_short":
            MessageLookupByLibrary.simpleMessage("프리 퀘스트"),
        "gacha_prob_calc": MessageLookupByLibrary.simpleMessage("가차 확률 계산"),
        "gacha_prob_ce_pickup": m16,
        "gacha_prob_custom_rate": MessageLookupByLibrary.simpleMessage("맞춤 확률"),
        "gacha_prob_precision_hint": MessageLookupByLibrary.simpleMessage(
            "값이 너무 크거나 작으면 double 정밀도 문제로 인해 계산 결과가 부정확합니다."),
        "gacha_prob_svt_pickup": m17,
        "gallery_tab_name": MessageLookupByLibrary.simpleMessage("홈"),
        "game_account": MessageLookupByLibrary.simpleMessage("게임 계정"),
        "game_data_not_found": MessageLookupByLibrary.simpleMessage(
            "게임 정보를 찾을 수 없습니다. 먼저 다운로드 해 주시기 바랍니다"),
        "game_drop": MessageLookupByLibrary.simpleMessage("드롭"),
        "game_experience": MessageLookupByLibrary.simpleMessage("경험치"),
        "game_kizuna": MessageLookupByLibrary.simpleMessage("몽화"),
        "game_rewards": MessageLookupByLibrary.simpleMessage("보상"),
        "game_server": MessageLookupByLibrary.simpleMessage("게임 서버"),
        "gamedata": MessageLookupByLibrary.simpleMessage("게임 데이터"),
        "general_all": MessageLookupByLibrary.simpleMessage("모두"),
        "general_close": MessageLookupByLibrary.simpleMessage("닫기"),
        "general_custom": MessageLookupByLibrary.simpleMessage("맞춤"),
        "general_default": MessageLookupByLibrary.simpleMessage("디폴트"),
        "general_others": MessageLookupByLibrary.simpleMessage("기타"),
        "general_special": MessageLookupByLibrary.simpleMessage("스페셜"),
        "general_type": MessageLookupByLibrary.simpleMessage("타이프"),
        "gold": MessageLookupByLibrary.simpleMessage("금색"),
        "grail": MessageLookupByLibrary.simpleMessage("성배"),
        "grail_up": MessageLookupByLibrary.simpleMessage("성배전림"),
        "growth_curve": MessageLookupByLibrary.simpleMessage("성장 곡선"),
        "guda_female": MessageLookupByLibrary.simpleMessage("구다코"),
        "guda_male": MessageLookupByLibrary.simpleMessage("구다오"),
        "help": MessageLookupByLibrary.simpleMessage("도움말"),
        "hide_outdated": MessageLookupByLibrary.simpleMessage("기간종료 숨기기"),
        "hide_svt_plan_details":
            MessageLookupByLibrary.simpleMessage("계획 세부 숨기기"),
        "hide_svt_plan_details_hint": MessageLookupByLibrary.simpleMessage(
            "계획 탭에 만 안 표시.\n실제로는 아이템 계획 및 통계에 포함되어 있어."),
        "hide_unreleased_card":
            MessageLookupByLibrary.simpleMessage("미구현 서번트 숨기기"),
        "high_difficulty_quest":
            MessageLookupByLibrary.simpleMessage("고난이도 퀘스트"),
        "http_sniff_hint": MessageLookupByLibrary.simpleMessage(
            "(NA/JP/CN/TW)계정 로그인 시 데이터 캡쳐, KR은 지원하지 않습니다"),
        "https_sniff": MessageLookupByLibrary.simpleMessage("Https 스나이핑"),
        "hunting_quest": MessageLookupByLibrary.simpleMessage("헌팅 퀘스트"),
        "icons": MessageLookupByLibrary.simpleMessage("아이콘"),
        "ignore": MessageLookupByLibrary.simpleMessage("무시"),
        "illustration": MessageLookupByLibrary.simpleMessage("일러스트"),
        "illustrator": MessageLookupByLibrary.simpleMessage("일러스트레이터"),
        "import_active_skill_hint":
            MessageLookupByLibrary.simpleMessage("강화 - 서번트 스킬 강화"),
        "import_active_skill_screenshots":
            MessageLookupByLibrary.simpleMessage("액티브 스킬 스크린샷"),
        "import_append_skill_hint":
            MessageLookupByLibrary.simpleMessage("강화 - 어펜드 스킬 강화"),
        "import_append_skill_screenshots":
            MessageLookupByLibrary.simpleMessage("어펜드 스킬 스크린샷"),
        "import_backup": MessageLookupByLibrary.simpleMessage("백업 불러오기"),
        "import_csv_export_all": MessageLookupByLibrary.simpleMessage("모든 서번트"),
        "import_csv_export_empty":
            MessageLookupByLibrary.simpleMessage("빈 템플릿"),
        "import_csv_export_favorite":
            MessageLookupByLibrary.simpleMessage("팔로우하는 서번트만"),
        "import_csv_export_template":
            MessageLookupByLibrary.simpleMessage("템플릿 내보내기"),
        "import_csv_load_csv": MessageLookupByLibrary.simpleMessage("CSV 로드"),
        "import_csv_title": MessageLookupByLibrary.simpleMessage("CSV 템플릿"),
        "import_data": MessageLookupByLibrary.simpleMessage("불러오기"),
        "import_data_error": m5,
        "import_data_success":
            MessageLookupByLibrary.simpleMessage("불러오기를 성공했습니다"),
        "import_from_clipboard": MessageLookupByLibrary.simpleMessage("클립보드에서"),
        "import_from_file": MessageLookupByLibrary.simpleMessage("파일에서"),
        "import_http_body_duplicated":
            MessageLookupByLibrary.simpleMessage("중복 서번트"),
        "import_http_body_hint": MessageLookupByLibrary.simpleMessage(
            "복호환된 HTTPS 응답을 출력하기 위해 출력버튼을 누르세요"),
        "import_http_body_hint_hide":
            MessageLookupByLibrary.simpleMessage("서번트를 클릭해서 숨기기,표시하기"),
        "import_http_body_locked":
            MessageLookupByLibrary.simpleMessage("잠금된것만"),
        "import_image": MessageLookupByLibrary.simpleMessage("이미지 가져오기"),
        "import_item_hint":
            MessageLookupByLibrary.simpleMessage("마이룸 - 아이템 리스트"),
        "import_item_screenshots":
            MessageLookupByLibrary.simpleMessage("아이템 스크린샷"),
        "import_screenshot": MessageLookupByLibrary.simpleMessage("스크린샷 가져오기"),
        "import_screenshot_hint":
            MessageLookupByLibrary.simpleMessage("식별된 결과만 업데이트"),
        "import_screenshot_update_items":
            MessageLookupByLibrary.simpleMessage("갱신소재"),
        "import_source_file":
            MessageLookupByLibrary.simpleMessage("소스 파일 가져오기"),
        "import_userdata_more":
            MessageLookupByLibrary.simpleMessage("이외의 불러오는 방법"),
        "info_agility": MessageLookupByLibrary.simpleMessage("민첩"),
        "info_alignment": MessageLookupByLibrary.simpleMessage("성향"),
        "info_bond_points": MessageLookupByLibrary.simpleMessage("인연 포인트"),
        "info_bond_points_single": MessageLookupByLibrary.simpleMessage("포인트"),
        "info_bond_points_sum": MessageLookupByLibrary.simpleMessage("합계"),
        "info_cards": MessageLookupByLibrary.simpleMessage("카드"),
        "info_charge": MessageLookupByLibrary.simpleMessage("차지"),
        "info_critical_rate": MessageLookupByLibrary.simpleMessage("스타 집중도"),
        "info_cv": MessageLookupByLibrary.simpleMessage("CV"),
        "info_death_rate": MessageLookupByLibrary.simpleMessage("즉사율"),
        "info_endurance": MessageLookupByLibrary.simpleMessage("내구"),
        "info_gender": MessageLookupByLibrary.simpleMessage("성별"),
        "info_luck": MessageLookupByLibrary.simpleMessage("행운"),
        "info_mana": MessageLookupByLibrary.simpleMessage("마력"),
        "info_np": MessageLookupByLibrary.simpleMessage("보구"),
        "info_np_rate": MessageLookupByLibrary.simpleMessage("NP 수급률"),
        "info_star_rate": MessageLookupByLibrary.simpleMessage("스타 수급률"),
        "info_strength": MessageLookupByLibrary.simpleMessage("근력"),
        "info_trait": MessageLookupByLibrary.simpleMessage("속성"),
        "info_value": MessageLookupByLibrary.simpleMessage("값"),
        "input_invalid_hint":
            MessageLookupByLibrary.simpleMessage("입력이 유효하지 않습니다"),
        "install": MessageLookupByLibrary.simpleMessage("설치"),
        "interlude": MessageLookupByLibrary.simpleMessage("막간의 이야기"),
        "interlude_and_rankup":
            MessageLookupByLibrary.simpleMessage("막간퀘 및 강화퀘"),
        "invalid_input": MessageLookupByLibrary.simpleMessage("잘못된 입력입니다"),
        "invalid_startup_path":
            MessageLookupByLibrary.simpleMessage("잘못된 시작 경로입니다"),
        "invalid_startup_path_info": MessageLookupByLibrary.simpleMessage(
            "시스템 폴더가 아닌 곳에 zip을 추출 후 시작해 주시기 바랍니다, \"C:\\\", \"C:\\Program Files\" 는 사용할 수 없습니다"),
        "ios_app_path": MessageLookupByLibrary.simpleMessage(
            "\"Files\" app/On My iPhone/Chaldea"),
        "issues": MessageLookupByLibrary.simpleMessage("문제"),
        "item": MessageLookupByLibrary.simpleMessage("아이템"),
        "item_already_exist_hint": m6,
        "item_apple": MessageLookupByLibrary.simpleMessage("사과"),
        "item_category_ascension":
            MessageLookupByLibrary.simpleMessage("영기재림 재료"),
        "item_category_bronze": MessageLookupByLibrary.simpleMessage("동색 아이템"),
        "item_category_event_svt_ascension":
            MessageLookupByLibrary.simpleMessage("이벤트 아이템"),
        "item_category_gem": MessageLookupByLibrary.simpleMessage("휘석"),
        "item_category_gems": MessageLookupByLibrary.simpleMessage("스킬 강화 아이템"),
        "item_category_gold": MessageLookupByLibrary.simpleMessage("금색 아이템"),
        "item_category_magic_gem": MessageLookupByLibrary.simpleMessage("마석"),
        "item_category_monument": MessageLookupByLibrary.simpleMessage("모뉴먼트"),
        "item_category_others": MessageLookupByLibrary.simpleMessage("기타"),
        "item_category_piece": MessageLookupByLibrary.simpleMessage("피스"),
        "item_category_secret_gem": MessageLookupByLibrary.simpleMessage("비석"),
        "item_category_silver": MessageLookupByLibrary.simpleMessage("은색 아이템"),
        "item_category_special": MessageLookupByLibrary.simpleMessage("특별 아이템"),
        "item_category_usual": MessageLookupByLibrary.simpleMessage("아이템"),
        "item_edit_owned_amount":
            MessageLookupByLibrary.simpleMessage("소유 수량 수정"),
        "item_eff": MessageLookupByLibrary.simpleMessage("아이템 효율"),
        "item_exceed_hint": MessageLookupByLibrary.simpleMessage(
            "플랜을 계산하기 전에 초과한 재료를 설정할 수 있습니다(프리퀘스트 플랜의 경우에만)"),
        "item_grail2crystal": MessageLookupByLibrary.simpleMessage("성배→전승 결정"),
        "item_left": MessageLookupByLibrary.simpleMessage("나머지"),
        "item_no_free_quests": MessageLookupByLibrary.simpleMessage("프리퀘스트 없음"),
        "item_only_show_lack":
            MessageLookupByLibrary.simpleMessage("부족한 것만 표시"),
        "item_own": MessageLookupByLibrary.simpleMessage("소유"),
        "item_screenshot": MessageLookupByLibrary.simpleMessage("아이템 캡처"),
        "item_stat_include_owned":
            MessageLookupByLibrary.simpleMessage("재고 포함"),
        "item_stat_sub_event": MessageLookupByLibrary.simpleMessage("이벤트 제외"),
        "item_stat_sub_owned": MessageLookupByLibrary.simpleMessage("재고 제외"),
        "item_title": MessageLookupByLibrary.simpleMessage("아이템"),
        "item_total_demand": MessageLookupByLibrary.simpleMessage("합계"),
        "join_beta": MessageLookupByLibrary.simpleMessage("베타 프로그램에 참가하기"),
        "jump_to": m7,
        "language": MessageLookupByLibrary.simpleMessage("한국어"),
        "language_en": MessageLookupByLibrary.simpleMessage("Korean"),
        "level": MessageLookupByLibrary.simpleMessage("레벨"),
        "limited_event": MessageLookupByLibrary.simpleMessage("기간 한정 이벤트"),
        "link": MessageLookupByLibrary.simpleMessage("링크"),
        "list_count_shown_all": m18,
        "list_count_shown_hidden_all": m19,
        "list_end_hint": m8,
        "load_ffo_data": MessageLookupByLibrary.simpleMessage("FFO 데이터 로드"),
        "login_change_name": MessageLookupByLibrary.simpleMessage("사용자 이름 변경"),
        "login_change_password":
            MessageLookupByLibrary.simpleMessage("비밀번호 변경"),
        "login_confirm_password":
            MessageLookupByLibrary.simpleMessage("비밀번호 확인"),
        "login_first_hint":
            MessageLookupByLibrary.simpleMessage("먼저 로그인을 해주세요"),
        "login_forget_pwd":
            MessageLookupByLibrary.simpleMessage("비밀번호를 잊어버렸습니다"),
        "login_login": MessageLookupByLibrary.simpleMessage("로그인"),
        "login_logout": MessageLookupByLibrary.simpleMessage("로그아웃"),
        "login_new_name": MessageLookupByLibrary.simpleMessage("새 사용자 이름"),
        "login_new_password": MessageLookupByLibrary.simpleMessage("새 비밀번호"),
        "login_password": MessageLookupByLibrary.simpleMessage("비밀번호"),
        "login_password_error": MessageLookupByLibrary.simpleMessage(
            "6-18자리의 문자와 숫자만, 최소한 하나 이상의 영어 문자를 포함하십시오."),
        "login_password_error_same_as_old":
            MessageLookupByLibrary.simpleMessage("이전 비밀번호와 같음"),
        "login_signup": MessageLookupByLibrary.simpleMessage("회원가입"),
        "login_state_not_login":
            MessageLookupByLibrary.simpleMessage("로그인이 필요합니다"),
        "login_username": MessageLookupByLibrary.simpleMessage("사용자 이름"),
        "login_username_error":
            MessageLookupByLibrary.simpleMessage("4자리 이상의 문자 또는 숫자로 구성할수 있습니다"),
        "long_press_to_save_hint":
            MessageLookupByLibrary.simpleMessage("길게 눌러서 저장"),
        "lottery_cost_per_roll": MessageLookupByLibrary.simpleMessage("1롤의 비용"),
        "lucky_bag": MessageLookupByLibrary.simpleMessage("복주머니"),
        "lucky_bag_expectation": MessageLookupByLibrary.simpleMessage("기대치"),
        "lucky_bag_expectation_short":
            MessageLookupByLibrary.simpleMessage("기대치"),
        "lucky_bag_rating": MessageLookupByLibrary.simpleMessage("스코어링"),
        "lucky_bag_tooltip_unwanted":
            MessageLookupByLibrary.simpleMessage("정말로 불필요함"),
        "lucky_bag_tooltip_wanted":
            MessageLookupByLibrary.simpleMessage("정말로 원함"),
        "main_interlude": MessageLookupByLibrary.simpleMessage("메인 인터루드"),
        "main_quest": MessageLookupByLibrary.simpleMessage("메인 퀘스트"),
        "main_story": MessageLookupByLibrary.simpleMessage("메인 스토리"),
        "main_story_chapter": MessageLookupByLibrary.simpleMessage("챕터"),
        "master_detail_width":
            MessageLookupByLibrary.simpleMessage("Master-Detail width"),
        "master_mission": MessageLookupByLibrary.simpleMessage("마스터 미션"),
        "master_mission_related_quest":
            MessageLookupByLibrary.simpleMessage("관련된 퀘스트"),
        "master_mission_solution": MessageLookupByLibrary.simpleMessage("풀이"),
        "master_mission_tasklist": MessageLookupByLibrary.simpleMessage("미션"),
        "master_mission_weekly": MessageLookupByLibrary.simpleMessage("주간 미션"),
        "migrate_external_storage_btn_no":
            MessageLookupByLibrary.simpleMessage("이동시키지 않음"),
        "migrate_external_storage_btn_yes":
            MessageLookupByLibrary.simpleMessage("이동"),
        "migrate_external_storage_manual_warning":
            MessageLookupByLibrary.simpleMessage(
                "데이터를 수동으로 이동시켜주세요. 그렇지않으면 기동 후에 데이터가 날아가버립니다."),
        "migrate_external_storage_title":
            MessageLookupByLibrary.simpleMessage("데이터 이동"),
        "mission": MessageLookupByLibrary.simpleMessage("미션"),
        "move_down": MessageLookupByLibrary.simpleMessage("다운"),
        "move_up": MessageLookupByLibrary.simpleMessage("업"),
        "mystic_code": MessageLookupByLibrary.simpleMessage("마술예장"),
        "network_cur_connection": MessageLookupByLibrary.simpleMessage("코넥션"),
        "network_force_online":
            MessageLookupByLibrary.simpleMessage("강제 온라인 모드"),
        "network_force_online_hint": MessageLookupByLibrary.simpleMessage(
            "네트워크가 감지되지 않으면 앱이 오프라인 모드로 변경됩니다."),
        "network_settings": MessageLookupByLibrary.simpleMessage("네트워크 설정"),
        "new_account": MessageLookupByLibrary.simpleMessage("새 계정 추가"),
        "new_data_available":
            MessageLookupByLibrary.simpleMessage("사용 가능한 업데이트 있음"),
        "new_drop_data_6th": MessageLookupByLibrary.simpleMessage("새로운 드롭 데이터"),
        "next_card": MessageLookupByLibrary.simpleMessage("다음"),
        "next_page": MessageLookupByLibrary.simpleMessage("다음 페이지"),
        "no_servant_quest_hint":
            MessageLookupByLibrary.simpleMessage("막간의 이야기 또는 강화 퀘스트가 없습니다"),
        "no_servant_quest_hint_subtitle":
            MessageLookupByLibrary.simpleMessage("♡를 클릭해서 모든 퀘스트를 표시합니다"),
        "noble_phantasm": MessageLookupByLibrary.simpleMessage("보구"),
        "noble_phantasm_level": MessageLookupByLibrary.simpleMessage("보구 레벨"),
        "not_found": MessageLookupByLibrary.simpleMessage("Not Found"),
        "not_implemented": MessageLookupByLibrary.simpleMessage("아직 구현되지 않음"),
        "not_outdated": MessageLookupByLibrary.simpleMessage("만료되지 않음"),
        "np_gain_mod": MessageLookupByLibrary.simpleMessage("적 피격 보정"),
        "np_short": MessageLookupByLibrary.simpleMessage("보구"),
        "obtain_time": MessageLookupByLibrary.simpleMessage("시간"),
        "ok": MessageLookupByLibrary.simpleMessage("확인"),
        "one_off_quest": MessageLookupByLibrary.simpleMessage("일회성 퀘스트"),
        "only_show_main_story_enemy":
            MessageLookupByLibrary.simpleMessage("프리 퀘스트 의 적인 표시 만"),
        "open": MessageLookupByLibrary.simpleMessage("열기"),
        "open_condition": MessageLookupByLibrary.simpleMessage("개방 조건"),
        "open_in_file_manager":
            MessageLookupByLibrary.simpleMessage("파일 매니저로 열어주십시오"),
        "outdated": MessageLookupByLibrary.simpleMessage("기간종료"),
        "overview": MessageLookupByLibrary.simpleMessage("개요"),
        "passive_skill": MessageLookupByLibrary.simpleMessage("클래스 스킬"),
        "passive_skill_short": MessageLookupByLibrary.simpleMessage("클래스"),
        "plan": MessageLookupByLibrary.simpleMessage("계획"),
        "plan_list_only_unlock_append":
            MessageLookupByLibrary.simpleMessage("잠금 해제된 어펜드 만"),
        "plan_list_set_all": MessageLookupByLibrary.simpleMessage("일괄 설정"),
        "plan_list_set_all_current": MessageLookupByLibrary.simpleMessage("현재"),
        "plan_list_set_all_target": MessageLookupByLibrary.simpleMessage("목표"),
        "plan_max10": MessageLookupByLibrary.simpleMessage("계획 최대(310)"),
        "plan_max9": MessageLookupByLibrary.simpleMessage("계획 최대(999)"),
        "plan_objective": MessageLookupByLibrary.simpleMessage("계획 목표"),
        "plan_title": MessageLookupByLibrary.simpleMessage("계획표"),
        "planning_free_quest_btn":
            MessageLookupByLibrary.simpleMessage("퀘스트 계획"),
        "prefer_april_fool_icon":
            MessageLookupByLibrary.simpleMessage("만우절 아이콘 우선"),
        "preferred_translation":
            MessageLookupByLibrary.simpleMessage("선호하는 번역"),
        "preferred_translation_footer": MessageLookupByLibrary.simpleMessage(
            "드래그하여 주문을 변경합니다.\nUI 언어가 아닌 게임 데이터 설명에 사용됩니다. 일부 언어에는 번역되지 않은 부분이 있다."),
        "prev_page": MessageLookupByLibrary.simpleMessage("이전 페이지"),
        "preview": MessageLookupByLibrary.simpleMessage("미리보기"),
        "previous_card": MessageLookupByLibrary.simpleMessage("이전"),
        "priority": MessageLookupByLibrary.simpleMessage("우선 순위"),
        "priority_tagging_hint": MessageLookupByLibrary.simpleMessage(
            "태그는 짧게 해주세요. 너무 길면 전부 표시되지 않습니다"),
        "probability": MessageLookupByLibrary.simpleMessage("확률"),
        "probability_expectation": MessageLookupByLibrary.simpleMessage("기대"),
        "project_homepage": MessageLookupByLibrary.simpleMessage("프로젝트 홈페이지"),
        "quest": MessageLookupByLibrary.simpleMessage("퀘스트"),
        "quest_chapter_n": m9,
        "quest_condition": MessageLookupByLibrary.simpleMessage("개방 조건"),
        "quest_detail_btn": MessageLookupByLibrary.simpleMessage("세부"),
        "quest_enemy_summary_hint": MessageLookupByLibrary.simpleMessage(
            "메인 스토리의 무료 퀘스트에서 적에 대한 요약, 모든 속성은 서버에서 재정의될 수 있습니다. 참고용으로만.\n*특수* 특성은 적의 일부만이 이 가지고 있는 특성을 말한다."),
        "quest_fields": MessageLookupByLibrary.simpleMessage("필드"),
        "quest_fixed_drop": MessageLookupByLibrary.simpleMessage("드롭"),
        "quest_fixed_drop_short": MessageLookupByLibrary.simpleMessage("드롭"),
        "quest_not_found_error": m20,
        "quest_prefer_region": MessageLookupByLibrary.simpleMessage("선호하는 지역"),
        "quest_prefer_region_hint": MessageLookupByLibrary.simpleMessage(
            "퀘스트의 관련 이벤트가 선택된 지역에서 시작되지 않은 경우 JP로 돌아갑니다."),
        "quest_region_has_enemy_hint": MessageLookupByLibrary.simpleMessage(
            "JP(2020/11년 이후) 또는 NA(2020/12년 이후)만 적 데이터를 포함할 수 있습니다."),
        "quest_reward": MessageLookupByLibrary.simpleMessage("보너스"),
        "quest_reward_short": MessageLookupByLibrary.simpleMessage("보너스"),
        "random": MessageLookupByLibrary.simpleMessage("랜덤"),
        "rankup_timeline_hint":
            MessageLookupByLibrary.simpleMessage("일부 퀘스트의 시작 시간이 올바르지 않습니다."),
        "rarity": MessageLookupByLibrary.simpleMessage("레어도"),
        "rate_app_store":
            MessageLookupByLibrary.simpleMessage("App Store에서 평가"),
        "rate_play_store":
            MessageLookupByLibrary.simpleMessage("Google Play에서 평가"),
        "recognizer_result_count": m21,
        "region_cn": MessageLookupByLibrary.simpleMessage("간체 중국 서버"),
        "region_jp": MessageLookupByLibrary.simpleMessage("일본 서버"),
        "region_kr": MessageLookupByLibrary.simpleMessage("한국 서버"),
        "region_na": MessageLookupByLibrary.simpleMessage("미국 서버"),
        "region_notice": m10,
        "region_tw": MessageLookupByLibrary.simpleMessage("번체 중국 서버"),
        "remove_duplicated_svt":
            MessageLookupByLibrary.simpleMessage("2호기 삭제하기"),
        "remove_from_blacklist":
            MessageLookupByLibrary.simpleMessage("블랙리스트 삭제"),
        "rename": MessageLookupByLibrary.simpleMessage("이름 변경"),
        "rerun_event": MessageLookupByLibrary.simpleMessage("복각 이벤트"),
        "reset": MessageLookupByLibrary.simpleMessage("초기화"),
        "reset_custom_ascension_icon":
            MessageLookupByLibrary.simpleMessage("사용자 맞춤 서번트 아이콘 초기화"),
        "reset_plan_all": m11,
        "reset_plan_shown": m12,
        "resettable_digged_num":
            MessageLookupByLibrary.simpleMessage("필요한 파다 수 초기화"),
        "restart_to_apply_changes":
            MessageLookupByLibrary.simpleMessage("다시 시작하여 적용시키기"),
        "restart_to_upgrade_hint": MessageLookupByLibrary.simpleMessage(
            "업데이트 후 재시작합니다. 만약 업데이트에 실패했다면 수동으로 소스 파일을 다른곳에 옮겨주시기 바랍니다."),
        "restore": MessageLookupByLibrary.simpleMessage("복원"),
        "results": MessageLookupByLibrary.simpleMessage("결과"),
        "saint_quartz_plan": MessageLookupByLibrary.simpleMessage("성정석 저장 계획"),
        "same_event_plan": MessageLookupByLibrary.simpleMessage("같은 행사 계획 유지"),
        "save": MessageLookupByLibrary.simpleMessage("저장"),
        "save_to_photos": MessageLookupByLibrary.simpleMessage("사진 저장하기"),
        "saved": MessageLookupByLibrary.simpleMessage("저장됨"),
        "screen_size": MessageLookupByLibrary.simpleMessage("스크린 사이즈"),
        "screenshots": MessageLookupByLibrary.simpleMessage("스크린샷"),
        "search": MessageLookupByLibrary.simpleMessage("검색"),
        "search_option_basic": MessageLookupByLibrary.simpleMessage("기본 옵션"),
        "search_options": MessageLookupByLibrary.simpleMessage("검색 옵션"),
        "select_copy_plan_source":
            MessageLookupByLibrary.simpleMessage("복사할 파일을 선택"),
        "select_item_title": MessageLookupByLibrary.simpleMessage("아이템 선택"),
        "select_lang": MessageLookupByLibrary.simpleMessage("언어 선택"),
        "select_plan": MessageLookupByLibrary.simpleMessage("계획 선택"),
        "send_email_to": MessageLookupByLibrary.simpleMessage("여기로 메일 보내기"),
        "sending": MessageLookupByLibrary.simpleMessage("전송 중"),
        "sending_failed": MessageLookupByLibrary.simpleMessage("전송 실패"),
        "sent": MessageLookupByLibrary.simpleMessage("전송됨"),
        "servant": MessageLookupByLibrary.simpleMessage("서번트"),
        "servant_coin": MessageLookupByLibrary.simpleMessage("서번트 코인"),
        "servant_coin_short": MessageLookupByLibrary.simpleMessage("코인"),
        "servant_detail_page":
            MessageLookupByLibrary.simpleMessage("서번트 상세 페이지"),
        "servant_list_page":
            MessageLookupByLibrary.simpleMessage("서번트 리스트 페이지"),
        "servant_title": MessageLookupByLibrary.simpleMessage("서번트"),
        "set_plan_name": MessageLookupByLibrary.simpleMessage("계획 이름 설정"),
        "setting_always_on_top":
            MessageLookupByLibrary.simpleMessage("항상 맨 위에 표시"),
        "setting_auto_rotate": MessageLookupByLibrary.simpleMessage("자동 회전"),
        "setting_auto_turn_on_plan_not_reach":
            MessageLookupByLibrary.simpleMessage("디폴트 표시\"계획이 가득 차지 않습니다"),
        "setting_home_plan_list_page":
            MessageLookupByLibrary.simpleMessage("홈-계획 리스트 페이지"),
        "setting_only_change_second_append_skill":
            MessageLookupByLibrary.simpleMessage("어펜드 스킬 2만 변경"),
        "setting_priority_tagging":
            MessageLookupByLibrary.simpleMessage("우선순위 매기기"),
        "setting_servant_class_filter_style":
            MessageLookupByLibrary.simpleMessage("서번트 클래스 필터 스타일"),
        "setting_setting_favorite_button_default":
            MessageLookupByLibrary.simpleMessage("「즐겨찾기」버튼 디폴트"),
        "setting_show_account_at_homepage":
            MessageLookupByLibrary.simpleMessage("홈페이지에 계정 표시"),
        "setting_tabs_sorting":
            MessageLookupByLibrary.simpleMessage("페이지 표시 순서"),
        "settings_data": MessageLookupByLibrary.simpleMessage("데이터"),
        "settings_documents": MessageLookupByLibrary.simpleMessage("사용 설명서"),
        "settings_general": MessageLookupByLibrary.simpleMessage("일반"),
        "settings_language": MessageLookupByLibrary.simpleMessage("언어"),
        "settings_tab_name": MessageLookupByLibrary.simpleMessage("설정"),
        "settings_userdata_footer": MessageLookupByLibrary.simpleMessage(
            "앱 업데이트 전에 유저 데이터를 백업하시고,앱 폴더외의 안전한 공간에 보관하십시오"),
        "share": MessageLookupByLibrary.simpleMessage("공유"),
        "show_carousel": MessageLookupByLibrary.simpleMessage("배너 표시"),
        "show_frame_rate": MessageLookupByLibrary.simpleMessage("fps 표시"),
        "show_fullscreen": MessageLookupByLibrary.simpleMessage("풀스크린 보이기"),
        "show_outdated": MessageLookupByLibrary.simpleMessage("기간종료 보이기"),
        "silver": MessageLookupByLibrary.simpleMessage("은색"),
        "simulator": MessageLookupByLibrary.simpleMessage("시뮬레이터"),
        "skill": MessageLookupByLibrary.simpleMessage("스킬"),
        "skill_up": MessageLookupByLibrary.simpleMessage("스킬 강화"),
        "skilled_max10": MessageLookupByLibrary.simpleMessage("스킬 최대(310)"),
        "solution_battle_count": MessageLookupByLibrary.simpleMessage("카운트"),
        "solution_target_count": MessageLookupByLibrary.simpleMessage("목표 카운트"),
        "solution_total_battles_ap": m22,
        "sort_order": MessageLookupByLibrary.simpleMessage("소트"),
        "special_reward_hide":
            MessageLookupByLibrary.simpleMessage("특별 보상 숨기기"),
        "special_reward_show": MessageLookupByLibrary.simpleMessage("특별 보상 표시"),
        "sprites": MessageLookupByLibrary.simpleMessage("스프라이트"),
        "sq_fragment_convert":
            MessageLookupByLibrary.simpleMessage("21성정편 = 3 성정석"),
        "sq_short": MessageLookupByLibrary.simpleMessage("돌"),
        "statistics_title": MessageLookupByLibrary.simpleMessage("통계"),
        "still_send": MessageLookupByLibrary.simpleMessage("계속 보내기"),
        "success": MessageLookupByLibrary.simpleMessage("성공"),
        "summon": MessageLookupByLibrary.simpleMessage("가챠"),
        "summon_daily": MessageLookupByLibrary.simpleMessage("매일"),
        "summon_expectation_btn":
            MessageLookupByLibrary.simpleMessage("기대치 계산"),
        "summon_gacha_footer": MessageLookupByLibrary.simpleMessage("엔터테인먼트만"),
        "summon_gacha_result": MessageLookupByLibrary.simpleMessage("가차 결과"),
        "summon_show_banner": MessageLookupByLibrary.simpleMessage("배너 표시"),
        "summon_ticket_short": MessageLookupByLibrary.simpleMessage("호부"),
        "summon_title": MessageLookupByLibrary.simpleMessage("가챠"),
        "super_effective_damage": MessageLookupByLibrary.simpleMessage("특공"),
        "support_chaldea": MessageLookupByLibrary.simpleMessage("서포트 및 기부하기"),
        "support_servant": MessageLookupByLibrary.simpleMessage("서포트 서번트"),
        "support_servant_forced": MessageLookupByLibrary.simpleMessage("한정"),
        "svt_ascension_icon": MessageLookupByLibrary.simpleMessage("영기 재림 아이콘"),
        "svt_basic_info": MessageLookupByLibrary.simpleMessage("정보"),
        "svt_class_dist": MessageLookupByLibrary.simpleMessage("서번트 클래스"),
        "svt_class_filter_auto": MessageLookupByLibrary.simpleMessage(
            "계정 데이터만을 갱신하여 전역 설정을 포함시키지 않음"),
        "svt_class_filter_hide": MessageLookupByLibrary.simpleMessage("숨김"),
        "svt_class_filter_single_row":
            MessageLookupByLibrary.simpleMessage("「Extra 클래스」전개, 첫째 줄"),
        "svt_class_filter_single_row_expanded":
            MessageLookupByLibrary.simpleMessage("「Extra 클래스」전개, 첫째 줄"),
        "svt_class_filter_two_row":
            MessageLookupByLibrary.simpleMessage("「Extra 클래스」전개, 첫째 줄"),
        "svt_fav_btn_remember": MessageLookupByLibrary.simpleMessage("이전 선택"),
        "svt_fav_btn_show_all": MessageLookupByLibrary.simpleMessage("전부 표시"),
        "svt_fav_btn_show_favorite":
            MessageLookupByLibrary.simpleMessage("즐겨찾기 표시"),
        "svt_not_planned": MessageLookupByLibrary.simpleMessage("팔로우 하지않음"),
        "svt_plan_hidden": MessageLookupByLibrary.simpleMessage("숨김"),
        "svt_profile": MessageLookupByLibrary.simpleMessage("프로필"),
        "svt_profile_info": MessageLookupByLibrary.simpleMessage("캐릭터 정보"),
        "svt_profile_n": m13,
        "svt_related_ce": MessageLookupByLibrary.simpleMessage("관련 예장"),
        "svt_reset_plan": MessageLookupByLibrary.simpleMessage("계획 초기화"),
        "svt_second_archive": MessageLookupByLibrary.simpleMessage("영기 보관실"),
        "svt_stat_details": MessageLookupByLibrary.simpleMessage("상세"),
        "svt_stat_own_total":
            MessageLookupByLibrary.simpleMessage("(999)소유/합계"),
        "svt_switch_slider_dropdown":
            MessageLookupByLibrary.simpleMessage("Slider/Dropdown 전환"),
        "switch_region": MessageLookupByLibrary.simpleMessage("서버 전환"),
        "test_info_pad": MessageLookupByLibrary.simpleMessage("테스트 정보"),
        "testing": MessageLookupByLibrary.simpleMessage("테스트 중"),
        "time_close": MessageLookupByLibrary.simpleMessage("닫기"),
        "time_end": MessageLookupByLibrary.simpleMessage("끝"),
        "time_start": MessageLookupByLibrary.simpleMessage("시작"),
        "toggle_dark_mode": MessageLookupByLibrary.simpleMessage("다크 모드로 전환"),
        "tooltip_refresh_sliders":
            MessageLookupByLibrary.simpleMessage("슬라이드 갱신"),
        "total_ap": MessageLookupByLibrary.simpleMessage("AP 합계"),
        "total_counts": MessageLookupByLibrary.simpleMessage("합계 카운트"),
        "treasure_box_draw_cost":
            MessageLookupByLibrary.simpleMessage("1롤의 비용"),
        "treasure_box_extra_gift":
            MessageLookupByLibrary.simpleMessage("상자 당 추가 선물"),
        "treasure_box_max_draw_once":
            MessageLookupByLibrary.simpleMessage("한번 최대 횟수"),
        "trial_quest": MessageLookupByLibrary.simpleMessage("트레일 퀘스트"),
        "update": MessageLookupByLibrary.simpleMessage("갱신"),
        "update_already_latest":
            MessageLookupByLibrary.simpleMessage("이미 최신버전 입니다"),
        "update_dataset": MessageLookupByLibrary.simpleMessage("게임 데이터 갱신하기"),
        "update_msg_error": MessageLookupByLibrary.simpleMessage("업데이트 실패"),
        "update_msg_no_update":
            MessageLookupByLibrary.simpleMessage("사용 가능한 업데이트 없음"),
        "update_msg_succuss": MessageLookupByLibrary.simpleMessage("업데이트됨"),
        "upload": MessageLookupByLibrary.simpleMessage("업로드"),
        "upload_and_close_app":
            MessageLookupByLibrary.simpleMessage("업로드 및 닫기"),
        "upload_and_close_app_alert":
            MessageLookupByLibrary.simpleMessage("앱을 닫기 전에 데이터를 업로드하시겠습니까?"),
        "upload_before_close_app":
            MessageLookupByLibrary.simpleMessage("닫기 전에 업로드"),
        "usage": MessageLookupByLibrary.simpleMessage("사용 방법"),
        "userdata": MessageLookupByLibrary.simpleMessage("사용자 데이터"),
        "userdata_download_backup":
            MessageLookupByLibrary.simpleMessage("백업 파일을 다운로드"),
        "userdata_download_choose_backup":
            MessageLookupByLibrary.simpleMessage("백업 파일을 선택"),
        "userdata_local": MessageLookupByLibrary.simpleMessage("사용자 데이터(로컬)"),
        "userdata_sync": MessageLookupByLibrary.simpleMessage("데이터 동기화"),
        "userdata_sync_hint": MessageLookupByLibrary.simpleMessage(
            "계정 데이터만을 갱신하여 전역 설정을 포함시키지 않음"),
        "userdata_sync_server":
            MessageLookupByLibrary.simpleMessage("데이터 동기화(서버)"),
        "userdata_upload_backup":
            MessageLookupByLibrary.simpleMessage("백업 파일을 업로드"),
        "valentine_craft": MessageLookupByLibrary.simpleMessage("발렌타인 예장"),
        "version": MessageLookupByLibrary.simpleMessage("버전"),
        "view_illustration": MessageLookupByLibrary.simpleMessage("일러스트 보기"),
        "voice": MessageLookupByLibrary.simpleMessage("음성"),
        "war_age": MessageLookupByLibrary.simpleMessage("연대"),
        "war_banner": MessageLookupByLibrary.simpleMessage("배너"),
        "war_board": MessageLookupByLibrary.simpleMessage("성배전선"),
        "war_title": MessageLookupByLibrary.simpleMessage("퀘스트 정보"),
        "warning": MessageLookupByLibrary.simpleMessage("경고"),
        "web_renderer": MessageLookupByLibrary.simpleMessage("웹 렌더러"),
        "words_separate": m14
      };
}
