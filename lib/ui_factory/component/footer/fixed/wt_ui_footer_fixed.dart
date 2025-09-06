import 'package:flutter/material.dart';
import '../wt_ui_footer.dart';

class WTUIFooterFixed extends WTUIFooter {

  void setSizes() {
    itemIconSize  = 25;
    itemLabelSize = 18;
  }

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
        child: Icon(
          e!['icon'],
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
        child: Icon(
          e['icon'],
          size: itemIconSize,
          color: selectedItemIconColor
        ),
      ),
    );
  }

  @override
  Widget? build() {
    setSizes();

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
      selectedLabelStyle: TextStyle(
        color: selectedItemLabelColor,
        fontSize: itemLabelSize,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        color: unselectedItemLabelColor,
        fontSize: itemLabelSize,
        fontWeight: FontWeight.normal,
      ),
    );
  }

}