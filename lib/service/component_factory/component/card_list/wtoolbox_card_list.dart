import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_collection.dart' as wtoolbox_converter;
import '../../../../3rd_party/lib_fontaws.dart';
import '../wtoolbox_component.dart';

abstract class WTCardList extends WTComponent {

  bool? expandable = false;
  void setExpandable(bool? v) { expandable = v; }

  bool? borderEnabled = true;
  void enableBorder(bool? v) { borderEnabled = v; }

  bool? separator = false;
  void withSeparator() { separator = true; }
  void withoutSeparator() { separator = false; }

  VoidCallback? action;
  void setAction(VoidCallback? v) { action = v; }

  bool? iconEnabled = true;
  void enableIcon() { iconEnabled = true; }
  void disableIcon() { iconEnabled = false; }

  String? title;
  double? titleSize;
  Color? titleColor, titleBackgroundColor, titleBorderColor;
  void setTitle(String? v) { title = v; }
  void setTitleSize(double? v) { titleSize = v; }
  void setTitleColor(Color? v) { titleColor = v; }
  void setTitleBackgroundColor(Color? v) { titleBackgroundColor = v; }
  void setTitleBorderColor(Color? v) { titleBorderColor = v; }

  String? buttonLabel;
  double? buttonLabelSize;
  Color? buttonLabelColor, buttonBackgroundColor;
  void setButtonLabel(String? v) { buttonLabel = v; }
  void setButtonLabelSize(double? v) { buttonLabelSize = v; }
  void setButtonLabelColor(Color? v) { buttonLabelColor = v; }
  void setButtonBackgroundColor(Color? v) { buttonBackgroundColor = v; }

  String? iIconType, iDecorationIconType;
  IconData? iIcon, iDecorationIcon;
  double? iIconSize, iDecorationIconSize;
  Color? iIconColor, iIconBackgroundColor, iIconBorderColor,
         iDecorationIconColor, iDecorationIconBackgroundColor, iDecorationIconBorderColor;
  void setItemIconType(String? v) { iIconType = v; }
  void setItemIcon(IconData? v) { iIcon = v; }
  void setItemIconSize(double? v) { iIconSize = v; }
  void setItemIconColor(Color? v) { iIconColor = v; }
  void setItemIconBackgroundColor(Color? v) { iIconBackgroundColor = v; }
  void setItemIconBorderColor(Color? v) { iIconBorderColor = v; }
  void setItemDecorationItemIconType(String? v) { iDecorationIconType = v; }
  void setItemDecorationItemIcon(IconData? v) { iDecorationIcon = v; }
  void setItemDecorationIconSize(double? v) { iDecorationIconSize = v; }
  void setItemDecorationIconColor(Color? v) { iDecorationIconColor = v; }
  void setItemDecorationIconBackgroundColor(Color? v) { iDecorationIconBackgroundColor = v; }
  void setItemDecorationIconBorderColor(Color? v) { iDecorationIconBorderColor = v; }

  String? iTitle, iSubtitle, iHeading, iDescription;
  double? iTitleSize, iSubtitleSize, iHeadingSize, iDescriptionSize;
  Color? iTitleColor, iTitleBackgroundColor, iTitleBorderColor,
         iSubtitleColor, iSubtitleBackgroundColor, iSubtitleBorderColor,
         iHeadingColor, iHeadingBackgroundColor, iHeadingBorderColor,
         iDescriptionColor, iDescriptionBackgroundColor, iDescriptionBorderColor;
  void setItemTitle(String? v) { iTitle = v; }
  void setItemTitleSize(double? v) { iTitleSize = v; }
  void setItemTitleColor(Color? v) { iTitleColor = v; }
  void setItemTitleBackgroundColor(Color? v) { iTitleBackgroundColor = v; }
  void setItemTitleBorderColor(Color? v) { iTitleBorderColor = v; }
  void setItemSubtitle(String? v) { iSubtitle = v; }
  void setItemSubtitleSize(double? v) { iSubtitleSize = v; }
  void setItemSubtitleColor(Color? v) { iSubtitleColor = v; }
  void setItemSubtitleBackgroundColor(Color? v) { iSubtitleBackgroundColor = v; }
  void setItemSubtitleBorderColor(Color? v) { iSubtitleBorderColor = v; }
  void setItemHeading(String? v) { iHeading = v; }
  void setItemHeadingSize(double? v) { iHeadingSize = v; }
  void setItemHeadingColor(Color? v) { iHeadingColor = v; }
  void setItemHeadingBackgroundColor(Color? v) { iHeadingBackgroundColor = v; }
  void setItemHeadingBorderColor(Color? v) { iHeadingBorderColor = v; }
  void setItemDescription(String? v) { iDescription = v; }
  void setItemDescriptionSize(double? v) { iDescriptionSize = v; }
  void setItemDescriptionColor(Color? v) { iDescriptionColor = v; }
  void setItemDescriptionBackgroundColor(Color? v) { iDescriptionBackgroundColor = v; }
  void setItemDescriptionBorderColor(Color? v) { iDescriptionBorderColor = v; }

  String? iActionIconType, iActionDecorationIconType;
  IconData? iActionIcon, iActionDecorationIcon;
  double? iActionIconSize, iActionDecorationIconSize;
  Color? iActionIconColor, iActionIconBackgroundColor, iActionIconBorderColor,
         iActionDecorationIconColor, iActionDecorationIconBackgroundColor, iActionDecorationIconBorderColor;
  void setItemActionItemIconType(String? v) { iActionIconType = v; }
  void setItemActionItemIcon(IconData? v) { iActionIcon = v; }
  void setItemActionIconSize(double? v) { iActionIconSize = v; }
  void setItemActionIconColor(Color? v) { iActionIconColor = v; }
  void setItemActionIconBackgroundColor(Color? v) { iActionIconBackgroundColor = v; }
  void setItemActionIconBorderColor(Color? v) { iActionIconBorderColor = v; }
  void setItemActionDecorationItemIconType(String? v) { iActionDecorationIconType = v; }
  void setItemActionDecorationItemIcon(IconData? v) { iActionDecorationIcon = v; }
  void setItemActionDecorationIconSize(double? v) { iActionDecorationIconSize = v; }
  void setItemActionDecorationIconColor(Color? v) { iActionDecorationIconColor = v; }
  void setItemActionDecorationIconBackgroundColor(Color? v) { iActionDecorationIconBackgroundColor = v; }
  void setItemActionDecorationIconBorderColor(Color? v) { iActionDecorationIconBorderColor = v; }

  String? iActionLabel, iActionSubLabel;
  double? iActionLabelSize, iActionSubLabelSize;
  Color? iActionLabelColor, iActionLabelBackgroundColor, iActionLabelBorderColor, iActionSubLabelColor,
         iActionSubLabelBackgroundColor, iActionSubLabelBorderColor;
  void setItemActionLabel(String? v) { iActionLabel = v; }
  void setItemActionLabelSize(double? v) { iActionLabelSize = v; }
  void setItemActionLabelColor(Color? v) { iActionLabelColor = v; }
  void setItemActionLabelBackgroundColor(Color? v) { iActionLabelBackgroundColor = v; }
  void setItemActionLabelBorderColor(Color? v) { iActionLabelBorderColor = v; }
  void setItemActionSubLabel(String? v) { iActionSubLabel = v; }
  void setItemActionSubLabelSize(double? v) { iActionSubLabelSize = v; }
  void setItemActionSubLabelColor(Color? v) { iActionSubLabelColor = v; }
  void setItemActionSubLabelBackgroundColor(Color? v) { iActionSubLabelBackgroundColor = v; }
  void setItemActionSubLabelBorderColor(Color? v) { iActionSubLabelBorderColor = v; }

  List<Map>? items = List<Map>.empty(growable: true);
  void addItem({
    Color? backgroundColor,
    Widget? component,
    Map? data,
    VoidCallback? action,
    String? assetImage,
    String? networkImage,
    Uint8List? memoryImage,
    File? svgImageFile,
    Uint8List? svgImageMemory,
    String? svgImageString,
    String? svgImageNetwork,
    String? svgImageAsset,
    String? iconDataType = '',
    String? iconDataValue = '',
    IconData? icon,
    String? decorationIconType = '',
    String? decorationIconValue = '',
    IconData? decorationIcon,
    String? title,
    Color? titleColor,
    String? subtitle,
    Color? subtitleColor,
    String? heading,
    Color? headingColor,
    String? description,
    Color? descriptionColor,
    String? actionIconDataType = '',
    String? actionIconDataValue = '',
    IconData? actionIcon,
    Color? actionIconColor,
    String? actionDecorationIconDataType,
    String? actionDecorationIconDataValue,
    IconData? actionDecorationIcon,
    String? actionLabel,
    Color? actionLabelColor,
    String? actionSubLabel,
    Color? actionSubLabelColor,
  }) {
    IconData? iconDataI = icon ?? (iconDataType != '' && iconDataType == 'fontAwesome' && iconDataValue != ''
        ? FaIcon(faIconNameMapping[iconDataValue]).icon
        : iIcon);

    IconData? decorationIconDataI = decorationIcon ?? (decorationIconType != '' && decorationIconType == 'fontAwesome' && decorationIconValue != ''
        ? FaIcon(faIconNameMapping[decorationIconValue]).icon
        : iDecorationIcon);

    IconData? actionIconDataI = actionIcon ?? (actionIconDataType != '' && actionIconDataType == 'fontAwesome' && actionIconDataValue != ''
        ? FaIcon(faIconNameMapping[actionIconDataValue]).icon
        : iActionIcon);

    IconData? actionDecorationIconDataI = actionDecorationIcon ?? (actionDecorationIconDataType != '' && actionDecorationIconDataType == 'fontAwesome' && actionDecorationIconDataValue != ''
        ? FaIcon(faIconNameMapping[actionDecorationIconDataValue]).icon
        : iActionDecorationIcon);

    items!.add({
      'backgroundColor':                     backgroundColor ?? Colors.transparent,
      'borderColor':                         borderColor,
      'shadeColor':                          shadeColor,
      'component':                           component,
      'data':                                data,
      'action':                              action,
      'assetImage':                          assetImage,
      'networkImage':                        networkImage,
      'memoryImage':                         memoryImage,
      'svgImageFile':                        svgImageFile,
      'svgImageMemory':                      svgImageMemory,
      'svgImageString':                      svgImageString,
      'svgImageNetwork':                     svgImageNetwork,
      'svgImageAsset':                       svgImageAsset,
      'icon':                                iconDataI,
      'iconSize':                            iIconSize,
      'iconColor':                           iIconColor,
      'iconBackgroundColor':                 iIconBackgroundColor,
      'iconBorderColor':                     iIconBorderColor,
      'decorationIcon':                      decorationIconDataI,
      'decorationIconSize':                  iDecorationIconSize,
      'decorationIconColor':                 iDecorationIconColor,
      'decorationIconBackgroundColor':       iDecorationIconBackgroundColor,
      'decorationIconBorderColor':           iDecorationIconBorderColor,
      'title':                               title ?? iTitle,
      'titleSize':                           iTitleSize,
      'titleColor':                          titleColor ?? iTitleColor,
      'titleBackgroundColor':                iTitleBackgroundColor,
      'titleBorderColor':                    iTitleBorderColor,
      'subtitle':                            subtitle ?? iSubtitle,
      'subtitleSize':                        iSubtitleSize,
      'subtitleColor':                       subtitleColor ?? iSubtitleColor,
      'subtitleBackgroundColor':             iSubtitleBackgroundColor,
      'subtitleBorderColor':                 iSubtitleBorderColor,
      'heading':                             heading ?? iHeading,
      'headingSize':                         iHeadingSize,
      'headingColor':                        headingColor ?? iHeadingColor,
      'headingBackgroundColor':              iHeadingBackgroundColor,
      'headingBorderColor':                  iHeadingBorderColor,
      'description':                         description ?? iDescription,
      'descriptionSize':                     iDescriptionSize,
      'descriptionColor':                    descriptionColor ?? iDescriptionColor,
      'descriptionBackgroundColor':          iDescriptionBackgroundColor,
      'descriptionBorderColor':              iDescriptionBorderColor,
      'actionIcon':                          actionIconDataI,
      'actionIconSize':                      iActionIconSize,
      'actionIconColor':                     actionIconColor ?? iActionIconColor,
      'actionIconBackgroundColor':           iActionIconBackgroundColor,
      'actionIconBorderColor':               iActionIconBorderColor,
      'actionDecorationIcon':                actionDecorationIconDataI,
      'actionDecorationIconSize':            iActionDecorationIconSize,
      'actionDecorationIconColor':           iActionDecorationIconColor,
      'actionDecorationIconBackgroundColor': iActionDecorationIconBackgroundColor,
      'actionDecorationIconBorderColor':     iActionDecorationIconBorderColor,
      'actionLabel':                         actionLabel ?? iActionLabel,
      'actionLabelSize':                     iActionLabelSize,
      'actionLabelColor':                    actionLabelColor ?? iActionLabelColor,
      'actionSubLabel':                      actionSubLabel ?? iActionSubLabel,
      'actionSubLabelSize':                  iActionSubLabelSize,
      'actionSubLabelColor':                 actionSubLabelColor ?? iActionSubLabelColor,
    });
  }

  Map<String, List>? groupedItemsMap = <String, List>{};
  void groupItemsByName() {
    items!.sort((a, b) {
      String aa = a['title'];
      String bb = b['title'];
      return aa.characters.first.toLowerCase().compareTo(bb.characters.first.toLowerCase());
    });

    groupedItemsMap = wtoolbox_converter.groupBy(
      items!,
      (var c) {
        String? s = c['title'];
        return s!.characters.first;
      }
    );
  }

  bool? reverseComponents = false;
  void reverseOrder() { reverseComponents = true; }

  int? gridListItemsPerRow = 3;
  void setGridListItemsPerRow(int? v) { gridListItemsPerRow = v; }

  List<Widget>? components = List<Widget>.empty(growable: true);
  void addComponent(Widget? v) { components!.add(v!); }
  void addComponents(List<Widget>? v) { components!.addAll(v!); }

  List<Map>? groupedComponents = List<Map>.empty(growable: true);
  Map<String, List>? groupedComponentsMap = <String, List>{};
  void addComponentByName({ String? name, Widget? component }) {
    groupedComponents!.add({ 'name': name, 'component': component! });
    _formatComponentsByName();
  }
  void addComponentsByName(List<Map>? list) {
    for(var l in list!) { groupedComponents!.add({ 'name': l['name'], 'component': l['component']! }); }
    _formatComponentsByName();
  }
  void _formatComponentsByName() {
    groupedComponents!.sort((a, b) {
      String aa = a['name'];
      String bb = b['name'];
      return aa.characters.first.toLowerCase().compareTo(bb.characters.first.toLowerCase());
    });

    groupedComponentsMap = wtoolbox_converter.groupBy(
      groupedComponents!,
      (var c) {
        String? s = c['name'];
        return s!.characters.first;
      }
    );
  }

}