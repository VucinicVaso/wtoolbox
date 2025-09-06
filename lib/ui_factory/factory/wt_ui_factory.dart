import 'wt_ui_factory_config.dart';
import '../type/impl/wt_ui_component_type.dart';
import '../component/scaffold/wt_ui_scaffold.dart';
import '../component/header/wt_ui_header.dart';
import '../component/body/wt_ui_body.dart';
import '../component/footer/wt_ui_footer.dart';
import '../component/layout/wt_ui_layout.dart';
import '../component/empty/wt_ui_empty.dart';
import '../component/space/wt_ui_space.dart';
import '../component/divider/wt_ui_divider.dart';
import '../component/wrap/wt_ui_wrap.dart';

abstract class WTUIFactory with WTUIFactoryConfig {

  WTUIScaffold? createScaffold(WTUIScaffoldType type);

  WTUIHeader? createHeader(WTUIHeaderType type);

  WTUIBody? createBody(WTUIBodyType type);

  WTUIFooter? createFooter(WTUIFooterType type);

  WTUILayout? createLayout(WTUILayoutType type);

  WTUIEmpty? createEmpty(WTUIEmptyType type);

  WTUIDivider? createDivider(WTUIDividerType type);

  WTUISpace? createSpace(WTUISpaceType type);

  WTUIWrap? createWrap(WTUIWrapType type);

}