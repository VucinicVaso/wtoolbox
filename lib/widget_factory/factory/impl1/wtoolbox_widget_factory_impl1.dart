import 'package:flutter/material.dart';
import 'package:wtoolbox/external/lib_getx.dart';
import 'package:wtoolbox/external/lib_fontaws.dart';
import 'package:wtoolbox/external/lib_material_symbols.dart';
import '../wtoolbox_widget_factory.dart';
import '../../type/impl1/wtoolbox_widget_type.dart';
import '../../widget/empty/wtoolbox_empty_widget.dart';
import '../../widget/empty/impl/wtoolbox_empty_widget_impl.dart';
import '../../widget/divider/wtoolbox_divider_widget.dart';
import '../../widget/divider/horizontal/wtoolbox_divider_widget_horizontal.dart';
import '../../widget/layout/wtoolbox_layout.dart';
import '../../widget/layout/horizontal/wtoolbox_layout_horizontal.dart';
import '../../widget/layout/vertical/wtoolbox_layout_vertical.dart';
import '../../widget/layout/vertical/wtoolbox_layout_vertical_scrollable.dart';
import '../../widget/layout/vertical/wtoolbox_layout_vertical_expandable.dart';
import '../../widget/layout/vertical/wtoolbox_layout_vertical_expandable_and_scrollable.dart';
import '../../widget/scaffold/wtoolbox_scaffold.dart';
import '../../widget/scaffold/impl/wtoolbox_scaffold_impl.dart';
import '../../widget/header/wtoolbox_header.dart';
import '../../widget/header/impl/wtoolbox_header_impl.dart';
import '../../widget/body/wtoolbox_body.dart';
import '../../widget/body/impl/wtoolbox_body_impl.dart';
import '../../widget/footer/wtoolbox_footer.dart';
import '../../widget/footer/fixed/wtoolbox_footer_fixed.dart';
import '../../widget/space/wtoolbox_space_widget.dart';
import '../../widget/space/basic/wtoolbox_space_widget_basic.dart';

class WTWidgetFactoryImpl1 extends WTWidgetFactory {

  @override
  WTScaffold? createScaffold(WTScaffoldType type) {
    switch(type) {
      case WTScaffoldType.basic1:
        var component = WTScaffoldImpl()
          ..setGlobalKey()
          ..isUnfocused(false)
          ..setBackgroundColor(theme!.background1);
        return component;
      case WTScaffoldType.basicUnfocused1:
        var component = WTScaffoldImpl()
          ..setGlobalKey()
          ..isUnfocused(true)
          ..setBackgroundColor(theme!.background1);
        return component;
      case WTScaffoldType.basic2:
        var component = WTScaffoldImpl()
          ..setGlobalKey()
          ..isUnfocused(false)
          ..setBackgroundColor(theme!.background2);
        return component;
      case WTScaffoldType.basicUnfocused2:
        var component = WTScaffoldImpl()
          ..setGlobalKey()
          ..isUnfocused(true)
          ..setBackgroundColor(theme!.background2);
        return component;
    }
  }

  @override
  WTHeader? createHeader(WTHeaderType type) {
    switch(type) {
      case WTHeaderType.basic1:
        var component = WTHeaderImpl()
          ..setBuildContext(getCurrentContext())
          ..withShadow(false)
          ..setWidth(deviceWidth!)
          ..setBackgroundColor(theme!.background1)
          ..setBackActionIconColor(theme!.text1)
          ..setBackActionLabelColor(theme!.text1)
          ..setBackActionLinkLabelColor(theme!.primary1)
          ..setBackActionSvgBackgroundColor(theme!.background2)
          ..setLabelColor(theme!.text1)
          ..setActionIconColor(theme!.text1)
          ..setActionIconBackgroundColor(theme!.background1)
          ..setActionLabelColor(theme!.text1)
          ..setActionLinkLabelColor(theme!.primary1)
          ..setMenuIcon(Symbols.more_vert_rounded)
          ..setMenuIconColor(theme!.text1)
          ..setMenuBackgroundColor(theme!.background2)
          ..setMenuItemIconColor(theme!.text1)
          ..setMenuItemLabelColor(theme!.text1);
        return component;
      case WTHeaderType.basic1WithShadow:
        var component = WTHeaderImpl()
          ..setBuildContext(getCurrentContext())
          ..withShadow(true)
          ..setWidth(deviceWidth!)
          ..setBackgroundColor(theme!.background1)
          ..setBackActionIconColor(theme!.text1)
          ..setBackActionLabelColor(theme!.text1)
          ..setBackActionLinkLabelColor(theme!.primary1)
          ..setBackActionSvgBackgroundColor(theme!.background2)
          ..setLabelColor(theme!.text1)
          ..setActionIconColor(theme!.text1)
          ..setActionIconBackgroundColor(theme!.background1)
          ..setActionLabelColor(theme!.text1)
          ..setActionLinkLabelColor(theme!.primary1)
          ..setMenuIcon(Symbols.more_vert_rounded)
          ..setMenuIconColor(theme!.text1)
          ..setMenuBackgroundColor(theme!.background2)
          ..setMenuItemIconColor(theme!.text1)
          ..setMenuItemLabelColor(theme!.text1);
        return component;
      case WTHeaderType.basic2:
        var component = WTHeaderImpl()
          ..setBuildContext(getCurrentContext())
          ..withShadow(false)
          ..setWidth(deviceWidth!)
          ..setBackgroundColor(theme!.background2)
          ..setBackActionIconColor(theme!.text1)
          ..setBackActionLabelColor(theme!.text1)
          ..setBackActionLinkLabelColor(theme!.primary1)
          ..setBackActionSvgBackgroundColor(theme!.background1)
          ..setLabelColor(theme!.text1)
          ..setActionIconColor(theme!.text1)
          ..setActionIconBackgroundColor(theme!.background1)
          ..setActionLabelColor(theme!.text1)
          ..setActionLinkLabelColor(theme!.primary1)
          ..setMenuIcon(Symbols.more_vert_rounded)
          ..setMenuIconColor(theme!.text1)
          ..setMenuBackgroundColor(theme!.background1)
          ..setMenuItemIconColor(theme!.text1)
          ..setMenuItemLabelColor(theme!.text1);
        return component;
      case WTHeaderType.basic2WithShadow:
        var component = WTHeaderImpl()
          ..setBuildContext(getCurrentContext())
          ..withShadow(true)
          ..setWidth(deviceWidth!)
          ..setBackgroundColor(theme!.background2)
          ..setBackActionIconColor(theme!.text1)
          ..setBackActionLabelColor(theme!.text1)
          ..setBackActionLinkLabelColor(theme!.primary1)
          ..setBackActionSvgBackgroundColor(theme!.background1)
          ..setLabelColor(theme!.text1)
          ..setActionIconColor(theme!.text1)
          ..setActionIconBackgroundColor(theme!.background1)
          ..setActionLabelColor(theme!.text1)
          ..setActionLinkLabelColor(theme!.primary1)
          ..setMenuIcon(Symbols.more_vert_rounded)
          ..setMenuIconColor(theme!.text1)
          ..setMenuBackgroundColor(theme!.background1)
          ..setMenuItemIconColor(theme!.text1)
          ..setMenuItemLabelColor(theme!.text1);
        return component;
    }
  }

  @override
  WTBody? createBody(WTBodyType type) {
    switch(type) {
      case WTBodyType.basic1:
        var component = WTBodyImpl()
          ..setBuildContext(getCurrentContext())
          ..setBackgroundColor(theme!.background1)
          ..setWidth(deviceWidth!)
          ..setHeight(deviceHeight!);
        return component;
      case WTBodyType.basic2:
        var component = WTBodyImpl()
          ..setBuildContext(getCurrentContext())
          ..setBackgroundColor(theme!.background2)
          ..setWidth(deviceWidth!)
          ..setHeight(deviceHeight!);
        return component;
    }
  }

  @override
  WTFooter? createFooter(WTFooterType type) {
    switch(type) {
      case WTFooterType.basic1Fixed:
        var component = WTFooterFixed()
          ..setBuildContext(getCurrentContext())
          ..setWidth(deviceWidth!)
          ..setBackgroundColor(theme!.background1)
          ..setSelectedItemBackgroundColor(theme!.primary4)
          ..setSelectedItemIconColor(theme!.primary1)
          ..setSelectedItemLabelColor(theme!.text1)
          ..setUnselectedItemBackgroundColor(theme!.background1)
          ..setUnselectedItemIconColor(theme!.text4)
          ..setUnselectedItemLabelColor(theme!.text4);
        return component;
      case WTFooterType.basic2Fixed:
        var component = WTFooterFixed()
          ..setBuildContext(getCurrentContext())
          ..setWidth(deviceWidth!)
          ..setBackgroundColor(theme!.background2)
          ..setSelectedItemBackgroundColor(theme!.primary4)
          ..setSelectedItemIconColor(theme!.primary1)
          ..setSelectedItemLabelColor(theme!.text1)
          ..setUnselectedItemBackgroundColor(theme!.background2)
          ..setUnselectedItemIconColor(theme!.text4)
          ..setUnselectedItemLabelColor(theme!.text4);
        return component;
    }
  }

  @override
  WTLayout? createLayout(WTLayoutType type) {
    switch(type) {
      case WTLayoutType.horizontal:
        var component = WTLayoutHorizontal()
          ..setBuildContext(getCurrentContext())
          ..setWidth(deviceWidth!)
          ..setHeight(deviceHeight!)
          ..setAlignment(null)
          ..setPadding(left: 7.5, top: 12.5, right: 7.5, bottom: 12.5)
          ..setMargin(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.center)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
      case WTLayoutType.horizontalFlat:
        var component = WTLayoutHorizontal()
          ..setBuildContext(getCurrentContext())
          ..setWidth(deviceWidth!)
          ..setHeight(deviceHeight!)
          ..setAlignment(null)
          ..setPadding(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
          ..setMargin(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.center)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
      case WTLayoutType.vertical:
        var component = WTLayoutVertical()
          ..setBuildContext(getCurrentContext())
          ..setWidth(deviceWidth!)
          ..setHeight(deviceHeight!)
          ..setAlignment(null)
          ..setPadding(left: 7.5, top: 12.5, right: 7.5, bottom: 12.5)
          ..setMargin(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.start)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
      case WTLayoutType.verticalFlat:
        var component = WTLayoutVertical()
          ..setBuildContext(getCurrentContext())
          ..setWidth(deviceWidth!)
          ..setHeight(deviceHeight!)
          ..setAlignment(null)
          ..setPadding(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
          ..setMargin(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.start)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
      case WTLayoutType.verticalScrollable:
        var component = WTLayoutVerticalScrollable()
          ..setBuildContext(getCurrentContext())
          ..setWidth(deviceWidth!)
          ..setHeight(deviceHeight!)
          ..setScrollable()
          ..setAlignment(null)
          ..setPadding(left: 7.5, top: 12.5, right: 7.5, bottom: 12.5)
          ..setMargin(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.start)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
      case WTLayoutType.verticalFlatScrollable:
        var component = WTLayoutVerticalScrollable()
          ..setBuildContext(getCurrentContext())
          ..setWidth(deviceWidth!)
          ..setHeight(deviceHeight!)
          ..setScrollable()
          ..setAlignment(null)
          ..setPadding(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
          ..setMargin(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.start)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
      case WTLayoutType.verticalExpanded:
        var component = WTLayoutVerticalExpandable()
          ..setBuildContext(getCurrentContext())
          ..setWidth(deviceWidth!)
          ..setHeight(deviceHeight!)
          ..setExpandable()
          ..setAlignment(null)
          ..setPadding(left: 7.5, top: 12.5, right: 7.5, bottom: 12.5)
          ..setMargin(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.start)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
      case WTLayoutType.verticalFlatExpanded:
        var component = WTLayoutVerticalExpandable()
          ..setBuildContext(getCurrentContext())
          ..setWidth(deviceWidth!)
          ..setHeight(deviceHeight!)
          ..setExpandable()
          ..setAlignment(null)
          ..setPadding(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
          ..setMargin(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.start)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
      case WTLayoutType.verticalExpandedAndScrollable:
        var component = WTLayoutVerticalExpandableAndScrollable()
          ..setBuildContext(getCurrentContext())
          ..setWidth(deviceWidth!)
          ..setHeight(deviceHeight!)
          ..setExpandable()
          ..setScrollable()
          ..setAlignment(null)
          ..setPadding(left: 7.5, top: 12.5, right: 7.5, bottom: 12.5)
          ..setMargin(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.start)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
      case WTLayoutType.verticalFlatExpandedAndScrollable:
        var component = WTLayoutVerticalExpandableAndScrollable()
          ..setBuildContext(getCurrentContext())
          ..setWidth(deviceWidth!)
          ..setHeight(deviceHeight!)
          ..setExpandable()
          ..setScrollable()
          ..setAlignment(null)
          ..setPadding(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
          ..setMargin(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.start)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
    }
  }

  @override
  WTEmptyWidget? createEmptyWidget(WTEmptyType type) {
    switch(type) {
      case WTEmptyType.empty:
        var component = WTEmptyWidgetImpl();
        return component;
    }
  }

  @override
  WTDividerWidget? createDividerWidget(WTDividerType type) {
    switch(type) {
      case WTDividerType.horizontal:
        var component = WTDividerWidgetHorizontal()
          ..setBuildContext(getCurrentContext())
          ..setBackgroundColor(theme!.shade5)
          ..setThickness(1.0);
        return component;
    }
  }

  @override
  WTSpaceWidget? createSpaceWidget(WTSpaceType type) {
    switch(type) {
      case WTSpaceType.horizontal5:
        var component = WTSpaceWidgetBasic()
          ..setBuildContext(getCurrentContext())
          ..setHeight(0.0)
          ..setWidth(5.0);
        return component;
      case WTSpaceType.horizontal10:
        var component = WTSpaceWidgetBasic()
          ..setBuildContext(getCurrentContext())
          ..setHeight(0.0)
          ..setWidth(10.0);
        return component;
      case WTSpaceType.horizontal15:
        var component = WTSpaceWidgetBasic()
          ..setBuildContext(getCurrentContext())
          ..setHeight(0.0)
          ..setWidth(15.0);
        return component;
      case WTSpaceType.vertical5:
        var component = WTSpaceWidgetBasic()
          ..setBuildContext(getCurrentContext())
          ..setHeight(5.0)
          ..setWidth(0.0);
        return component;
      case WTSpaceType.vertical10:
        var component = WTSpaceWidgetBasic()
          ..setBuildContext(getCurrentContext())
          ..setHeight(10.0)
          ..setWidth(0.0);
        return component;
      case WTSpaceType.vertical15:
        var component = WTSpaceWidgetBasic()
          ..setBuildContext(getCurrentContext())
          ..setHeight(15.0)
          ..setWidth(0.0);
        return component;
    }
  }

}
