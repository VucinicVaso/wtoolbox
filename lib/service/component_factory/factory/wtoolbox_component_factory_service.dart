import 'wtoolbox_component_factory_service_config.dart';
import '../variant/impl1/wtoolbox_component_variant.dart';
import '../component/scaffold/wtoolbox_scaffold.dart';
import '../component/header/wtoolbox_header.dart';
import '../component/body/wtoolbox_body.dart';
import '../component/footer/wtoolbox_footer.dart';
import '../component/layout/wtoolbox_layout.dart';
import '../component/chart/wtoolbox_chart.dart';
import '../component/keyboard/wtoolbox_keyboard.dart';
import '../component/theme_picker/wtoolbox_theme_picker.dart';
import '../component/dismissible/wtoolbox_dismissible_component.dart';
import '../component/qr_scanner/wtoolbox_qr_scanner.dart';
import '../component/chip/wtoolbox_chip.dart';
import '../component/image/wtoolbox_image.dart';
import '../component/empty/wtoolbox_empty.dart';
import '../component/space/wtoolbox_space.dart';
import '../component/divider/wtoolbox_divider.dart';
import '../component/text/wtoolbox_text.dart';
import '../component/date_picker/wtoolbox_datepicker.dart';
import '../component/form_builder/form/wtoolbox_form.dart';
import '../component/form_builder/form_input_field/wtoolbox_form_input_field.dart';
import '../component/button/wtoolbox_button.dart';
import '../component/input_button/wtoolbox_input_button.dart';
import '../component/tabs/wtoolbox_tabs.dart';
import '../component/loading_component/wtoolbox_loading_component.dart';
import '../component/fly_menu/wtoolbox_fly_menu.dart';
import '../component/fly_chooser/wtoolbox_fly_chooser.dart';
import '../component/dialogue_box/wtoolbox_dialogue_box.dart';
import '../component/dashboard_card/wtoolbox_dashboard_card.dart';
import '../component/dashboard_card_list/wtoolbox_dashboard_card_list.dart';
import '../component/card_list/wtoolbox_card_list.dart';
import '../component/card/wtoolbox_card.dart';
import '../component/pdf_viewer/wtoolbox_pdf_viewer.dart';
import '../component/signature/wtoolbox_signature.dart';

abstract class WTComponentFactoryService with WTComponentFactoryServiceConfig {

  WTScaffold? createScaffold(WTScaffoldVariant variant);

  WTHeader? createHeader(WTHeaderVariant variant);

  WTBody? createBody(WTBodyVariant variant);

  WTFooter? createFooter(WTFooterVariant variant);

  WTLayout? createLayout(WTLayoutVariant variant);

  WTChart? createChart(WTChartVariant variant);

  WTKeyboard? createKeyboard(WTKeyboardVariant variant);

  WTThemePicker? createThemePicker(WTThemePickerVariant variant);

  WTQrScanner? createQrScanner(WTQrScannerVariant variant);

  WTChip? createChip(WTChipVariant variant);

  WTImage? createImage(WTImageVariant variant);

  WTSpace? createSpace(WTSpaceVariant variant);

  WTDivider? createDivider(WTDividerVariant variant);

  WTDismissibleComponent? createDismissibleComponent(WTDismissibleComponentVariant variant);

  WTEmpty? createEmptyComponent();

  WTText? createText(WTTextVariant variant);

  WTDatePicker? createDatePicker(WTDatePickerVariant? variant);

  WTForm? createForm(WTFormVariant variant);

  WTFormInputField? createFormInputField(WTFormInputFieldVariant variant);

  WTButton? createButton(WTButtonVariant variant);

  WTInputButton? createInputButton(WTInputButtonVariant variant);

  WTTabs? createTabs(WTTabsVariant variant);

  WTLoadingComponent? createLoadingComponent(WTLoadingComponentVariant variant);

  WTFlyChooser? createFlyChooser(WTFlyChooserVariant variant);

  WTFlyMenu? createFlyMenu(WTFlyMenuVariant variant);

  WTDialogueBox? createDialogueBox(WTDialogueBoxVariant variant);

  WTDashboardCard? createDashboardCard(WTDashboardCardVariant variant);

  WTDashboardCardList? createDashboardCardList(WTDashboardCardListVariant variant);

  WTCardList? createCardList(WTCardListVariant variant);

  WTCard? createCard(WTCardVariant variant);

  WTPdfViewer? createPdfViewer(WTPdfViewerVariant variant);

  WTSignature? createSignature(WTSignatureVariant variant);

}