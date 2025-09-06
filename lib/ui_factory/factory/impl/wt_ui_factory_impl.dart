import 'package:flutter/material.dart';
import 'package:wtoolbox/external/lib_material_symbols.dart';
import '../wt_ui_factory.dart';
import '../../type/impl/wt_ui_component_type.dart';
import '../../component/empty/wt_ui_empty.dart';
import '../../component/empty/impl/wt_ui_empty_impl.dart';
import '../../component/divider/wt_ui_divider.dart';
import '../../component/divider/horizontal/wt_ui_divider_horizontal.dart';
import '../../component/layout/wt_ui_layout.dart';
import '../../component/layout/horizontal/wt_ui_layout_horizontal.dart';
import '../../component/layout/horizontal/wt_ui_layout_horizontal_scrollable.dart';
import '../../component/layout/vertical/wt_ui_layout_vertical.dart';
import '../../component/layout/vertical/wt_ui_layout_vertical_scrollable.dart';
import '../../component/layout/vertical/wt_ui_layout_vertical_expanded.dart';
import '../../component/layout/vertical/wt_ui_layout_vertical_expanded_and_scrollable.dart';
import '../../component/scaffold/wt_ui_scaffold.dart';
import '../../component/scaffold/impl/wt_ui_scaffold_impl.dart';
import '../../component/header/wt_ui_header.dart';
import '../../component/header/impl/wt_ui_header_impl.dart';
import '../../component/body/wt_ui_body.dart';
import '../../component/body/impl/wt_ui_body_impl.dart';
import '../../component/footer/wt_ui_footer.dart';
import '../../component/footer/fixed/wt_ui_footer_fixed.dart';
import '../../component/space/wt_ui_space.dart';
import '../../component/space/basic/wt_ui_space_basic.dart';
import '../../component/wrap/wt_ui_wrap.dart';
import '../../component/wrap/impl/wt_ui_wrap_impl.dart';

class WTUIFactoryImpl extends WTUIFactory {

  @override
  WTUIScaffold? createScaffold(WTUIScaffoldType type) {
    switch(type) {
      case WTUIScaffoldType.basic1:
        var component = WTUIScaffoldImpl()
          ..setGlobalKey()
          ..isUnfocused(false)
          ..setBackgroundColor(theme!.background1);
        return component;
      case WTUIScaffoldType.basicUnfocused1:
        var component = WTUIScaffoldImpl()
          ..setGlobalKey()
          ..isUnfocused(true)
          ..setBackgroundColor(theme!.background1);
        return component;
      case WTUIScaffoldType.basic2:
        var component = WTUIScaffoldImpl()
          ..setGlobalKey()
          ..isUnfocused(false)
          ..setBackgroundColor(theme!.background2);
        return component;
      case WTUIScaffoldType.basicUnfocused2:
        var component = WTUIScaffoldImpl()
          ..setGlobalKey()
          ..isUnfocused(true)
          ..setBackgroundColor(theme!.background2);
        return component;
    }
  }

  @override
  WTUIHeader? createHeader(WTUIHeaderType type) {
    switch(type) {
      case WTUIHeaderType.basic1:
        var component = WTUIHeaderImpl()
          ..setBuildContext(getCurrentContext())
          ..withShadow(false)
          ..setBackgroundColor(theme!.background1)
          ..setBackActionIconColor(theme!.text1)
          ..setBackActionLabelColor(theme!.text1)
          ..setBackActionSvgBackgroundColor(theme!.background2)
          ..setLabelColor(theme!.text1)
          ..setActionIconColor(theme!.text1)
          ..setActionIconBackgroundColor(theme!.background1)
          ..setActionLabelColor(theme!.text1)
          ..setMenuIcon(Symbols.more_vert_rounded)
          ..setMenuIconColor(theme!.text1)
          ..setMenuBackgroundColor(theme!.background2)
          ..setMenuItemIconColor(theme!.text1)
          ..setMenuItemLabelColor(theme!.text1);
        return component;
      case WTUIHeaderType.basic1WithShadow:
        var component = WTUIHeaderImpl()
          ..setBuildContext(getCurrentContext())
          ..withShadow(true)
          ..setBackgroundColor(theme!.background1)
          ..setBackActionIconColor(theme!.text1)
          ..setBackActionLabelColor(theme!.text1)
          ..setBackActionSvgBackgroundColor(theme!.background2)
          ..setLabelColor(theme!.text1)
          ..setActionIconColor(theme!.text1)
          ..setActionIconBackgroundColor(theme!.background1)
          ..setActionLabelColor(theme!.text1)
          ..setMenuIcon(Symbols.more_vert_rounded)
          ..setMenuIconColor(theme!.text1)
          ..setMenuBackgroundColor(theme!.background2)
          ..setMenuItemIconColor(theme!.text1)
          ..setMenuItemLabelColor(theme!.text1);
        return component;
      case WTUIHeaderType.basic2:
        var component = WTUIHeaderImpl()
          ..setBuildContext(getCurrentContext())
          ..withShadow(false)
          ..setBackgroundColor(theme!.background2)
          ..setBackActionIconColor(theme!.text1)
          ..setBackActionLabelColor(theme!.text1)
          ..setBackActionSvgBackgroundColor(theme!.background1)
          ..setLabelColor(theme!.text1)
          ..setActionIconColor(theme!.text1)
          ..setActionIconBackgroundColor(theme!.background1)
          ..setActionLabelColor(theme!.text1)
          ..setMenuIcon(Symbols.more_vert_rounded)
          ..setMenuIconColor(theme!.text1)
          ..setMenuBackgroundColor(theme!.background1)
          ..setMenuItemIconColor(theme!.text1)
          ..setMenuItemLabelColor(theme!.text1);
        return component;
      case WTUIHeaderType.basic2WithShadow:
        var component = WTUIHeaderImpl()
          ..setBuildContext(getCurrentContext())
          ..withShadow(true)
          ..setBackgroundColor(theme!.background2)
          ..setBackActionIconColor(theme!.text1)
          ..setBackActionLabelColor(theme!.text1)
          ..setBackActionSvgBackgroundColor(theme!.background1)
          ..setLabelColor(theme!.text1)
          ..setActionIconColor(theme!.text1)
          ..setActionIconBackgroundColor(theme!.background1)
          ..setActionLabelColor(theme!.text1)
          ..setMenuIcon(Symbols.more_vert_rounded)
          ..setMenuIconColor(theme!.text1)
          ..setMenuBackgroundColor(theme!.background1)
          ..setMenuItemIconColor(theme!.text1)
          ..setMenuItemLabelColor(theme!.text1);
        return component;
    }
  }

  @override
  WTUIBody? createBody(WTUIBodyType type) {
    switch(type) {
      case WTUIBodyType.basic1:
        var component = WTUIBodyImpl()
          ..setBuildContext(getCurrentContext())
          ..setBackgroundColor(theme!.background1);
        return component;
      case WTUIBodyType.basic2:
        var component = WTUIBodyImpl()
          ..setBuildContext(getCurrentContext())
          ..setBackgroundColor(theme!.background2);
        return component;
    }
  }

  @override
  WTUIFooter? createFooter(WTUIFooterType type) {
    switch(type) {
      case WTUIFooterType.basic1Fixed:
        var component = WTUIFooterFixed()
          ..setBuildContext(getCurrentContext())
          ..setBackgroundColor(theme!.background1)
          ..setSelectedItemBackgroundColor(theme!.primary4)
          ..setSelectedItemIconColor(theme!.primary1)
          ..setSelectedItemLabelColor(theme!.text1)
          ..setUnselectedItemBackgroundColor(theme!.background1)
          ..setUnselectedItemIconColor(theme!.text4)
          ..setUnselectedItemLabelColor(theme!.text4);
        return component;
      case WTUIFooterType.basic2Fixed:
        var component = WTUIFooterFixed()
          ..setBuildContext(getCurrentContext())
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
  WTUILayout? createLayout(WTUILayoutType type) {
    switch(type) {
      case WTUILayoutType.horizontal:
        var component = WTUILayoutHorizontal()
          ..setBuildContext(getCurrentContext())
          ..setAlignment(null)
          ..setPadding(left: 7.5, top: 12.5, right: 7.5, bottom: 12.5)
          ..setMargin(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.center)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
      case WTUILayoutType.horizontalScrollable:
        var component = WTUILayoutHorizontalScrollable()
          ..setBuildContext(getCurrentContext())
          ..setAlignment(null)
          ..setPadding(left: 7.5, top: 12.5, right: 7.5, bottom: 12.5)
          ..setMargin(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.center)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;      
      case WTUILayoutType.vertical:
        var component = WTUILayoutVertical()
          ..setBuildContext(getCurrentContext())
          ..setAlignment(null)
          ..setPadding(left: 7.5, top: 12.5, right: 7.5, bottom: 12.5)
          ..setMargin(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.start)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
      case WTUILayoutType.verticalScrollable:
        var component = WTUILayoutVerticalScrollable()
          ..setBuildContext(getCurrentContext())
          ..setAlignment(null)
          ..setPadding(left: 7.5, top: 12.5, right: 7.5, bottom: 12.5)
          ..setMargin(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.start)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
      case WTUILayoutType.verticalExpanded:
        var component = WTUILayoutVerticalExpanded()
          ..setBuildContext(getCurrentContext())
          ..setAlignment(null)
          ..setPadding(left: 7.5, top: 12.5, right: 7.5, bottom: 12.5)
          ..setMargin(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.start)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
      case WTUILayoutType.verticalExpandedAndScrollable:
        var component = WTUILayoutVerticalExpandedAndScrollable()
          ..setBuildContext(getCurrentContext())
          ..setAlignment(null)
          ..setPadding(left: 7.5, top: 12.5, right: 7.5, bottom: 12.5)
          ..setMargin(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
          ..setBackgroundColor(Colors.transparent)
          ..setMainAxisAlignment(MainAxisAlignment.start)
          ..setCrossAxisAlignment(CrossAxisAlignment.center);
        return component;
    }
  }

  @override
  WTUIEmpty? createEmpty(WTUIEmptyType type) {
    switch(type) {
      case WTUIEmptyType.empty:
        var component = WTUIEmptyImpl();
        return component;
    }
  }

  @override
  WTUIDivider? createDivider(WTUIDividerType type) {
    switch(type) {
      case WTUIDividerType.horizontal:
        var component = WTUIDividerHorizontal()
          ..setBuildContext(getCurrentContext())
          ..setBackgroundColor(theme!.shade5)
          ..setThickness(1.0);
        return component;
    }
  }

  @override
  WTUISpace? createSpace(WTUISpaceType type) {
    switch(type) {
      case WTUISpaceType.horizontal5:
        var component = WTUISpaceBasic()
          ..setBuildContext(getCurrentContext())
          ..setHeight(0.0)
          ..setWidth(5.0);
        return component;
      case WTUISpaceType.horizontal10:
        var component = WTUISpaceBasic()
          ..setBuildContext(getCurrentContext())
          ..setHeight(0.0)
          ..setWidth(10.0);
        return component;
      case WTUISpaceType.horizontal15:
        var component = WTUISpaceBasic()
          ..setBuildContext(getCurrentContext())
          ..setHeight(0.0)
          ..setWidth(15.0);
        return component;
      case WTUISpaceType.vertical5:
        var component = WTUISpaceBasic()
          ..setBuildContext(getCurrentContext())
          ..setHeight(5.0)
          ..setWidth(0.0);
        return component;
      case WTUISpaceType.vertical10:
        var component = WTUISpaceBasic()
          ..setBuildContext(getCurrentContext())
          ..setHeight(10.0)
          ..setWidth(0.0);
        return component;
      case WTUISpaceType.vertical15:
        var component = WTUISpaceBasic()
          ..setBuildContext(getCurrentContext())
          ..setHeight(15.0)
          ..setWidth(0.0);
        return component;
    }
  }

  @override
  WTUIWrap? createWrap(WTUIWrapType type) {
    switch(type) {
      case WTUIWrapType.wrap: 
        var component = WTUIWrapImpl()
          ..setPadding(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0)
          ..setMargin(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0);
        return component;
    }
  }

}
