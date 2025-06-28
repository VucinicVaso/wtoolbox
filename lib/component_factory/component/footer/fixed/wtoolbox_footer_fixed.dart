import 'package:flutter/material.dart';
import '../wtoolbox_footer.dart';
import '../../wtoolbox_component_builder.dart';

class WTFooterFixed extends WTFooter {

  BottomNavigationBarItem? createBarItem(Map<dynamic, dynamic>? e) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: itemPadding,
        margin: itemMargin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.transparent,
        ),
        foregroundDecoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: WTComponentBuilder.createIcon(
          iconData: e!['icon'],
          size: itemIconSize,
          color: unselectedItemIconColor
        ),
      ),
      label: e['label'],
      activeIcon: Container(
        padding: itemPadding,
        margin: itemMargin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: selectedItemBackgroundColor,
        ),
        child: WTComponentBuilder.createIcon(
          iconData: e['icon'],
          size: itemIconSize,
          color: selectedItemIconColor
        ),
      ),
    );
  }

  @override
  Widget? build() {
    itemIconSize  = width! * 0.060;
    itemLabelSize = width! * 0.035;
    itemPadding   = itemPadding ?? const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 6.0);
    itemMargin    = itemMargin ?? const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0);

    return BottomNavigationBar(
      key: getUniqueKey(),
      items: <BottomNavigationBarItem>[
        ...items!.map((i) => createBarItem(i)!),
      ],
      onTap: (int i) => selectedItemAction!(i),
      type: BottomNavigationBarType.fixed,
      backgroundColor: backgroundColor,
      currentIndex: selectedItem!,
      selectedItemColor: selectedItemLabelColor,
      unselectedItemColor: unselectedItemIconColor,
      selectedLabelStyle: textStyle(
        textColor: selectedItemLabelColor,
        fontSize: itemLabelSize,
        fontWeight: FontWeight.bold
      ),
      unselectedLabelStyle: textStyle(
        textColor: unselectedItemLabelColor,
        fontSize: itemLabelSize
      ),
    );
  }

}