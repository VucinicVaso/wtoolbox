import 'wtoolbox_component_factory_config.dart';
import '../type/impl1/wtoolbox_component_type.dart';
import '../component/scaffold/wtoolbox_scaffold.dart';
import '../component/header/wtoolbox_header.dart';
import '../component/body/wtoolbox_body.dart';
import '../component/footer/wtoolbox_footer.dart';
import '../component/layout/wtoolbox_layout.dart';
import '../component/empty/wtoolbox_empty_component.dart';
import '../component/space/wtoolbox_space_component.dart';
import '../component/divider/wtoolbox_divider_component.dart';

abstract class WTComponentFactory with WTComponentFactoryConfig {

  WTScaffold? createScaffold(WTScaffoldType type);

  WTHeader? createHeader(WTHeaderType type);

  WTBody? createBody(WTBodyType type);

  WTFooter? createFooter(WTFooterType type);

  WTLayout? createLayout(WTLayoutType type);

  WTEmptyComponent? createEmptyComponent(WTEmptyType type);

  WTDividerComponent? createDividerComponent(WTDividerType type);

  WTSpaceComponent? createSpaceComponet(WTSpaceType type);

}