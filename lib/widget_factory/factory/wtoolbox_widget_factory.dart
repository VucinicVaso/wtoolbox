import 'wtoolbox_widget_factory_config.dart';
import '../type/impl1/wtoolbox_widget_type.dart';
import '../widget/scaffold/wtoolbox_scaffold.dart';
import '../widget/header/wtoolbox_header.dart';
import '../widget/body/wtoolbox_body.dart';
import '../widget/footer/wtoolbox_footer.dart';
import '../widget/layout/wtoolbox_layout.dart';
import '../widget/empty/wtoolbox_empty_widget.dart';
import '../widget/space/wtoolbox_space_widget.dart';
import '../widget/divider/wtoolbox_divider_widget.dart';

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