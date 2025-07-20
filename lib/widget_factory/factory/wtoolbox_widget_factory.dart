import 'wtoolbox_widget_factory_config.dart';
import '../type/impl1/wtoolbox_widget_type.dart';
import '../widget/scaffold/wt_scaffold.dart';
import '../widget/header/wt_header.dart';
import '../widget/body/wt_body.dart';
import '../widget/footer/wt_footer.dart';
import '../widget/layout/wt_layout.dart';
import '../widget/empty/wt_empty_widget.dart';
import '../widget/space/wt_space_widget.dart';
import '../widget/divider/wt_divider_widget.dart';

abstract class WTWidgetFactory with WTWidgetFactoryConfig {

  WTScaffold? createScaffold(WTScaffoldType type);

  WTHeader? createHeader(WTHeaderType type);

  WTBody? createBody(WTBodyType type);

  WTFooter? createFooter(WTFooterType type);

  WTLayout? createLayout(WTLayoutType type);

  WTEmptyWidget? createEmptyWidget(WTEmptyType type);

  WTDividerWidget? createDividerWidget(WTDividerType type);

  WTSpaceWidget? createSpaceWidget(WTSpaceType type);

}