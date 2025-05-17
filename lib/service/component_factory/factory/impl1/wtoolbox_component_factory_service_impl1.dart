import 'package:flutter/material.dart';
import '../../../../3rd_party/lib_getx.dart';
import '../../../../3rd_party/lib_fontaws.dart';
import '../../../../3rd_party/lib_material_symbols.dart';
import '../wtoolbox_component_factory_service.dart';
import '../../variant/impl1/wtoolbox_component_variant.dart';
import '../../component/empty/wtoolbox_empty.dart';
import '../../component/empty/impl/wtoolbox_empty_impl.dart';
import '../../component/space/wtoolbox_space.dart';
import '../../component/space/simple/wtoolbox_space_simple.dart';
import '../../component/divider/wtoolbox_divider.dart';
import '../../component/divider/horizontal/wtoolbox_divider_horizontal.dart';
import '../../component/layout/wtoolbox_layout.dart';
import '../../component/layout/horizontal/wtoolbox_layout_horizontal.dart';
import '../../component/layout/vertical/wtoolbox_layout_vertical.dart';
import '../../component/scaffold/wtoolbox_scaffold.dart';
import '../../component/scaffold/base/wtoolbox_scaffold_base.dart';
import '../../component/header/wtoolbox_header.dart';
import '../../component/header/base/wtoolbox_header_base.dart';
import '../../component/body/wtoolbox_body.dart';
import '../../component/body/base/wtoolbox_body_base.dart';
import '../../component/footer/wtoolbox_footer.dart';
import '../../component/footer/fixed/wtoolbox_footer_fixed.dart';
import '../../component/chart/wtoolbox_chart.dart';
import '../../component/chart/bar/wtoolbox_bar_chart.dart';
import '../../component/chart/linear/wtoolbox_linear_chart.dart';
import '../../component/keyboard/wtoolbox_keyboard.dart';
import '../../component/keyboard/pin/wtoolbox_keyboard_pin.dart';
import '../../component/theme_picker/wtoolbox_theme_picker.dart';
import '../../component/theme_picker/basic/wtoolbox_theme_picker_basic.dart';
import '../../component/dismissible/wtoolbox_dismissible_component.dart';
import '../../component/dismissible/simple/wtoolbox_dismissible_component_simple.dart';
import '../../component/qr_scanner/wtoolbox_qr_scanner.dart';
import '../../component/qr_scanner/camera/wtoolbox_qr_scanner_camera.dart';
import '../../component/qr_scanner/view/wtoolbox_qr_scanner_view.dart';
import '../../component/chip/wtoolbox_chip.dart';
import '../../component/chip/pill/wtoolbox_chip_pill.dart';
import '../../component/chip/rectangle/wtoolbox_chip_rectangle.dart';
import '../../component/image/wtoolbox_image.dart';
import '../../component/image/svg/basic/wtoolbox_image_svg_basic.dart';
import '../../component/image/image/basic/wtoolbox_image_basic.dart';
import '../../component/text/wtoolbox_text.dart';
import '../../component/text/link/wtoolbox_text_link.dart';
import '../../component/text/title/wtoolbox_text_title.dart';
import '../../component/text/text/wtoolbox_text_text.dart';
import '../../component/text/paragraph/wtoolbox_text_paragraph.dart';
import '../../component/text/list_tile/wtoolbox_text_list_tile.dart';
import '../../component/date_picker/wtoolbox_datepicker.dart';
import '../../component/date_picker/basic/wtoolbox_datepicker_basic.dart';
import '../../component/form_builder/form/wtoolbox_form.dart';
import '../../component/form_builder/form/basic/wtoolbox_form_basic.dart';
import '../../component/form_builder/form/basic1/wtoolbox_form_basic_1.dart';
import '../../component/form_builder/form_input_field/wtoolbox_form_input_field.dart';
import '../../component/form_builder/form_input_field/compact_chooser/wtoolbox_form_input_field_compact_chooser_1.dart';
import '../../component/form_builder/form_input_field/compact/wtoolbox_form_input_field_compact_1.dart';
import '../../component/form_builder/form_input_field/compact_search/wtoolbox_form_input_field_compact_search_1.dart';
import '../../component/form_builder/form_input_field/compact_textarea/wtoolbox_form_input_filed_compact_textarea_1.dart';
import '../../component/form_builder/form_input_field/compact_dropdown/wtoolbox_form_input_field_compact_dropdown_1.dart';
import '../../component/form_builder/form_input_field/search/wtoolbox_form_input_field_search_1.dart';
import '../../component/form_builder/form_input_field/text/wtoolbox_form_input_field_text_1.dart';
import '../../component/form_builder/form_input_field/textarea/wtoolbox_form_input_field_textarea_1.dart';
import '../../component/form_builder/form_input_field/protected/wtoolbox_form_input_field_protected_1.dart';
import '../../component/form_builder/form_input_field/sealed/wtoolbox_form_input_field_sealed_1.dart';
import '../../component/form_builder/form_input_field/file_picker/wtoolbox_form_input_field_file_picker.dart';
import '../../component/form_builder/form_input_field/dropdown/wtoolbox_form_input_field_dropdown_1.dart';
import '../../component/form_builder/form_input_field/date_picker/wtoolbox_form_input_field_date_picker_1.dart';
import '../../component/form_builder/form_input_field/complex/wtoolbox_form_input_field_complex.dart';
import '../../component/button/wtoolbox_button.dart';
import '../../component/button/fab/wtoolbox_fab_extended.dart';
import '../../component/button/fab/wtoolbox_fab_icon_and_plus.dart';
import '../../component/button/fab/wtoolbox_fab_standard.dart';
import '../../component/button/normal/wtoolbox_normal_button.dart';
import '../../component/button/disabled/wtoolbox_disabled_button.dart';
import '../../component/button/wide/wtoolbox_wide_button.dart';
import '../../component/button/icon_only/wtoolbox_button_icon_only.dart';
import '../../component/button/with_icon/wtoolbox_button_with_icon.dart';
import '../../component/input_button/wtoolbox_input_button.dart';
import '../../component/input_button/checkbox/wtoolbox_checkbox_basic.dart';
import '../../component/input_button/radio/wtoolbox_radio_button_basic.dart';
import '../../component/tabs/wtoolbox_tabs.dart';
import '../../component/tabs/regular/wtoolbox_tabs_regular.dart';
import '../../component/tabs/aesthetic/wtoolbox_tabs_aesthetic.dart';
import '../../component/loading_component/wtoolbox_loading_component.dart';
import '../../component/loading_component/onboarding_view/wtoolbox_loading_onboarding_view.dart';
import '../../component/loading_component/loading_view/wtoolbox_loading_view.dart';
import '../../component/loading_component/shimmer_component/header/wtoolbox_loading_shimmer_header.dart';
import '../../component/loading_component/shimmer_component/card/wtoolbox_loading_shimmer_card.dart';
import '../../component/loading_component/shimmer_component/card/wtoolbox_loading_shimmer_actions_card.dart';
import '../../component/loading_component/shimmer_component/card/wtoolbox_loading_shimmer_component_card.dart';
import '../../component/loading_component/shimmer_component/footer/wtoolbox_loading_shimmer_footer.dart';
import '../../component/fly_chooser/wtoolbox_fly_chooser.dart';
import '../../component/fly_chooser/basic/wtoolbox_fly_chooser_basic.dart';
import '../../component/fly_menu/wtoolbox_fly_menu.dart';
import '../../component/fly_menu/basic/wtoolbox_fly_menu_basic.dart';
import '../../component/dialogue_box/wtoolbox_dialogue_box.dart';
import '../../component/dialogue_box/dialogue/wtoolbox_box_dialogue.dart';
import '../../component/dialogue_box/notification/wtoolbox_dialogue_box_notification.dart';
import '../../component/dashboard_card/wtoolbox_dashboard_card.dart';
import '../../component/dashboard_card/action_horizontal/wtoolbox_dashboard_action_horizontal_basic.dart';
import '../../component/dashboard_card/action_vertical/wtoolbox_dashboard_card_action_vertical_basic.dart';
import '../../component/dashboard_card/grid/wtoolbox_dashboard_card_grid_basic.dart';
import '../../component/dashboard_card/chart/wtoolbox_dashboard_card_chart_basic.dart';
import '../../component/dashboard_card/item/wtoolbox_dashboard_card_item_basic.dart';
import '../../component/dashboard_card_list/wtoolbox_dashboard_card_list.dart';
import '../../component/dashboard_card_list/scrolling_basic/wtoolbox_dashboard_card_list_scrolling.dart';
import '../../component/card_list/wtoolbox_card_list.dart';
import '../../component/card_list/basic/wtoolbox_card_list_basic1.dart';
import '../../component/card_list/option/wtoolbox_card_list_option_basic_1.dart';
import '../../component/card_list/grouped/wtoolbox_card_list_grouped.dart';
import '../../component/card_list/grouped_option/wtoolbox_card_list_grouped_option.dart';
import '../../component/card_list/info/wtoolbox_card_list_info.dart';
import '../../component/card_list/overview/wtoolbox_card_list_overview.dart';
import '../../component/card_list/quick_action_grid/wtoolbox_card_list_quick_action_grid.dart';
import '../../component/card_list/quick_extended_action_vertical/wtoolbox_card_list_quick_extended_action_vertical.dart';
import '../../component/card_list/text/wtoolbox_card_list_text1.dart';
import '../../component/card_list/text/wtoolbox_card_list_text2.dart';
import '../../component/card/wtoolbox_card.dart';
import '../../component/card/welcome/wtoolbox_card_welcome.dart';
import '../../component/card/view/wtoolbox_card_view.dart';
import '../../component/card/activity_log/wtoolbox_card_activity_log.dart';
import '../../component/card/badge/wtoolbox_card_badge.dart';
import '../../component/card/quick_action/wtoolbox_card_quick_action.dart';
import '../../component/card/quick_extended_action/wtoolbox_card_quick_extended_action.dart';
import '../../component/card/setup_process/wtoolbox_card_setup_process.dart';
import '../../component/card/text/wtoolbox_card_text.dart';
import '../../component/card/text/wtoolbox_card_text_2.dart';
import '../../component/pdf_viewer/wtoolbox_pdf_viewer.dart';
import '../../component/pdf_viewer/basic/wtoolbox_pdf_viewer_basic.dart';
import '../../component/signature/wtoolbox_signature.dart';
import '../../component/signature/basic/wtoolbox_signature_basic.dart';

class WTComponentFactoryServiceImpl1 extends WTComponentFactoryService {

  @override
  WTScaffold? createScaffold(WTScaffoldVariant variant) {
    switch(variant) {
      case WTScaffoldVariant.base1:
        var component = WTScaffoldBase()
          ..setGlobalKey()
          ..isUnfocused(false)
          ..setBackgroundColor(theme!.base1);
        return component;
      case WTScaffoldVariant.base2:
        var component = WTScaffoldBase()
          ..setGlobalKey()
          ..isUnfocused(false)
          ..setBackgroundColor(theme!.base2);
        return component;
      case WTScaffoldVariant.unfocusedBase1:
        var component = WTScaffoldBase()
          ..setGlobalKey()
          ..isUnfocused(true)
          ..setBackgroundColor(theme!.base1);
        return component;
      case WTScaffoldVariant.unfocusedBase2:
        var component = WTScaffoldBase()
          ..setGlobalKey()
          ..isUnfocused(true)
          ..setBackgroundColor(theme!.base2);
        return component;
    }
  }

  @override
  WTHeader? createHeader(WTHeaderVariant variant) {
    switch(variant) {
      case WTHeaderVariant.base1:
        var component = WTHeaderBase()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..withShadow(false)
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setBackgroundColor(theme!.base1)
          ..setBackActionIconColor(theme!.text1)
          ..setBackActionLabelColor(theme!.text1)
          ..setBackActionLinkLabelColor(theme!.primary1)
          ..setBackActionSvgBackgroundColor(theme!.base2)
          ..setLabelColor(theme!.text1)
          ..setActionIconColor(theme!.text1)
          ..setActionIconBackgroundColor(theme!.base1)
          ..setActionLabelColor(theme!.text1)
          ..setActionLinkLabelColor(theme!.primary1)
          ..setMenuIcon(Symbols.more_vert_rounded)
          ..setMenuIconColor(theme!.text1)
          ..setMenuBackgroundColor(theme!.base2)
          ..setMenuItemIconColor(theme!.text1)
          ..setMenuItemLabelColor(theme!.text1);
        return component;
      case WTHeaderVariant.base1WithShadow:
        var component = WTHeaderBase()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..withShadow(true)
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setBackgroundColor(theme!.base1)
          ..setBackActionIconColor(theme!.text1)
          ..setBackActionLabelColor(theme!.text1)
          ..setBackActionLinkLabelColor(theme!.primary1)
          ..setBackActionSvgBackgroundColor(theme!.base2)
          ..setLabelColor(theme!.text1)
          ..setActionIconColor(theme!.text1)
          ..setActionIconBackgroundColor(theme!.base1)
          ..setActionLabelColor(theme!.text1)
          ..setActionLinkLabelColor(theme!.primary1)
          ..setMenuIcon(Symbols.more_vert_rounded)
          ..setMenuIconColor(theme!.text1)
          ..setMenuBackgroundColor(theme!.base2)
          ..setMenuItemIconColor(theme!.text1)
          ..setMenuItemLabelColor(theme!.text1);
        return component;
      case WTHeaderVariant.base2:
        var component = WTHeaderBase()
          ..setGoogleFonts(fonts)
          ..withShadow(false)
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setBackgroundColor(theme!.base2)
          ..setBackActionIconColor(theme!.text1)
          ..setBackActionLabelColor(theme!.text1)
          ..setBackActionLinkLabelColor(theme!.primary1)
          ..setBackActionSvgBackgroundColor(theme!.base1)
          ..setLabelColor(theme!.text1)
          ..setActionIconColor(theme!.text1)
          ..setActionIconBackgroundColor(theme!.base1)
          ..setActionLabelColor(theme!.text1)
          ..setActionLinkLabelColor(theme!.primary1)
          ..setMenuIcon(Symbols.more_vert_rounded)
          ..setMenuIconColor(theme!.text1)
          ..setMenuBackgroundColor(theme!.base1)
          ..setMenuItemIconColor(theme!.text1)
          ..setMenuItemLabelColor(theme!.text1);
        return component;
      case WTHeaderVariant.base2WithShadow:
        var component = WTHeaderBase()
          ..setGoogleFonts(fonts)
          ..withShadow(true)
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setBackgroundColor(theme!.base2)
          ..setBackActionIconColor(theme!.text1)
          ..setBackActionLabelColor(theme!.text1)
          ..setBackActionLinkLabelColor(theme!.primary1)
          ..setBackActionSvgBackgroundColor(theme!.base1)
          ..setLabelColor(theme!.text1)
          ..setActionIconColor(theme!.text1)
          ..setActionIconBackgroundColor(theme!.base1)
          ..setActionLabelColor(theme!.text1)
          ..setActionLinkLabelColor(theme!.primary1)
          ..setMenuIcon(Symbols.more_vert_rounded)
          ..setMenuIconColor(theme!.text1)
          ..setMenuBackgroundColor(theme!.base1)
          ..setMenuItemIconColor(theme!.text1)
          ..setMenuItemLabelColor(theme!.text1);
        return component;
    }
  }

  @override
  WTBody? createBody(WTBodyVariant variant) {
    switch(variant) {
      case WTBodyVariant.base1:
        var component = WTBodyBase()
          ..setBuildContext(getCurrentContext())
          ..setBackgroundColor(componentConfiguration!.theme!.base1)
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setHeight(componentConfiguration!.deviceHeight!);
        return component;
      case WTBodyVariant.base2:
        var component = WTBodyBase()
          ..setBuildContext(getCurrentContext())
          ..setBackgroundColor(componentConfiguration!.theme!.base2)
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setHeight(componentConfiguration!.deviceHeight!);
        return component;
    }
  }

  @override
  WTFooter? createFooter(WTFooterVariant variant) {
    switch(variant) {
      case WTFooterVariant.base1Fixed:
        var component = WTFooterFixed()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setBackgroundColor(theme!.base1)
          ..setSelectedItemBackgroundColor(theme!.primary4)
          ..setSelectedItemIconColor(theme!.primary1)
          ..setSelectedItemLabelColor(theme!.text1)
          ..setUnselectedItemBackgroundColor(theme!.base1)
          ..setUnselectedItemIconColor(theme!.text4)
          ..setUnselectedItemLabelColor(theme!.text4);
        return component;
      case WTFooterVariant.base2Fixed:
        var component = WTFooterFixed()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setBackgroundColor(theme!.base2)
          ..setSelectedItemBackgroundColor(theme!.primary4)
          ..setSelectedItemIconColor(theme!.primary1)
          ..setSelectedItemLabelColor(theme!.text1)
          ..setUnselectedItemBackgroundColor(theme!.base2)
          ..setUnselectedItemIconColor(theme!.text4)
          ..setUnselectedItemLabelColor(theme!.text4);
        return component;
    }
  }

  @override
  WTLayout? createLayout(WTLayoutVariant variant) {
    switch(variant) {
      case WTLayoutVariant.horizontal:
        var component = WTLayoutHorizontal()
          ..setBuildContext(getCurrentContext())
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setHeight(componentConfiguration!.deviceHeight!)
          ..setAlignment(null)
          ..setPadding(map: { 'left': 7.5, 'top': 12.5, 'right': 7.5, 'bottom': 12.5 })
          ..setMargin(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.center)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
      case WTLayoutVariant.horizontalFlat:
        var component = WTLayoutHorizontal()
          ..setBuildContext(getCurrentContext())
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setHeight(componentConfiguration!.deviceHeight!)
          ..setAlignment(null)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.center)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
      case WTLayoutVariant.vertical:
        var component = WTLayoutVertical()
          ..setBuildContext(getCurrentContext())
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setHeight(componentConfiguration!.deviceHeight!)
          ..setAlignment(null)
          ..setPadding(map: { 'left': 7.5, 'top': 12.5, 'right': 7.5, 'bottom': 12.5 })
          ..setMargin(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.start)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
      case WTLayoutVariant.verticalFlat:
        var component = WTLayoutVertical()
          ..setBuildContext(getCurrentContext())
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setHeight(componentConfiguration!.deviceHeight!)
          ..setAlignment(null)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.start)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
      case WTLayoutVariant.verticalScrollable:
        var component = WTLayoutVertical()
          ..setBuildContext(getCurrentContext())
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setHeight(componentConfiguration!.deviceHeight!)
          ..setScrollable()
          ..setAlignment(null)
          ..setPadding(map: { 'left': 7.5, 'top': 12.5, 'right': 7.5, 'bottom': 12.5 })
          ..setMargin(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.start)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
      case WTLayoutVariant.verticalFlatScrollable:
        var component = WTLayoutVertical()
          ..setBuildContext(getCurrentContext())
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setHeight(componentConfiguration!.deviceHeight!)
          ..setScrollable()
          ..setAlignment(null)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.start)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
      case WTLayoutVariant.verticalExpanded:
        var component = WTLayoutVertical()
          ..setBuildContext(getCurrentContext())
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setHeight(componentConfiguration!.deviceHeight!)
          ..setExpandable()
          ..setAlignment(null)
          ..setPadding(map: { 'left': 7.5, 'top': 12.5, 'right': 7.5, 'bottom': 12.5 })
          ..setMargin(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.start)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
      case WTLayoutVariant.verticalFlatExpanded:
        var component = WTLayoutVertical()
          ..setBuildContext(getCurrentContext())
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setHeight(componentConfiguration!.deviceHeight!)
          ..setExpandable()
          ..setAlignment(null)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.start)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
      case WTLayoutVariant.verticalExpandedAndScrollable:
        var component = WTLayoutVertical()
          ..setBuildContext(getCurrentContext())
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setHeight(componentConfiguration!.deviceHeight!)
          ..setExpandable()
          ..setScrollable()
          ..setAlignment(null)
          ..setPadding(map: { 'left': 7.5, 'top': 12.5, 'right': 7.5, 'bottom': 12.5 })
          ..setMargin(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.start)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
      case WTLayoutVariant.verticalFlatExpandedAndScrollable:
        var component = WTLayoutVertical()
          ..setBuildContext(getCurrentContext())
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setHeight(componentConfiguration!.deviceHeight!)
          ..setExpandable()
          ..setScrollable()
          ..setAlignment(null)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.start)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
    }
  }

  @override
  WTChart? createChart(WTChartVariant variant) {
    switch(variant) {
      case WTChartVariant.linear:
        var component = WTLinearChart()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts);
        return component;
      case WTChartVariant.chart:
        var component = WTBarChart()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts);
        return component;
    }
  }

  @override
  WTKeyboard? createKeyboard(WTKeyboardVariant variant) {
    switch(variant) {
      case WTKeyboardVariant.pin1:
        var component = WTKeyboardPin()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setLabelColor(theme!.text1)
          ..setLabelBorderColor(theme!.shade6)
          ..setLabelBackgroundColor(Colors.transparent)
          ..setButtonLabelColor(theme!.text1)
          ..setButtonBackgroundColor(Colors.transparent);
        return component;
    }
  }

  @override
  WTThemePicker? createThemePicker(WTThemePickerVariant variant) {
    switch(variant) {
      case WTThemePickerVariant.basic:
        var component = WTThemePickerBasic()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setBackgroundColor(Colors.transparent)
          ..setTextColor(theme!.text1)
          ..setSelectedIcon(Symbols.check_box)
          ..setSelectedIconColor(theme!.primary1)
          ..setUnselectedIcon(Symbols.check_box_outline_blank)
          ..setUnselectedIconColor(theme!.shade7);
        return component;
    }
  }

  @override
  WTQrScanner? createQrScanner(WTQrScannerVariant variant) {
    switch(variant) {
      case WTQrScannerVariant.camera:
        var component = WTQrScannerCamera()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 10.0, 'top': 10.0, 'right': 10.0, 'bottom': 10.0 });
        return component;
      case WTQrScannerVariant.view:
        var component = WTQrScannerView()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 10.0, 'top': 10.0, 'right': 10.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 10.0, 'top': 10.0, 'right': 10.0, 'bottom': 10.0 })
          ..setQrIcon(Symbols.qr_code_scanner)
          ..setQrIconColor(theme!.text1);
        return component;
    }
  }

  @override
  WTChip? createChip(WTChipVariant variant) {
    switch(variant) {
      case WTChipVariant.rectangle:
        var component = WTChipRectangle()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setColors({
            'basic': {
              'backgroundColor':    theme!.base2,
              'primaryIconColor':   theme!.text2,
              'secondaryIconColor': theme!.text2,
              'labelColor':         theme!.text2,
            },
            'info': {
              'backgroundColor':    theme!.primary1,
              'primaryIconColor':   theme!.primary5,
              'secondaryIconColor': theme!.primary5,
              'labelColor':         theme!.primary5,
            },
            'success': {
              'backgroundColor':    theme!.success1,
              'primaryIconColor':   theme!.success5,
              'secondaryIconColor': theme!.success5,
              'labelColor':         theme!.success5,
            },
            'danger': {
              'backgroundColor':    theme!.error1,
              'primaryIconColor':   theme!.error5,
              'secondaryIconColor': theme!.error5,
              'labelColor':         theme!.error5,
            },
            'warning': {
              'backgroundColor':    Colors.orange,
              'primaryIconColor':   Colors.white,
              'secondaryIconColor': Colors.white,
              'labelColor':         Colors.white,
            },
          })
          ..basic()
          ..setPadding(map: { 'left': 15.0, 'top': 7.5, 'right': 15.0, 'bottom': 7.5 })
          ..setMargin(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setPrimaryIconSize(20.0)
          ..setLabelSize(16.0)
          ..setSecondaryIconSize(20.0);
        return component;
      case WTChipVariant.pill:
        var component = WTChipPill()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setColors({
            'basic': {
              'backgroundColor':    theme!.base2,
              'primaryIconColor':   theme!.text2,
              'secondaryIconColor': theme!.text2,
              'labelColor':         theme!.text2,
            },
            'info': {
              'backgroundColor':    theme!.primary1,
              'primaryIconColor':   theme!.primary5,
              'secondaryIconColor': theme!.primary5,
              'labelColor':         theme!.primary5,
            },
            'success': {
              'backgroundColor':    theme!.success1,
              'primaryIconColor':   theme!.success5,
              'secondaryIconColor': theme!.success5,
              'labelColor':         theme!.success5,
            },
            'danger': {
              'backgroundColor':    theme!.error1,
              'primaryIconColor':   theme!.error5,
              'secondaryIconColor': theme!.error5,
              'labelColor':         theme!.error5,
            },
            'warning': {
              'backgroundColor':    Colors.orange,
              'primaryIconColor':   Colors.white,
              'secondaryIconColor': Colors.white,
              'labelColor':         Colors.white,
            },
          })
          ..setPadding(map: { 'left': 15.0, 'top': 7.5, 'right': 15.0, 'bottom': 7.5 })
          ..setMargin(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setPrimaryIconSize(20.0)
          ..setLabelSize(16.0)
          ..setSecondaryIconSize(20.0)
          ..basic();
        return component;
    }
  }

  @override
  WTImage? createImage(WTImageVariant variant) {
    switch(variant) {
      case WTImageVariant.imageBasic:
        var component = WTImageBasic()
          ..setBuildContext(getCurrentContext())
          ..setBackgroundColor(Colors.transparent)
          ..setBorderColor(theme!.primary1)
          ..withoutBorder()
          ..medium()
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 });
        return component;
      case WTImageVariant.svgBasic:
        var component = WTImageSvgBasic()
          ..setBuildContext(getCurrentContext())
          ..setBackgroundColor(Colors.transparent)
          ..setBorderColor(theme!.primary1)
          ..withoutBorder()
          ..medium()
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 });
        return component;
    }
  }

  @override
  WTSpace? createSpace(WTSpaceVariant variant) {
    switch(variant) {
      case WTSpaceVariant.horizontal5:
        var component = WTSpaceSimple()
          ..setBuildContext(getCurrentContext())
          ..setHeight(0.0)
          ..setWidth(5.0);
        return component;
      case WTSpaceVariant.horizontal10:
        var component = WTSpaceSimple()
          ..setBuildContext(getCurrentContext())
          ..setHeight(0.0)
          ..setWidth(10.0);
        return component;
      case WTSpaceVariant.horizontal15:
        var component = WTSpaceSimple()
          ..setBuildContext(getCurrentContext())
          ..setHeight(0.0)
          ..setWidth(15.0);
        return component;
      case WTSpaceVariant.vertical5:
        var component = WTSpaceSimple()
          ..setBuildContext(getCurrentContext())
          ..setHeight(5.0)
          ..setWidth(0.0);
        return component;
      case WTSpaceVariant.vertical10:
        var component = WTSpaceSimple()
          ..setBuildContext(getCurrentContext())
          ..setHeight(10.0)
          ..setWidth(0.0);
        return component;
      case WTSpaceVariant.vertical15:
        var component = WTSpaceSimple()
          ..setBuildContext(getCurrentContext())
          ..setHeight(15.0)
          ..setWidth(0.0);
        return component;
    }
  }

  @override
  WTDivider? createDivider(WTDividerVariant variant) {
    switch(variant) {
      case WTDividerVariant.horizontal:
        var component = WTDividerHorizontal()
          ..setBuildContext(getCurrentContext())
          ..setBackgroundColor(theme!.shade5)
          ..setThickness(1.0);
        return component;
    }
  }

  @override
  WTDismissibleComponent? createDismissibleComponent(WTDismissibleComponentVariant variant) {
    switch(variant) {
      case WTDismissibleComponentVariant.danger:
        var component = WTDismissibleComponentSimple()
          ..setBuildContext(getCurrentContext())
          ..setIcon(FontAwesomeIcons.trashCan)
          ..setIconColor(theme!.error2)
          ..setSwipeStartColor(theme!.error1!.withValues(alpha: 0.85))
          ..setSwipeEndColor(theme!.error1!.withValues(alpha: 0.85));
        return component;
    }
  }

  @override
  WTEmpty? createEmptyComponent() {
    var component = WTEmptyImpl();
    return component;
  }

  @override
  WTText? createText(WTTextVariant variant) {
    switch(variant) {
      case WTTextVariant.title:
        var component = WTTextTitle()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setAlignment(Alignment.center)
          ..setBackgroundColor(Colors.transparent)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 15.0, 'top': 5.0, 'right': 15.0, 'bottom': 5.0 })
          ..setTitleAlign(TextAlign.center)
          ..mdTitle()
          ..setTitleColor(theme!.text1);
        return component;
      case WTTextVariant.text:
        var component = WTTextText()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setAlignment(Alignment.centerLeft)
          ..setBackgroundColor(Colors.transparent)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 15.0, 'top': 5.0, 'right': 15.0, 'bottom': 5.0 })
          ..setTextAlign(TextAlign.left)
          ..setTextColor(theme!.text1);
        return component;
      case WTTextVariant.link:
      var component = WTTextLink()
        ..setBuildContext(getCurrentContext())
        ..setGoogleFonts(fonts)
        ..setAlignment(Alignment.center)
        ..setBackgroundColor(Colors.transparent)
        ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
        ..setMargin(map: { 'left': 15.0, 'top': 5.0, 'right': 15.0, 'bottom': 5.0 })
        ..setTextAlign(TextAlign.center)
        ..setTextColor(theme!.text1)
        ..setLinkColor(theme!.primary1);
      return component;
      case WTTextVariant.paragraph:
        var component = WTTextParagraph()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setBackgroundColor(Colors.transparent)
          ..setBorderColor(Colors.grey)
          ..setAlignment(Alignment.centerLeft)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 15.0, 'top': 5.0, 'right': 15.0, 'bottom': 5.0 })
          ..setMainAxisAlignment(MainAxisAlignment.spaceAround)
          ..setCrossAxisAlignment(CrossAxisAlignment.start)
          ..setTitleColor(theme!.text1)
          ..setTitleAlign(TextAlign.left)
          ..setTitleFontWeight(FontWeight.normal)
          ..setTextColor(theme!.text1)
          ..setTextAlign(TextAlign.justify)
          ..setTextFontWeight(FontWeight.normal);
        return component;
      case WTTextVariant.listTile:
        var component = WTTextListTile()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 15.0, 'top': 5.0, 'right': 15.0, 'bottom': 5.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setLabelColor(theme!.text3)
          ..setLabelAlign(TextAlign.left)
          ..setLabelFontWeight(FontWeight.normal)
          ..setTextColor(theme!.text1)
          ..setTextAlign(TextAlign.right)
          ..setTextFontWeight(FontWeight.normal);
        return component;
    }
  }

  @override
  WTDatePicker? createDatePicker(WTDatePickerVariant? variant) {
    switch(variant) {
      case WTDatePickerVariant.basic:
        var component = WTDatePickerBasic()
          ..setBackgroundColor(theme!.base1)
          ..setButtonColor(theme!.primary1);
        return component;
      case null:
        throw UnimplementedError();
    }
  }

  @override
  WTForm? createForm(WTFormVariant variant) {
    switch(variant) {
      case WTFormVariant.basicForm:
        var component = WTFormBasic()
          ..setBuildContext(getCurrentContext())
          ..setScrollController()
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setHeight(componentConfiguration!.deviceHeight!)
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.start)
          ..setCrossAxisAlignment(CrossAxisAlignment.start)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setLessFieldsButtonLabel('lessFormFields'.tr)
          ..setLessFieldsButtonLabelSize(16.0)
          ..setLessFieldsButtonLabelColor(theme!.primary1)
          ..setLessFieldsButtonBackgroundColor(Colors.transparent)
          ..setMoreFieldsButtonLabel('moreFormFields'.tr)
          ..setMoreFieldsButtonLabelSize(16.0)
          ..setMoreFieldsButtonLabelColor(theme!.primary1)
          ..setMoreFieldsButtonBackgroundColor(Colors.transparent);
        return component;
      case WTFormVariant.basicForm1:
        var component = WTFormBasic1()
          ..setBuildContext(getCurrentContext())
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setHeight(componentConfiguration!.deviceHeight!)
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.start)
          ..setCrossAxisAlignment(CrossAxisAlignment.start)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 });
        return component;
    }
  }

  @override
  WTFormInputField? createFormInputField(WTFormInputFieldVariant variant) {
    switch(variant) {
      case WTFormInputFieldVariant.compactChooser1:
        var component = WTFormInputFieldCompactChooser1()
          ..setFocusNode()
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setHeight(componentConfiguration!.deviceHeight!)
          ..setGoogleFonts(fonts)
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base1)
          ..setTextInputType(TextInputType.text)
          ..setTextAlign(TextAlign.right)
          ..setSeparatorColor(Colors.grey.shade200)
          ..setAsterixColor(theme!.error1)
          ..setInputTextColor(theme!.text3)
          ..setErrorTextColor(theme!.error1)
          ..setPrefixColor(theme!.primary1)
          ..setLabelColor(theme!.text3)
          ..setSuffixColor(theme!.text1)
          ..disable();
        return component;
      case WTFormInputFieldVariant.compactRegular1:
        var component = WTFormInputFieldCompact1()
          ..setFocusNode()
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setHeight(componentConfiguration!.deviceHeight!)
          ..setGoogleFonts(fonts)
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base1)
          ..setTextInputType(TextInputType.text)
          ..setTextAlign(TextAlign.right)
          ..setSeparatorColor(Colors.grey.shade200)
          ..setAsterixColor(theme!.error1)
          ..setInputTextColor(theme!.text1)
          ..setErrorTextColor(theme!.error1)
          ..setPrefixColor(theme!.primary1)
          ..setLabelColor(theme!.text3)
          ..setSuffixColor(theme!.text1);
        return component;
      case WTFormInputFieldVariant.compactSearch1:
        var component = WTFormInputFieldCompactSearch1()
          ..setFocusNode()
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setHeight(componentConfiguration!.deviceHeight!)
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 8.0, 'top': 0.0, 'right': 8.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 10.0, 'top': 0.0, 'right': 10.0, 'bottom': 0.0 })
          ..setSeparatorColor(Colors.grey.shade200)
          ..setAsterixColor(theme!.error1)
          ..setTextInputType(TextInputType.text)
          ..setTextAlign(TextAlign.left)
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base1)
          ..setInputTextColor(theme!.text3)
          ..setErrorTextColor(theme!.error1)
          ..setPrefixColor(theme!.primary1)
          ..setLabelColor(theme!.text3)
          ..setSuffixColor(theme!.text3);
        return component;
      case WTFormInputFieldVariant.compactTextareaRegular1:
        var component = WTFormInputFieldCompactTextarea1()
          ..setFocusNode()
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setHeight(componentConfiguration!.deviceHeight!)
          ..setGoogleFonts(fonts)
          ..setSeparatorColor(Colors.grey.shade200)
          ..setAsterixColor(theme!.error1)
          ..setTextInputType(TextInputType.text)
          ..setTextAlign(TextAlign.left)
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base1)
          ..setInputTextColor(theme!.text1)
          ..setErrorTextColor(theme!.error1)
          ..setPrefixColor(theme!.primary1)
          ..setLabelColor(theme!.text3)
          ..setSuffixColor(theme!.text1);
        return component;
      case WTFormInputFieldVariant.compactDropdownRegular1:
        var component = WTFormInputFieldCompactDropdown1()
          ..setFocusNode()
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setHeight(componentConfiguration!.deviceHeight!)
          ..setGoogleFonts(fonts)
          ..setSeparatorColor(Colors.grey.shade200)
          ..setAsterixColor(theme!.error1)
          ..setTextInputType(TextInputType.text)
          ..setTextAlign(TextAlign.right)
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base1)
          ..setInputTextColor(theme!.text1)
          ..setErrorTextColor(theme!.error1)
          ..setPrefixColor(theme!.primary1)
          ..setLabelColor(theme!.text3)
          ..setSuffix(iconData: Symbols.arrow_forward_ios)
          ..setSuffixColor(theme!.text1);
        return component;
      case WTFormInputFieldVariant.searchStyled1:
        var component = WTFormInputFieldSearch1()
          ..setFocusNode()
          ..setBuildContext(getCurrentContext())
          ..useNoneTextCapitalization()
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 2.0, 'top': 0.0, 'right': 2.0, 'bottom': 8.0 })
          ..enableStyledBorder(true)
          ..setTextInputType(TextInputType.text)
          ..setBackgroundColor(theme!.shade9)
          ..setBorderColor(theme!.shade9)
          ..setInputTextColor(theme!.text1)
          ..setLabelColor(theme!.text4)
          ..setHintLabel('search'.tr)
          ..setHintColor(theme!.text4)
          ..setPrefixColor(theme!.text4)
          ..setPrefix(iconData: Icons.search)
          ..setSuffixColor(theme!.text4)
          ..setErrorTextColor(theme!.error1);
        return component;
      case WTFormInputFieldVariant.complexRegular:
        var component = WTFormInputFieldComplex()
          ..setFocusNode()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 2.0, 'top': 0.0, 'right': 2.0, 'bottom': 8.0 })
          ..setTextAlign(TextAlign.left)
          ..enableRegularBorder(true)
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base1)
          ..setInputTextColor(theme!.text1)
          ..setTextInputType(TextInputType.text)
          ..setLabelColor(theme!.text4,)
          ..setHintColor(theme!.text4)
          ..setHintLabel(translate('selectedFiles'))
          ..setButtonColor(theme!.primary5)
          ..setButtonBackgroundColor(theme!.primary1)
          ..setErrorTextColor(theme!.base1);
        return component;
      case WTFormInputFieldVariant.complexStyled:
        var component = WTFormInputFieldComplex()
          ..setFocusNode()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 2.0, 'top': 0.0, 'right': 2.0, 'bottom': 8.0 })
          ..setTextAlign(TextAlign.left)
          ..enableStyledBorder(true)
          ..setBackgroundColor(theme!.base2)
          ..setBorderColor(theme!.base2)
          ..setInputTextColor(theme!.text1)
          ..setLabelColor(theme!.text4)
          ..setHintColor(theme!.text4)
          ..setHintLabel(translate('selectedFiles'))
          ..setErrorTextColor(theme!.error1)
          ..setTextInputType(TextInputType.text)
          ..setButtonColor(theme!.primary1)
          ..setButtonBackgroundColor(theme!.base2);
        return component; 
      case WTFormInputFieldVariant.textRegular1:
        var component = WTFormInputFieldText1()
          ..setFocusNode()
          ..setBuildContext(getCurrentContext())
          ..useNoneTextCapitalization()
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 2.0, 'top': 0.0, 'right': 2.0, 'bottom': 8.0 })
          ..enableRegularBorder(true)
          ..setTextInputType(TextInputType.text)
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base1)
          ..setInputTextColor(theme!.text1)
          ..setLabelColor(theme!.text4)
          ..setHintColor(theme!.text4)
          ..setPrefixColor(theme!.text4)
          ..setSuffixColor(theme!.text4)
          ..setErrorTextColor(theme!.error1);
        return component;
        case WTFormInputFieldVariant.textStyled1:
        var component = WTFormInputFieldText1()
          ..setFocusNode()
          ..setBuildContext(getCurrentContext())
          ..useNoneTextCapitalization()
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 2.0, 'top': 0.0, 'right': 2.0, 'bottom': 8.0 })
          ..enableStyledBorder(true)
          ..setTextInputType(TextInputType.text)
          ..setBackgroundColor(theme!.shade9)
          ..setBorderColor(theme!.shade9)
          ..setInputTextColor(theme!.text1)
          ..setLabelColor(theme!.text4)
          ..setHintColor(theme!.text4)
          ..setPrefixColor(theme!.text4)
          ..setSuffixColor(theme!.text4)
          ..setErrorTextColor(theme!.error1);
        return component;
      case WTFormInputFieldVariant.textareaRegular1:
        var component = WTFormInputFieldTextarea1()
          ..setFocusNode()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 2.0, 'top': 0.0, 'right': 2.0, 'bottom': 8.0 })
          ..enableRegularBorder(true)
          ..setTextInputType(TextInputType.text)
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base1)
          ..setInputTextColor(theme!.text1)
          ..setLabelColor(theme!.text4)
          ..setHintColor(theme!.text4)
          ..setErrorTextColor(theme!.error1);
        return component;
      case WTFormInputFieldVariant.textareaStyled1:
        var component = WTFormInputFieldTextarea1()
          ..setFocusNode()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 2.0, 'top': 0.0, 'right': 2.0, 'bottom': 8.0 })
          ..enableStyledBorder(true)
          ..setTextInputType(TextInputType.text)
          ..setBackgroundColor(theme!.shade9)
          ..setBorderColor(theme!.shade9)
          ..setInputTextColor(theme!.text1)
          ..setLabelColor(theme!.text4)
          ..setHintColor(theme!.text4)
          ..setErrorTextColor(theme!.error1);
        return component;
      case WTFormInputFieldVariant.protectedRegular1:
        var component = WTFormInputFieldProtected1()
          ..setFocusNode()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 2.0, 'top': 0.0, 'right': 2.0, 'bottom': 8.0 })
          ..enableRegularBorder(true)
          ..setTextInputType(TextInputType.text)
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base1)
          ..setInputTextColor(theme!.text1)
          ..setLabelColor(theme!.text4)
          ..setHintColor(theme!.text4)
          ..setPrefixColor(theme!.text4)
          ..setSuffixColor(theme!.text4)
          ..setErrorTextColor(theme!.error1);
        return component;
      case WTFormInputFieldVariant.protectedStyled1:
        var component = WTFormInputFieldProtected1()
          ..setFocusNode()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 2.0, 'top': 0.0, 'right': 2.0, 'bottom': 8.0 })
          ..enableStyledBorder(true)
          ..setTextInputType(TextInputType.text)
          ..setBackgroundColor(theme!.shade9)
          ..setBorderColor(theme!.shade9)
          ..setInputTextColor(theme!.text1)
          ..setLabelColor(theme!.text4)
          ..setHintColor(theme!.text4)
          ..setPrefixColor(theme!.text4)
          ..setSuffixColor(theme!.text4)
          ..setErrorTextColor(theme!.error1);
        return component;
      case WTFormInputFieldVariant.sealed1:
        var component = WTFormInputFieldSealed1()
          ..setFocusNode()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 2.0, 'top': 0.0, 'right': 2.0, 'bottom': 8.0 })
          ..disable()
          ..setTextInputType(TextInputType.text)
          ..setBackgroundColor(theme!.shade8)
          ..setBorderColor(theme!.shade8)
          ..setInputTextColor(theme!.text1)
          ..setLabelColor(theme!.text4)
          ..setHintColor(theme!.text4)
          ..setErrorTextColor(theme!.error1);
        return component;
      case WTFormInputFieldVariant.filePickerRegular:
        var component = WTFormInputFieldFilePicker()
          ..setFocusNode()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 2.0, 'top': 0.0, 'right': 2.0, 'bottom': 8.0 })
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base1)
          ..setLabel(translate('chooseFile'))
          ..setLabelColor(theme!.text4)
          ..setHintLabel(translate('selectedFiles'))
          ..setHintColor(theme!.text4)
          ..setErrorTextColor(theme!.error1)
          ..setPrefix(iconData: Symbols.folder_rounded)
          ..setPrefixColor(theme!.text4)
          ..setSuffix(iconData: Symbols.search)
          ..setSuffixColor(theme!.primary1)
          ..setButtonColor(theme!.primary1)
          ..setButtonBackgroundColor(theme!.primary5);
        return component;
      case WTFormInputFieldVariant.filePickerStyled:
        var component = WTFormInputFieldFilePicker()
          ..setFocusNode()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 2.0, 'top': 0.0, 'right': 2.0, 'bottom': 8.0 })
          ..setBackgroundColor(theme!.shade9)
          ..setBorderColor(theme!.shade9)
          ..setLabel(translate('chooseFile'))
          ..setLabelColor(theme!.text4)
          ..setHintLabel(translate('selectedFiles'))
          ..setHintColor(theme!.text4)
          ..setErrorTextColor(theme!.error1)
          ..setPrefix(iconData: Icons.folder_rounded)
          ..setPrefixColor(theme!.text4)
          ..setSuffix(iconData: Icons.search)
          ..setSuffixColor(theme!.primary1)
          ..setButtonColor(theme!.primary1)
          ..setButtonBackgroundColor(theme!.primary5);
        return component;
      case WTFormInputFieldVariant.dropdownRegular1:
        var component = WTFormInputFieldDropdown1()
          ..setFocusNode()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 2.0, 'top': 0.0, 'right': 2.0, 'bottom': 8.0 })
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base1)
          ..setInputTextColor(theme!.text1)
          ..setLabelColor(theme!.text4)
          ..setHintColor(theme!.text4)
          ..setPrefix(iconData: Symbols.arrow_drop_down)
          ..setPrefixColor(theme!.text4);
        return component;
      case WTFormInputFieldVariant.dropdownStyled1:
      var component = WTFormInputFieldDropdown1()
        ..setFocusNode()
        ..setBuildContext(getCurrentContext())
        ..setGoogleFonts(fonts)
        ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
        ..setMargin(map: { 'left': 2.0, 'top': 0.0, 'right': 2.0, 'bottom': 8.0 })
        ..setBackgroundColor(theme!.shade9)
        ..setBorderColor(theme!.shade9)
        ..setInputTextColor(theme!.text1)
        ..setLabelColor(theme!.text4)
        ..setHintColor(theme!.text4)
        ..setPrefix(iconData: Symbols.arrow_drop_down)
        ..setPrefixColor(theme!.text4);
      return component;
      case WTFormInputFieldVariant.datePickerRegular1:
        var component = WTFormInputFieldDatePicker1()
          ..setFocusNode()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 2.0, 'top': 0.0, 'right': 2.0, 'bottom': 8.0 })
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base1)
          ..setInputTextColor(theme!.text1)
          ..setLabelColor(theme!.text4)
          ..setHintColor(theme!.text4)
          ..setPrefix(iconData: Symbols.calendar_month)
          ..setPrefixColor(theme!.text4);
        return component;
      case WTFormInputFieldVariant.datePickerStyled1:
        var component = WTFormInputFieldDatePicker1()
          ..setFocusNode()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 2.0, 'top': 0.0, 'right': 2.0, 'bottom': 8.0 })
          ..setBackgroundColor(theme!.shade9)
          ..setBorderColor(theme!.shade9)
          ..setInputTextColor(theme!.text1)
          ..setLabelColor(theme!.text4)
          ..setHintColor(theme!.text4)
          ..setPrefix(iconData: Symbols.calendar_month)
          ..setPrefixColor(theme!.text4);
        return component;
    }
  }

  @override
  WTButton? createButton(WTButtonVariant variant) {
    switch(variant) {
      case WTButtonVariant.fabWhiteExtended:
        var component = WTFabExtended()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 25.0, 'top': 5.0, 'right': 25.0, 'bottom': 5.0 })
          ..setBackgroundColor(Colors.white)
          ..setIconColor(Colors.black)
          ..setIconSize(25.0)
          ..setLabelColor(Colors.black)
          ..setLabelSize(15.0);
        return component;
      case WTButtonVariant.fabColoredExtended:
        var component = WTFabExtended()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 25.0, 'top': 5.0, 'right': 25.0, 'bottom': 5.0 })
          ..setBackgroundColor(theme!.primary1)
          ..setIconColor(theme!.primary5)
          ..setIconSize(25.0)
          ..setLabelColor(theme!.primary5)
          ..setLabelSize(15.0);
        return component;
      case WTButtonVariant.fabWhiteIconPlus:
        var component = WTFabIconAndPlus()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setBackgroundColor(Colors.white)
          ..setIconColor(Colors.blue)
          ..setIconSize(25.0)
          ..setDecorationIconColor(Colors.white)
          ..setDecorationIconBackgroundColor(Colors.blue)
          ..setDecorationIconSize(15.0);
        return component;
      case WTButtonVariant.fabColoredIconPlus:
        var component = WTFabIconAndPlus()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setBackgroundColor(theme!.primary1)
          ..setIconColor(theme!.primary5)
          ..setIconSize(25.0)
          ..setDecorationIconColor(theme!.primary1)
          ..setDecorationIconBackgroundColor(theme!.primary5)
          ..setDecorationIconSize(15.0);
        return component;
      case WTButtonVariant.fabWhiteStandard:
        var component = WTFabStandard()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setBackgroundColor(Colors.white)
          ..setIconColor(Colors.black)
          ..setIconSize(25.0);
        return component;
      case WTButtonVariant.fabColoredStandard:
        var component = WTFabStandard()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setBackgroundColor(theme!.primary1)
          ..setIconColor(theme!.primary5)
          ..setIconSize(25.0);
        return component;
      case WTButtonVariant.normalPrimary:
        var component = WTNormalButton()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setBackgroundColor(theme!.primary1)
          ..setLabelColor(theme!.primary5)
          ..setLabelSize(15.0);
        return component;
      case WTButtonVariant.normalSecondary:
        var component = WTNormalButton()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setBackgroundColor(theme!.primary5)
          ..setLabelColor(theme!.primary1)
          ..setLabelSize(15.0);
        return component;
      case WTButtonVariant.normalTertiary:
        var component = WTNormalButton()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setLabelColor(theme!.primary1)
          ..setLabelSize(15.0);
          return component;
      case WTButtonVariant.normalQuaternary:
        var component = WTNormalButton()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..enableUnderline()
          ..setPadding(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setLabelColor(theme!.primary1)
          ..setLabelSize(15.0);
          return component;
      case WTButtonVariant.disabledPrimary:
        var component = WTDisabledButton()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setBackgroundColor(theme!.primary1!.withValues(alpha: 0.5))
          ..setLabelColor(theme!.primary5!.withValues(alpha: 0.5))
          ..setLabelSize(15.0);
        return component;
      case WTButtonVariant.disabledSecondary:
        var component = WTDisabledButton()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setBackgroundColor(theme!.base2!.withValues(alpha: 0.5))
          ..setLabelColor(theme!.primary1!.withValues(alpha: 0.5))
          ..setLabelSize(15.0);
        return component;
      case WTButtonVariant.disabledTertiary:
        var component = WTDisabledButton()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setLabelColor(theme!.primary1!.withValues(alpha: 0.5))
          ..setLabelSize(15.0);
        return component;
      case WTButtonVariant.errorPrimary:
      var component = WTNormalButton()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setBackgroundColor(theme!.error1)
          ..setLabelColor(theme!.error5)
          ..setLabelSize(15.0);
        return component;
      case WTButtonVariant.errorSecondary:
        var component = WTNormalButton()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setBackgroundColor(theme!.error5)
          ..setLabelColor(theme!.error1)
          ..setLabelSize(15.0);
        return component;
      case WTButtonVariant.errorTertiary:
        var component = WTNormalButton()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setLabelColor(theme!.error1)
          ..setLabelSize(15.0);
        return component;
      case WTButtonVariant.successPrimary:
        var component = WTNormalButton()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setBackgroundColor(theme!.success1)
          ..setLabelColor(theme!.success5)
          ..setLabelSize(15.0);
        return component;
      case WTButtonVariant.successSecondary:
        var component = WTNormalButton()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setBackgroundColor(theme!.success5)
          ..setLabelColor( theme!.success1)
          ..setLabelSize(15.0);
        return component;
      case WTButtonVariant.successTertiary:
        var component = WTNormalButton()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setLabelColor(theme!.success1)
          ..setLabelSize(15.0);
        return component;
      case WTButtonVariant.contrastPrimary:
        var button = WTNormalButton()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setBackgroundColor(theme!.text1)
          ..setLabelColor(theme!.primary5)
          ..setLabelSize(15.0);
        return button;
      case WTButtonVariant.contrastSecondary:
        var button = WTNormalButton()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setBackgroundColor(theme!.base2)
          ..setLabelColor(theme!.text1)
          ..setLabelSize(15.0);
        return button;
      case WTButtonVariant.contrastTertiary:
        var button = WTNormalButton()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setLabelColor(theme!.text1)
          ..setLabelSize(15.0);
        return button;
      case WTButtonVariant.wideLg:
        var component = WTWideButton()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setLargeButton()
          ..setPadding(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setBackgroundColor(theme!.primary1)
          ..setLabelColor(theme!.primary5)
          ..setLabelSize(15.0);
        return component;
      case WTButtonVariant.wideMd:
        var component = WTWideButton()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setMediumButton()
          ..setPadding(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 20.0, 'top': 10.0, 'right': 20.0, 'bottom': 10.0 })
          ..setBackgroundColor(theme!.primary1)
          ..setLabelColor(theme!.primary5)
          ..setLabelSize(15.0);
        return component;
      case WTButtonVariant.withIconPrimary:
        var component = WTButtonWithIcon()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 15.0, 'top': 10.0, 'right': 15.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 10.0, 'top': 10.0, 'right': 10.0, 'bottom': 10.0 })
          ..setBackgroundColor(theme!.primary1)
          ..setIconSize(25.0)
          ..setIconColor(theme!.primary5)
          ..setLabelSize(15.0)
          ..setLabelColor(theme!.primary5);
        return component;
      case WTButtonVariant.withIconSecondary:
        var component = WTButtonWithIcon()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 15.0, 'top': 10.0, 'right': 15.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 10.0, 'top': 10.0, 'right': 10.0, 'bottom': 10.0 })
          ..setBackgroundColor(theme!.base2)
          ..setIconSize(25.0)
          ..setIconColor(theme!.primary1)
          ..setLabelSize(15.0)
          ..setLabelColor(theme!.primary1);
        return component;
      case WTButtonVariant.withIconTertiary:
        var component = WTButtonWithIcon()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 15.0, 'top': 10.0, 'right': 15.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 10.0, 'top': 10.0, 'right': 10.0, 'bottom': 10.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setIconSize(25.0)
          ..setIconColor(theme!.primary1)
          ..setLabelSize(15.0)
          ..setLabelColor(theme!.primary1);
        return component;
      case WTButtonVariant.iconOnlyPrimary:
        var component = WTButtonIconOnly()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 10.0, 'top': 10.0, 'right': 10.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 10.0, 'top': 10.0, 'right': 10.0, 'bottom': 10.0 })
          ..setBackgroundColor(theme!.primary1)
          ..setIconSize(25.0)
          ..setIconColor(theme!.primary5);
        return component;
      case WTButtonVariant.iconOnlySecondary:
        var component = WTButtonIconOnly()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 10.0, 'top': 10.0, 'right': 10.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 10.0, 'top': 10.0, 'right': 10.0, 'bottom': 10.0 })
          ..setBackgroundColor(theme!.base2)
          ..setIconSize(25.0)
          ..setIconColor(theme!.primary1);
        return component;
      case WTButtonVariant.iconOnlyTertiary:
        var component = WTButtonIconOnly()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 10.0, 'top': 10.0, 'right': 10.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 10.0, 'top': 10.0, 'right': 10.0, 'bottom': 10.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setIconSize(25.0)
          ..setIconColor(theme!.primary1);
        return component;
    }
  }

  @override
  WTInputButton? createInputButton(WTInputButtonVariant variant) {
    switch(variant) {
      case WTInputButtonVariant.checkboxBasic:
        var component = WTCheckBoxBasic()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setMargin(map: { 'left': 15.0, 'top': 5.0, 'right': 15.0, 'bottom': 5.0 })
          ..setBackgroundColor(Colors.transparent)
          ..isChecked(false)
          ..setActiveIcon(Symbols.check_box)
          ..setActiveIconColor(theme!.primary1)
          ..setInactiveIcon(Symbols.check_box_outline_blank)
          ..setInactiveIconColor(theme!.text5)
          ..setLabelColor(theme!.text1);
        return component;
      case WTInputButtonVariant.radioBasic:
        var component = WTRadioButtonBasic()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setMargin(map: { 'left': 15.0, 'top': 5.0, 'right': 15.0, 'bottom': 5.0 })
          ..isChecked(false)
          ..setBackgroundColor(Colors.transparent)
          ..setActiveIcon(Symbols.radio_button_checked)
          ..setActiveIconColor(theme!.primary1)
          ..setInactiveIcon(Symbols.radio_button_unchecked)
          ..setInactiveIconColor(theme!.text5)
          ..setLabelColor(theme!.text1);
        return component;
    }
  }

  @override
  WTTabs? createTabs(WTTabsVariant variant) {
    switch(variant) {
      case WTTabsVariant.regular:
        var component = WTTabsRegular()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 10.0, 'top': 5.0, 'right': 10.0, 'bottom': 5.0 })
          ..setMargin(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setActiveBackgroundColor(theme!.primary1)
          ..setLabelColor(theme!.text5)
          ..setActiveLabelColor(theme!.primary1);
        return component;
      case WTTabsVariant.aesthetic:
        var component = WTTabsAesthetic()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setMargin(map: { 'left': 10.0, 'top': 20.0, 'right': 10.0, 'bottom': 20.0 })
          ..setBackgroundColor(theme!.text5)
          ..setActiveBackgroundColor(theme!.primary1)
          ..setLabelColor(theme!.text1)
          ..setActiveLabelColor(theme!.primary5);
        return component;
    }
  }

  @override
  WTLoadingComponent? createLoadingComponent(WTLoadingComponentVariant variant) {
    switch(variant) {
      case WTLoadingComponentVariant.onboarding1:
        var component = WTLoadingOnboardingView()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setBackgroundColor(theme!.base1)
          ..setTitleColor(theme!.text3)
          ..setTitleBackgroundColor(theme!.base1)
          ..setSubtitleColor(theme!.text4)
          ..setSubtitleBackgroundColor(theme!.base1)
          ..setLabelColor(theme!.text3)
          ..setLabelBackgroundColor(theme!.base1)
          ..setIcon(Symbols.arrow_back_ios)
          ..setIconColor(theme!.text1)
          ..setIconBackgroundColor(theme!.base1)
          ..setPrimaryButtonLabelColor(theme!.primary1)
          ..setPrimaryButtonBackgroundColor(theme!.base1)
          ..setSecondaryButtonLabelColor(theme!.primary5)
          ..setSecondaryButtonBackgroundColor(theme!.primary1);
        return component;
      case WTLoadingComponentVariant.loadingView:
        var component = WTLoadingView()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setBackgroundColor(theme!.base1)
          ..setIconColor(theme!.primary1)
          ..setLabelColor(theme!.text3);
        return component;
      case WTLoadingComponentVariant.shimmerHeader:
        var component = WTLoadingShimmerHeader()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setShimmerPrimaryColor(theme!.shade11)
          ..setShimmerSecondaryColor(theme!.shade10);
        return component;
      case WTLoadingComponentVariant.shimmerCard:
        var component = WTLoadingShimmerCard()
          ..setBuildContext(getCurrentContext())
          ..setShimmerPrimaryColor(theme!.shade11)
          ..setShimmerSecondaryColor(theme!.shade10);
        return component;
      case WTLoadingComponentVariant.shimmerActionsCard:
        var component = WTLoadingShimmerActionsCard()
          ..setBuildContext(getCurrentContext())
          ..setShimmerPrimaryColor(theme!.shade11)
          ..setShimmerSecondaryColor(theme!.shade10);
        return component;
      case WTLoadingComponentVariant.shimmerComponentCard:
        var component = WTLoadingShimmerComponentCard()
          ..setBuildContext(getCurrentContext())
          ..setShimmerPrimaryColor(theme!.shade11)
          ..setShimmerSecondaryColor(theme!.shade10);
        return component;
      case WTLoadingComponentVariant.shimmerFooter:
        var component = WTLoadingShimmerFooter()
          ..setBuildContext(getCurrentContext())
          ..setShimmerPrimaryColor(theme!.shade11)
          ..setShimmerSecondaryColor(theme!.shade10);
        return component;
    }
  }

  @override
  WTFlyChooser? createFlyChooser(WTFlyChooserVariant variant) {
    switch(variant) {
      case WTFlyChooserVariant.basic:
        var component = WTFlyChooserBasic()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setHeight(componentConfiguration!.deviceHeight!)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setBackgroundColor(theme!.base2)
          ..setLinkAction(modalNavigateBack)
          ..setLinkLabelColor(theme!.text1)
          ..setLinkIcon(Symbols.close)
          ..setLinkIconColor(theme!.text1);
        return component;
    }
  }

  @override
  WTFlyMenu? createFlyMenu(WTFlyMenuVariant variant) {
    switch(variant) {
      case WTFlyMenuVariant.basic:
        var component = WTFlyMenuBasic()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setWidth(componentConfiguration!.deviceWidth!)
          ..setHeight(componentConfiguration!.deviceHeight!)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setBackgroundColor(theme!.base2)
          ..setIcon(Symbols.menu)
          ..setIconColor(theme!.primary5)
          ..setIconBackgroundColor(theme!.primary1)
          ..setLinkAction(modalNavigateBack)
          ..setLinkIcon(Symbols.close)
          ..setLinkIconColor(theme!.text1)
          ..setLinkLabelColor(theme!.text1)
          ..setLinkDescriptionColor(theme!.text1)
          ..showMainArea(true)
          ..showAwaitArea(false)
          ..showMessageArea(false)
          ..setActionIconColor(theme!.text1)
          ..setActionIconBackgroundColor(Colors.transparent)
          ..setActionIconBorderColor(Colors.transparent)
          ..setActionLabelColor(theme!.text1)
          ..setAwaitIconColor(theme!.primary1)
          ..setAwaitIconBackgroundColor(Colors.transparent)
          ..setAwaitLabel('flyMenuAwaitLabel'.tr)
          ..setAwaitLabelColor(theme!.text1)
          ..setMessageInfoIcon(Symbols.info)
          ..setMessageInfoColor(theme!.text1!)
          ..setMessageSuccessIcon(Symbols.check)
          ..setMessageSuccessColor(Colors.green)
          ..setMessageDangerIcon(Symbols.info)
          ..setMessageDangerColor(theme!.error1)
          ..setMessageLabelColor(theme!.text4);
        return component;
    }
  }

  @override
  WTDialogueBox? createDialogueBox(WTDialogueBoxVariant variant) {
    switch(variant) {
      case WTDialogueBoxVariant.confirmation:
        var component = WTDialogueBoxImpl()
          ..setBuildContext(getCurrentContext())
          ..setCloseAction(modalNavigateBack)
          ..setDuration(const Duration(seconds: 15))
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base1)
          ..setIcon(FontAwesomeIcons.question)
          ..setIconColor(theme!.primary1)
          ..setIconBackgroundColor(theme!.primary4)
          ..setTitleColor(theme!.text1)
          ..setDescriptionColor(theme!.text1)
          ..setSaveButtonLabelColor(theme!.primary5)
          ..setSaveButtonBackgroundColor(theme!.primary1)
          ..setCancelButtonLabelColor(theme!.primary1)
          ..setCancelButtonBackgroundColor(Colors.transparent);
        return component;
      case WTDialogueBoxVariant.warning:
        var component = WTDialogueBoxImpl()
          ..setBuildContext(getCurrentContext())
          ..setCloseAction(modalNavigateBack)
          ..setDuration(const Duration(seconds: 15))
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base1)
          ..setIcon(FontAwesomeIcons.exclamation)
          ..setIconColor(theme!.error1)
          ..setIconBackgroundColor(theme!.error4)
          ..setTitleColor(theme!.text1)
          ..setDescriptionColor(theme!.text1)
          ..setSaveButtonLabelColor(theme!.primary5)
          ..setSaveButtonBackgroundColor(theme!.primary1)
          ..setCancelButtonLabelColor(theme!.primary1)
          ..setCancelButtonBackgroundColor(Colors.transparent);
        return component;
      case WTDialogueBoxVariant.notification:
        var component = WTDialogueBoxNotification()
          ..setBuildContext(getCurrentContext())
          ..setWarningColors({
            'basic': {
              'backgroundColor': theme!.base1,
              'borderColor':     theme!.shade10,
              'labelColor':      theme!.text1,
            },
            'info': {
              'backgroundColor': theme!.primary1,
              'borderColor':     theme!.shade7,
              'labelColor':      theme!.primary4,
            },
            'success': {
              'backgroundColor': theme!.success1,
              'borderColor':     theme!.shade7,
              'labelColor':      theme!.success5,
            },
            'danger': {
              'backgroundColor': theme!.error1,
              'borderColor':     theme!.shade7,
              'labelColor':      theme!.error5,
            },
            'warning': {
              'backgroundColor': Colors.orange,
              'borderColor':     theme!.shade7,
              'labelColor':      Colors.white,
            },
          })
          ..basic()
          ..setCloseAction(modalNavigateBack)
          ..setDuration(const Duration(seconds: 15));
        return component;
    }
  }

  @override
  WTDashboardCard? createDashboardCard(WTDashboardCardVariant variant) {
    switch(variant) {
      case WTDashboardCardVariant.basicActionHorizontal:
        var component = WTDashboardCardActionHorizontalBasic()
          ..setGoogleFonts(fonts)
          ..enableBorder(true)
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor( theme!.base2)
          ..setShadeColor(theme!.shade10)
          ..setActionItemTitleColor(theme!.text1)
          ..setActionItemTitleWeight(FontWeight.normal)
          ..setActionItemIconColor(theme!.primary1)
          ..setActionItemIconBackgroundColor(theme!.primary5)
          ..setActionItemIconBorderColor(theme!.text5)
          ..setActionItemDecorationIconColor(theme!.primary5)
          ..setActionItemDecorationIconBackgroundColor(theme!.primary1)
          ..setActionItemDecorationIconBorderColor(theme!.text4);
        return component;
      case WTDashboardCardVariant.basicActionVertical:
        var component = WTDashboardCardActionVerticalBasic()
          ..setGoogleFonts(fonts)
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base1)
          ..setShadeColor(theme!.shade10)
          ..setActionItemTitleColor(theme!.text1)
          ..setActionItemTitleWeight(FontWeight.bold)
          ..setActionItemSubtitleColor(theme!.text5)
          ..setActionItemSubtitleWeight(FontWeight.normal)
          ..setActionItemIconColor(theme!.primary1)
          ..setActionItemIconBackgroundColor(theme!.primary5)
          ..setActionItemIconBorderColor(theme!.text5)
          ..setActionItemDecorationIconColor(theme!.primary5)
          ..setActionItemDecorationIconBackgroundColor(theme!.primary1)
          ..setActionItemDecorationIconBorderColor(theme!.text4);
        return component;
      case WTDashboardCardVariant.basicGrid:
        var component = WTDashboardCardGridBasic()
          ..setGoogleFonts(fonts)
          ..setGridCrossAxisCountMinAndMax(min: 4, max: 6)
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base1)
          ..setShadeColor(theme!.shade10)
          ..setActionItemTitleColor(theme!.text1)
          ..setActionItemTitleWeight(FontWeight.normal)
          ..setActionItemIconColor(theme!.primary1)
          ..setActionItemIconBackgroundColor(theme!.primary5)
          ..setActionItemIconBorderColor(theme!.text5)
          ..setActionItemDecorationIconColor(theme!.primary5)
          ..setActionItemDecorationIconBackgroundColor(theme!.primary1)
          ..setActionItemDecorationIconBorderColor(theme!.text4);
        return component;
      case WTDashboardCardVariant.basicChart:
        var component = WTDashboardCardChartBasic()
          ..setGoogleFonts(fonts)
          ..setChartType('chart')
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base1)
          ..setShadeColor(theme!.shade10)
          ..setTitleColor(theme!.text1)
          ..setIconColor(theme!.primary1)
          ..setHeadingColor(theme!.text1)
          ..setDescriptionColor(theme!.text1);
        return component;
      case WTDashboardCardVariant.basicItem:
        var component = WTDashboardCardItemBasic()
          ..setGoogleFonts(fonts)
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base1)
          ..setShadeColor(theme!.shade10)
          ..setTitleColor(theme!.text1)
          ..setIconColor(theme!.text1)
          ..setIconType('fontAwesome')
          ..setIconData(FontAwesomeIcons.clockRotateLeft)
          ..setButtonIconType('fontAwesome')
          ..setButtonIcon(FontAwesomeIcons.arrowRight)
          ..setButtonIconColor(theme!.primary2)
          ..setButtonLabelColor(theme!.primary2)
          ..setButtonBackgroundColor(theme!.primary4);
        return component;
    }
  }

  @override
  WTDashboardCardList? createDashboardCardList(WTDashboardCardListVariant? variant) {
    switch(variant!) {
      case WTDashboardCardListVariant.basicScrolling:
        var component = WTDashboardCardListScrollingBasic()
          ..setGoogleFonts(fonts)
          ..setTitleColor(theme!.text1);
        return component;
    }
  }

  @override
  WTCardList? createCardList(WTCardListVariant variant) {
    switch(variant) {
      case WTCardListVariant.basic1:
        var component = WTCardListBasic1()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..enableBorder(false)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setBorderColor(Colors.transparent)
          ..setShadeColor(Colors.transparent)
          ..setItemIconColor(theme!.text1!)
          ..setItemIconBackgroundColor(Colors.transparent)
          ..setItemActionIconColor(theme!.text1!)
          ..setItemActionIconBackgroundColor(Colors.transparent)
          ..setItemTitleColor(theme!.text1!)
          ..setItemSubtitleColor(theme!.text3!);
        return component;
      case WTCardListVariant.optionBasic1:
        var component = WTCardListOptionBasic1()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..enableBorder(false)
          ..setPadding(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setMargin(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setBorderColor(Colors.transparent)
          ..setShadeColor(Colors.transparent)
          ..setItemIconColor(theme!.text1!)
          ..setItemIconBackgroundColor(Colors.transparent)
          ..setItemActionIconColor(theme!.primary1!) // text1
          ..setItemActionIconBackgroundColor(Colors.transparent)
          ..setItemTitleColor(theme!.text1!);
        return component;
      case WTCardListVariant.info1:
        var component = WTCardListInfo()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..enableBorder(true)
          ..setPadding(map: { 'left': 15.0, 'top': 10.0, 'right': 15.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 10.0, 'top': 10.0, 'right': 10.0, 'bottom': 10.0 })
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base2)
          ..setShadeColor(theme!.shade10)
          ..setItemIconColor(theme!.primary5)
          ..setItemIconBackgroundColor(theme!.primary1)
          ..setItemIconBorderColor(theme!.primary5)
          ..setItemDecorationIconColor(theme!.primary1)
          ..setItemDecorationIconBackgroundColor(theme!.primary5)
          ..setItemDecorationIconBorderColor(theme!.primary1)
          ..setItemActionItemIcon(Symbols.arrow_forward_ios)
          ..setItemActionIconColor(theme!.text1)
          ..setItemActionIconBackgroundColor(Colors.transparent)
          ..setItemActionIconBorderColor(Colors.transparent)
          ..setItemTitleColor(theme!.text1)
          ..setItemSubtitleColor(theme!.text1)
          ..setItemHeadingColor(theme!.text1)
          ..setItemDescriptionColor(theme!.text1);
        return component;
      case WTCardListVariant.info2:
        var component = WTCardListInfo()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..enableBorder(false)
          ..setPadding(map: { 'left': 15.0, 'top': 10.0, 'right': 15.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 10.0, 'top': 10.0, 'right': 10.0, 'bottom': 10.0 })
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base2)
          ..setShadeColor(theme!.shade10)
          ..setTitleColor(theme!.text1)
          ..setItemIconColor(theme!.primary5)
          ..setItemIconBackgroundColor(theme!.primary1)
          ..setItemIconBorderColor(theme!.primary5)
          ..setItemDecorationIconColor(theme!.primary1)
          ..setItemDecorationIconBackgroundColor(theme!.primary5)
          ..setItemDecorationIconBorderColor(theme!.primary1)
          ..setItemActionIconColor(theme!.text1)
          ..setItemActionIconBackgroundColor(Colors.transparent)
          ..setItemActionIconBorderColor(Colors.transparent)
          ..setItemTitleColor(theme!.text1)
          ..setItemSubtitleColor(theme!.text1)
          ..setItemHeadingColor(theme!.text1)
          ..setItemDescriptionColor(theme!.text1);
        return component;
      case WTCardListVariant.info3:
        var component = WTCardListInfo()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..enableBorder(false)
          ..setPadding(map: { 'left': 15.0, 'top': 10.0, 'right': 15.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 10.0, 'top': 10.0, 'right': 10.0, 'bottom': 10.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setBorderColor(Colors.transparent)
          ..setShadeColor(Colors.transparent)
          ..setItemIconColor(theme!.primary5)
          ..setItemIconBackgroundColor(theme!.primary1)
          ..setItemIconBorderColor(theme!.primary5)
          ..setItemDecorationIconColor(theme!.primary1)
          ..setItemDecorationIconBackgroundColor(theme!.primary5)
          ..setItemDecorationIconBorderColor(theme!.primary1)
          ..setItemActionIconColor(theme!.text1)
          ..setItemActionIconBackgroundColor(Colors.transparent)
          ..setItemActionIconBorderColor(Colors.transparent)
          ..setItemTitleColor(theme!.text1)
          ..setItemSubtitleColor(theme!.text1)
          ..setItemHeadingColor(theme!.text1)
          ..setItemDescriptionColor(theme!.text1);
        return component;
      case WTCardListVariant.text1:
        var component = WTCardListText1()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..enableBorder(true)
          ..setPadding(map: { 'left': 5.0, 'top': 15.0, 'right': 5.0, 'bottom': 15.0 })
          ..setMargin(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base2)
          ..setShadeColor(theme!.shade10)
          ..setTitleColor(theme!.text1)
          ..setItemTitleColor(theme!.text1)
          ..setItemSubtitleColor(theme!.text1)
          ..setItemActionLabelColor(theme!.text1)
          ..setItemActionSubLabelColor(theme!.text1);
        return component;
      case WTCardListVariant.text2:
        var component = WTCardListText1()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..enableBorder(false)
          ..setPadding(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setMargin(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setBorderColor(Colors.transparent)
          ..setShadeColor(Colors.transparent)
          ..setTitleColor(theme!.text2)
          ..setItemTitleColor(theme!.text3)
          ..setItemSubtitleColor(theme!.text3)
          ..setItemActionLabelColor(theme!.text2)
          ..setItemActionSubLabelColor(theme!.text2);
        return component;
      case WTCardListVariant.text3:
        var component = WTCardListText2()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..enableBorder(false)
          ..setPadding(map: { 'left': 5.0, 'top': 15.0, 'right': 5.0, 'bottom': 15.0 })
          ..setMargin(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setBorderColor(Colors.transparent)
          ..setShadeColor(Colors.transparent)
          ..disableIcon()
          ..setTitleColor(theme!.text1)
          ..setItemTitleColor(theme!.text1)
          ..setItemSubtitleColor(theme!.text1)
          ..setItemActionLabelColor(theme!.text1)
          ..setItemActionSubLabelColor(theme!.text1);
        return component;
      case WTCardListVariant.quickActionGridList:
        var component = WTCardListQuickActionGrid()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setExpandable(false)
          ..setPadding(map: { 'left': 8.0, 'top': 8.0, 'right': 8.0, 'bottom': 8.0 })
          ..setMargin(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base2)
          ..setShadeColor(theme!.shade10)
          ..setItemIconColor(theme!.primary1)
          ..setItemIconBackgroundColor(theme!.primary5)
          ..setItemIconBorderColor(theme!.text5)
          ..setItemDecorationIconColor(theme!.primary5)
          ..setItemDecorationIconBackgroundColor(theme!.primary1)
          ..setItemDecorationIconBorderColor(theme!.text4)
          ..setItemTitleColor(theme!.text1);
        return component;
      case WTCardListVariant.quickActionGridListExpanded:
        var component = WTCardListQuickActionGrid()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setExpandable(true)
          ..setGridListItemsPerRow(2)
          ..setPadding(map: { 'left': 8.0, 'top': 8.0, 'right': 8.0, 'bottom': 8.0 })
          ..setMargin(map: { 'left': 0.0, 'top': 0.0, 'right': 0.0, 'bottom': 0.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setBorderColor(Colors.transparent)
          ..setShadeColor(Colors.transparent)
          ..setItemIconColor(theme!.primary1)
          ..setItemIconBackgroundColor( theme!.primary5)
          ..setItemIconBorderColor(theme!.text5)
          ..setItemDecorationIconColor(theme!.primary5)
          ..setItemDecorationIconBackgroundColor(theme!.primary1)
          ..setItemDecorationIconBorderColor(theme!.text4)
          ..setItemTitleColor(theme!.text1);
        return component;
      case WTCardListVariant.quickExtendedActionVerticalList:
        var component = WTCardListQuickExtendedActionVertical()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setHeight(componentConfiguration!.config!.deviceHeight)
          ..setExpandable(false)
          ..setPadding(map: { 'left': 10.0, 'top': 10.0, 'right': 10.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base1)
          ..setShadeColor(theme!.shade10)
          ..setItemIconColor(theme!.primary1)
          ..setItemIconBackgroundColor(theme!.primary5)
          ..setItemIconBorderColor(theme!.text5)
          ..setItemDecorationIconColor(theme!.primary5)
          ..setItemDecorationIconBackgroundColor(theme!.primary1)
          ..setItemDecorationIconBorderColor(theme!.text4)
          ..setItemActionIconColor(theme!.text1)
          ..setItemActionIconBackgroundColor(Colors.transparent)
          ..setItemActionIconBorderColor(Colors.transparent)
          ..setItemActionDecorationIconColor(theme!.primary5)
          ..setItemActionDecorationIconBackgroundColor(theme!.primary1)
          ..setItemActionDecorationIconBorderColor(theme!.text4)
          ..setItemTitleColor(theme!.text1)
          ..setItemSubtitleColor(theme!.text5);
        return component;
      case WTCardListVariant.quickExtendedActionVerticalListExpanded:
        var component = WTCardListQuickExtendedActionVertical()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setExpandable(true)
          ..setPadding(map: { 'left': 10.0, 'top': 10.0, 'right': 10.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setBorderColor(Colors.transparent)
          ..setShadeColor(Colors.transparent)
          ..setItemIconColor(theme!.primary1)
          ..setItemIconBackgroundColor(theme!.primary5)
          ..setItemIconBorderColor(theme!.text5)
          ..setItemDecorationIconColor(theme!.text5)
          ..setItemDecorationIconBackgroundColor(theme!.primary1)
          ..setItemDecorationIconBorderColor(theme!.text4)
          ..setItemActionIconColor(theme!.text1)
          ..setItemActionIconBackgroundColor(Colors.transparent)
          ..setItemActionIconBorderColor(Colors.transparent)
          ..setItemActionDecorationIconColor(theme!.primary5)
          ..setItemActionDecorationIconBackgroundColor(theme!.primary1)
          ..setItemActionDecorationIconBorderColor(theme!.text4)
          ..setItemTitleColor(theme!.text1)
          ..setItemSubtitleColor(theme!.text5);
        return component;
      case WTCardListVariant.overview:
        var component = WTCardListOverview()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 10.0, 'top': 10.0, 'right': 10.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base1)
          ..setShadeColor(theme!.shade10)
          ..setTitleColor(theme!.text1)
          ..setButtonLabel(translate('reviewAll'))
          ..setButtonLabelColor(theme!.primary5)
          ..setButtonBackgroundColor(theme!.primary1)
          ..setItemIconColor(theme!.primary1)
          ..setItemTitleColor(theme!.text1)
          ..setItemSubtitleColor(theme!.text5)
          ..setItemHeadingColor(theme!.text1);
        return component;
      case WTCardListVariant.grouped:
        var component = WTCardListGrouped()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setBackgroundColor(Colors.transparent);
        return component;
      case WTCardListVariant.groupedOption:
        var component = WTCardListGroupedOption()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..enableBorder(false)
          ..setPadding(map: { 'left': 10.0, 'top': 10.0, 'right': 10.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setItemIconColor(theme!.primary1)
          ..setItemActionItemIcon(Symbols.arrow_forward_ios)
          ..setItemTitleColor(theme!.text1);
        return component;
    }
  }

  @override
  WTCard? createCard(WTCardVariant variant) {
    switch(variant) {
      case WTCardVariant.welcome:
        var component = WTCardWelcome()
          ..setBuildContext(getCurrentContext())
          ..enableBorder(true)
          ..setGoogleFonts(fonts)
          ..setBackgroundColor(Colors.transparent)
          ..setBorderColor(Colors.transparent)
          ..setShadeColor(Colors.transparent)
          ..setIconColor(theme!.primary1)
          ..setIconBackgroundColor(Colors.transparent)
          ..setIconBorderColor(Colors.transparent)
          ..setTitleColor(theme!.text1)
          ..setSubtitleColor(theme!.text1);
        return component;
      case WTCardVariant.view:
        var component = WTCardView()
          ..setBuildContext(getCurrentContext())
          ..enableBorder(true)
          ..setGoogleFonts(fonts)
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base2)
          ..setShadeColor(theme!.shade10)
          ..setTitleColor(theme!.text1);
        return component;
      case WTCardVariant.activityLog:
        var component = WTCardActivityLog()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base1)
          ..setShadeColor(theme!.shade10)
          ..setIconColor(theme!.primary1)
          ..setIconBackgroundColor(theme!.primary4)
          ..setIconBorderColor(theme!.primary4)
          ..setActionIcon(Symbols.arrow_forward_ios)
          ..setActionIconColor(theme!.text1)
          ..setActionIconBackgroundColor(Colors.transparent)
          ..setActionIconBorderColor(Colors.transparent)
          ..setTitleColor(theme!.text1)
          ..setSubtitleColor(theme!.text1)
          ..setHeadingColor(theme!.text1);
        return component;
      case WTCardVariant.setupProcess:
        var component = WTCardSetupProcess()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base2)
          ..setShadeColor(theme!.shade10)
          ..setHeadingColor(theme!.text1)
          ..setHeadingBackgroundColor(theme!.primary5)
          ..setHeadingBorderColor(theme!.primary4)
          ..setTitleColor(theme!.text1)
          ..setSubtitleColor(theme!.text1)
          ..setDescriptionColor(theme!.text1);
        return component;
      case WTCardVariant.quickAction1:
        var component = WTCardQuickAction()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..enableBorder(false)
          ..setPadding(map: { 'left': 10.0, 'top': 10.0, 'right': 10.0, 'bottom': 10.0 })
          ..setMargin(map: { 'left': 7.5, 'top': 5.0, 'right': 7.5, 'bottom': 5.0 })
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base2)
          ..setShadeColor(theme!.shade10)
          ..setIconColor(theme!.primary1)
          ..setIconBackgroundColor(theme!.primary5)
          ..setIconBorderColor(theme!.text5)
          ..setDecorationIconColor(theme!.primary5)
          ..setDecorationIconBackgroundColor(theme!.primary1)
          ..setDecorationIconBorderColor(theme!.text4)
          ..setTitleColor(theme!.text1);
        return component;
      case WTCardVariant.quickAction2:
        var component = WTCardQuickAction()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..enableBorder(true)
          ..setPadding(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setMargin(map: { 'left': 7.5, 'top': 5.0, 'right': 7.5, 'bottom': 5.0 })
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base2)
          ..setShadeColor(theme!.shade10)
          ..setIconColor(theme!.primary1)
          ..setIconBackgroundColor(theme!.primary5)
          ..setIconBorderColor(theme!.text5)
          ..setDecorationIconColor(theme!.primary5)
          ..setDecorationIconBackgroundColor(theme!.primary1)
          ..setDecorationIconBorderColor(theme!.text4)
          ..setTitleColor(theme!.text1);
        return component;
      case WTCardVariant.quickExtendedAction1:
        var component = WTCardQuickExtendedAction()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..enableBorder(false)
          ..setPadding(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setMargin(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setBorderColor(Colors.transparent)
          ..setShadeColor(Colors.transparent)
          ..setIconColor( theme!.primary1)
          ..setIconBackgroundColor(theme!.primary5)
          ..setIconBorderColor(theme!.text5)
          ..setDecorationIconColor(theme!.primary5)
          ..setDecorationIconBackgroundColor(theme!.primary1)
          ..setDecorationIconBorderColor(theme!.text4)
          ..setActionIconColor(theme!.text1)
          ..setActionIconBackgroundColor(Colors.transparent)
          ..setActionIconBorderColor(Colors.transparent)
          ..setTitleColor(theme!.text1)
          ..setSubtitleColor(theme!.text5);
        return component;
      case WTCardVariant.quickExtendedAction2:
        var component = WTCardQuickExtendedAction()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..enableBorder(true)
          ..setPadding(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setMargin(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base1)
          ..setShadeColor(theme!.shade10)
          ..setIconColor(theme!.primary1)
          ..setIconBackgroundColor(theme!.primary5)
          ..setIconBorderColor(theme!.text5)
          ..setDecorationIconColor(theme!.primary5)
          ..setDecorationIconBackgroundColor(theme!.primary1)
          ..setDecorationIconBorderColor(theme!.text4)
          ..setActionIconColor(theme!.text1)
          ..setActionIconBackgroundColor(Colors.transparent)
          ..setActionIconBorderColor(Colors.transparent)
          ..setActionDecorationIconColor(theme!.primary5)
          ..setActionDecorationIconBackgroundColor(theme!.primary1)
          ..setActionDecorationIconBorderColor(theme!.text4)
          ..setTitleColor(theme!.text1)
          ..setSubtitleColor(theme!.text5);
        return component;
      case WTCardVariant.quickExtendedAction3:
        var component = WTCardQuickExtendedAction()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..enableBorder(true)
          ..setPadding(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setMargin(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base1)
          ..setShadeColor(theme!.shade10)
          ..setIconColor(theme!.primary1)
          ..setIconBackgroundColor(theme!.primary4)
          ..setIconBorderColor(theme!.primary4)
          ..setDecorationIconColor(theme!.primary4)
          ..setDecorationIconBackgroundColor(theme!.primary1)
          ..setDecorationIconBorderColor(theme!.text5)
          ..setActionIconColor(theme!.text1)
          ..setActionIconBackgroundColor(Colors.transparent)
          ..setActionIconBorderColor(Colors.transparent)
          ..setActionDecorationIconColor(theme!.primary4)
          ..setActionDecorationIconBackgroundColor(theme!.primary1)
          ..setActionDecorationIconBorderColor(theme!.text5)
          ..setTitleColor(theme!.text1)
          ..setSubtitleColor(theme!.text1);
        return component;
      case WTCardVariant.quickExtendedAction4:
        var component = WTCardQuickExtendedAction()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..enableBorder(true)
          ..setPadding(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setMargin(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setBackgroundColor(Colors.transparent)
          ..setBorderColor(Colors.transparent)
          ..setShadeColor(Colors.transparent)
          ..setIconColor(theme!.text1)
          ..setIconBackgroundColor(Colors.transparent)
          ..setIconBorderColor(Colors.transparent)
          ..setDecorationIconColor(theme!.primary4)
          ..setDecorationIconBackgroundColor(theme!.primary1)
          ..setDecorationIconBorderColor(theme!.text5)
          ..setActionIconColor(theme!.text1)
          ..setActionIconBackgroundColor(Colors.transparent)
          ..setActionIconBorderColor(Colors.transparent)
          ..setActionDecorationIconColor(theme!.primary4)
          ..setActionDecorationIconBackgroundColor(theme!.primary1)
          ..setActionDecorationIconBorderColor(theme!.text5)
          ..setTitleColor(theme!.text1)
          ..setSubtitleColor(theme!.text1);
        return component;
      case WTCardVariant.text1:
        var component = WTCardText()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setBackgroundColor( theme!.base1)
          ..setBorderColor(theme!.base2)
          ..setShadeColor(theme!.base2)
          ..setTitleColor(theme!.text1)
          ..setSubtitleColor(theme!.text3)
          ..setActionLabelColor(theme!.text1)
          ..setActionSubLabelColor(theme!.text3);
        return component;
      case WTCardVariant.text2:
        var component = WTCardText2()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setBackgroundColor( theme!.base1)
          ..setBorderColor(theme!.base2)
          ..setShadeColor(theme!.base2)
          ..setTitleColor(theme!.text1)
          ..setSubtitleColor(theme!.text3)
          ..setActionLabelColor(theme!.text1)
          ..setActionSubLabelColor(theme!.text3);
        return component;
      case WTCardVariant.badge1:
        var component = WTCardBadge()
          ..setBuildContext(getCurrentContext())
          ..setGoogleFonts(fonts)
          ..setPadding(map: { 'left': 12.5, 'top': 15.0, 'right': 12.5, 'bottom': 15.0 })
          ..setMargin(map: { 'left': 7.5, 'top': 5.0, 'right': 7.5, 'bottom': 5.0 })
          ..setBackgroundColor(theme!.base1)
          ..setBorderColor(theme!.base2)
          ..setShadeColor(theme!.shade10)
          ..setTitleColor(theme!.text1)
          ..setSubtitleColor(theme!.text1)
          ..setActionLabelColor(theme!.text4)
          ..setActionSubLabelColor(theme!.text4);
        return component;
    }
  }

  @override
  WTPdfViewer? createPdfViewer(WTPdfViewerVariant variant) {
    switch(variant) {
      case WTPdfViewerVariant.basic:
        var component = WTPdfViewerBasic()
          ..setBuildContext(getCurrentContext())
          ..setBackgroundColor(theme!.base1)
          ..setPadding(map: { 'left': 1.0, 'top': 1.0, 'right': 1.0, 'bottom': 1.0 })
          ..setMargin(map: { 'left': 5.0, 'top': 5.0, 'right': 5.0, 'bottom': 5.0 })
          ..setConfirmLabel('confirm'.tr)
          ..setConfirmLabelColor(theme!.text1!);
        return component;
    }
  }

  @override
  WTSignature? createSignature(WTSignatureVariant variant) {
    switch(variant) {
      case WTSignatureVariant.basic:
        var component = WTSignatureBasic()
          ..setPenStrokeWidth(1)
          ..setPenColor(theme!.primary1)
          ..setBackgroundColor(theme!.base1)
          ..setDoneButtonColor(Colors.transparent)
          ..setDoneButtonLabelColor(theme!.primary1)
          ..setDoneButtonLabel('done'.tr)
          ..setClearButtonColor(theme!.primary1)
          ..setClearButtonLabelColor(theme!.primary5)
          ..setClearButtonLabel('clear'.tr);
        return component;
    }
  }

}
