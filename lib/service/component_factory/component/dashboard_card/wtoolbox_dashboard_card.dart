import 'package:flutter/material.dart';
import '../wtoolbox_component.dart';
import 'wtoolbox_dashboard_card_item_schema.dart';
import 'wtoolbox_dashboard_card_chart_schema.dart';
import 'wtoolbox_dashboard_card_action_schema.dart';

abstract class WTDashboardCard extends WTComponent {

  bool? borderEnabled = true;
  void enableBorder(bool? v) { borderEnabled = v; }

  VoidCallback? action;
  void setAction(VoidCallback? v) { action = v; }

  String? title;
  double? titleSize;
  Color? titleColor, titleBackgroundColor, titleBorderColor;
  void setTitle(String? v) { title = v; }
  void setTitleSize(double? v) { titleSize = v; }
  void setTitleColor(Color? v) { titleColor = v; }
  void setTitleBackgroundColor(Color? v) { titleBackgroundColor = v; }
  void setTitleBorderColor(Color? v) { titleBorderColor = v; }

  String? subtitle;
  double? subtitleSize;
  Color? subtitleColor, subtitleBackgroundColor, subtitleBorderColor;
  void setSubtitle(String? v) { subtitle = v; }
  void setSubtitleSize(double? v) { subtitleSize = v; }
  void setSubtitleColor(Color? v) { subtitleColor = v; }
  void setSubtitleBackgroundColor(Color? v) { subtitleBackgroundColor = v; }
  void setSubtitleBorderColor(Color? v) { subtitleBorderColor = v; }

  String? heading;
  double? headingSize;
  Color? headingColor, headingBackgroundColor, headingBorderColor;
  void setHeading(String? v) { heading = v; }
  void setHeadingSize(double? v) { headingSize = v; }
  void setHeadingColor(Color? v) { headingColor = v; }
  void setHeadingBackgroundColor(Color? v) { headingBackgroundColor = v; }
  void setHeadingBorderColor(Color? v) { headingBorderColor = v; }

  String? description;
  double? descriptionSize;
  Color? descriptionColor, descriptionBackgroundColor, descriptionBorderColor;
  void setDescription(String? v) { description = v; }
  void setDescriptionSize(double? v) { descriptionSize = v; }
  void setDescriptionColor(Color? v) { descriptionColor = v; }
  void setDescriptionBackgroundColor(Color? v) { descriptionBackgroundColor = v; }
  void setDescriptionBorderColor(Color? v) { descriptionBorderColor = v; }

  String? iconType, iconValue;
  IconData? iconData;
  double? iconSize;
  Color? iconColor, iconBackgroundColor, iconBorderColor;
  void setIconType(String? v) { iconType = v; }
  void setIconValue(String? v) { iconValue = v; }
  void setIconData(IconData? v) { iconData = v; }
  void setIconSize(double? v) { iconSize = v; }
  void setIconColor(Color? v) { iconColor = v; }
  void setIconBackgroundColor(Color? v) { iconBackgroundColor = v; }
  void setIconBorderColor(Color? v) { iconBorderColor = v; }

  String? decorationIconType, decorationIconValue;
  IconData? decorationIconData;
  double? decorationIconSize;
  Color? decorationIconColor, decorationIconBackgroundColor, decorationIconBorderColor;
  void setDecorationIconType(String? v) { decorationIconType = v; }
  void setDecorationIconValue(String? v) { decorationIconValue = v; }
  void setDecorationIconData(IconData? v) { decorationIconData = v; }
  void setDecorationIconSize(double? v) { decorationIconSize = v; }
  void setDecorationIconColor(Color? v) { decorationIconColor = v; }
  void setDecorationIconBackgroundColor(Color? v) { decorationIconBackgroundColor = v; }
  void setDecorationIconBorderColor(Color? v) { decorationIconBorderColor = v; }

  IconData? buttonIcon;
  String? buttonIconType, buttonLabel;
  double? buttonIconSize, buttonLabelSize;
  Color? buttonIconColor, buttonLabelColor, buttonBackgroundColor;
  VoidCallback? buttonAction;
  void setButtonIconType(String? v) { buttonIconType = v; }
  void setButtonIcon(IconData? v) { buttonIcon = v; }
  void setButtonIconSize(double? v) { buttonIconSize = v; }
  void setButtonIconColor(Color? v) { buttonIconColor = v; }
  void setButtonLabel(String? v) { buttonLabel = v; }
  void setButtonLabelSize(double? v) { buttonLabelSize = v; }
  void setButtonLabelColor(Color? v) { buttonLabelColor = v; }
  void setButtonBackgroundColor(Color? v) { buttonBackgroundColor = v; }
  void setButtonAction(VoidCallback? v) { buttonAction = v; }

  List<Map<String, dynamic>>? itemCardList = List<Map<String, dynamic>>.empty(growable: true);
  void addItemCardItem({
    VoidCallback? route,
    WTDashboardCardItemSchema? leftTopSchema,
    WTDashboardCardItemSchema? rightTopSchema,
    WTDashboardCardItemSchema? leftCenterSchema,
    WTDashboardCardItemSchema? rightCenterSchema,
    WTDashboardCardItemSchema? leftBottomSchema,
    WTDashboardCardItemSchema? rightBottomSchema
  }) {
    itemCardList!.add({
      'route':       route!,
      'leftTop':     leftTopSchema!.toMap(),
      'rightTop':    rightTopSchema!.toMap(),
      'leftCenter':  leftCenterSchema!.toMap(),
      'rightCenter': rightCenterSchema!.toMap(),
      'leftBottom':  leftBottomSchema!.toMap(),
      'rightBottom': rightBottomSchema!.toMap()
    });
  }

  String? chartType;
  void setChartType(String? v) { chartType = v; }
  String? chartUnit;
  void setChartUnit(String? v) { chartUnit = v; }
  List<BmplDashboardCardChartSchema>? chartCardList = List<BmplDashboardCardChartSchema>.empty(growable: true);
  void addChartCardItem(BmplDashboardCardChartSchema? v) { chartCardList!.add(v!); }
  void addChartCardItems(List<Map>? list) { for(var l in list!) { chartCardList!.add(BmplDashboardCardChartSchema.fromMap(l)); } }

  EdgeInsets? actionItemPadding = const EdgeInsets.all(0.0), actionItemMargin = const EdgeInsets.all(0.0);
  void setActionItemPadding({ double? left = 0.0, double? top = 0.0, double? right = 0.0, double? bottom }) { actionItemPadding = EdgeInsets.fromLTRB(left!, top!, right!, bottom!); }
  void setActionItemPaddingFromMap(Map<String, dynamic>? v) { actionItemPadding = EdgeInsets.fromLTRB(v!['left'], v['top'], v['right'], v['bottom']); }
  void setActionItemMargin({ double? left = 0.0, double? top = 0.0, double? right = 0.0, double? bottom }) { actionItemMargin = EdgeInsets.fromLTRB(left!, top!, right!, bottom!); }
  void setActionItemMarginFromMap(Map<String, dynamic>? v) { actionItemMargin = actionItemMargin = EdgeInsets.fromLTRB(v!['left'], v['top'], v['right'], v['bottom']); }
  double? actionItemTitleSize;
  Color? actionItemTitleColor;
  FontWeight? actionItemTitleWeight;
  void setActionItemTitleSize(double? v) { actionItemTitleSize = v; }
  void setActionItemTitleColor(Color? v) { actionItemTitleColor = v; }
  void setActionItemTitleWeight(FontWeight? v) { actionItemTitleWeight = v; }
  double? actionItemSubtitleSize;
  Color? actionItemSubtitleColor;
  FontWeight? actionItemSubtitleWeight;
  void setActionItemSubtitleSize(double? v) { actionItemSubtitleSize = v; }
  void setActionItemSubtitleColor(Color? v) { actionItemSubtitleColor = v; }
  void setActionItemSubtitleWeight(FontWeight? v) { actionItemSubtitleWeight = v; }
  double? actionItemIconSize;
  Color? actionItemIconColor, actionItemIconBackgroundColor, actionItemIconBorderColor;
  void setActionItemIconSize(double? v) { actionItemIconSize = v; }
  void setActionItemIconColor(Color? v) { actionItemIconColor = v; }
  void setActionItemIconBackgroundColor(Color? v) { actionItemIconBackgroundColor = v; }
  void setActionItemIconBorderColor(Color? v) { actionItemIconBorderColor = v; }
  double? actionItemDecorationIconSize;
  Color? actionItemDecorationIconColor, actionItemDecorationIconBackgroundColor, actionItemDecorationIconBorderColor;
  void setActionItemDecorationIconSize(double? v) { actionItemDecorationIconSize = v; }
  void setActionItemDecorationIconColor(Color? v) { actionItemDecorationIconColor = v; }
  void setActionItemDecorationIconBackgroundColor(Color? v) { actionItemDecorationIconBackgroundColor = v; }
  void setActionItemDecorationIconBorderColor(Color? v) { actionItemDecorationIconBorderColor = v; }

  int? gridCrossAxisCount = 3;
  void setGridActionCardCrossAxisCount(int? v) { gridCrossAxisCount = v; }
  int? gridCrossAxisCountMin = 2, gridCrossAxisCountMax = 6;
  void setGridCrossAxisCountMinAndMax({ int? min, int? max}) {
    gridCrossAxisCountMin = min;
    gridCrossAxisCountMax = max;
  }

  List<WTDashboardCardActionSchema>? actionCardList = List<WTDashboardCardActionSchema>.empty(growable: true);
  void addActionCardItem(WTDashboardCardActionSchema? value) {
    value!
      ..setBackgroundColor(backgroundColor)
      ..setPadding(actionItemPadding)
      ..setMargin(actionItemMargin)
      ..setTitleSize(actionItemTitleSize)
      ..setTitleColor(actionItemTitleColor)
      ..setTitleWeight(actionItemTitleWeight)
      ..setSubtitleSize(actionItemSubtitleSize)
      ..setSubtitleColor(actionItemSubtitleColor)
      ..setSubtitleWeight(actionItemSubtitleWeight)
      ..setIconSize(actionItemIconSize)
      ..setIconColor(actionItemIconColor)
      ..setIconBackgroundColor(actionItemIconBackgroundColor)
      ..setIconBorderColor(actionItemIconBorderColor)
      ..setDecorationIconSize(actionItemIconSize)
      ..setDecorationIconColor(actionItemIconColor)
      ..setDecorationIconBackgroundColor(actionItemIconBackgroundColor)
      ..setDecorationIconBorderColor(actionItemIconBorderColor);

    actionCardList!.add(value);
  }
  void addActionCardItems(List<WTDashboardCardActionSchema>? list) { for(var l in list!) { addActionCardItem(l); } }

}