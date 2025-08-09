import 'wt_ui_factory_config.dart';
import '../type/impl/wt_ui_type.dart';
import '../widget/scaffold/wt_ui_scaffold.dart';
import '../widget/header/wt_ui_header.dart';
import '../widget/body/wt_ui_body.dart';
import '../widget/footer/wt_ui_footer.dart';
import '../widget/layout/wt_ui_layout.dart';
import '../widget/empty/wt_ui_empty.dart';
import '../widget/space/wt_ui_space.dart';
import '../widget/divider/wt_ui_divider.dart';

abstract class WTUIFactory with WTUIFactoryConfig {

  WTUIScaffold? createScaffold(WTUIScaffoldType type);

  WTUIHeader? createHeader(WTUIHeaderType type);

  WTUIBody? createBody(WTUIBodyType type);

  WTUIFooter? createFooter(WTUIFooterType type);

  WTUILayout? createLayout(WTUILayoutType type);

  WTUIEmpty? createEmpty(WTUIEmptyType type);

  WTUIDivider? createDivider(WTUIDividerType type);

  WTUISpace? createSpace(WTUISpaceType type);

}