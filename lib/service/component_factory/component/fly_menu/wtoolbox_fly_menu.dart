import 'package:flutter/material.dart';
import '../wtoolbox_component.dart';

abstract class WTFlyMenu extends WTComponent {

  ValueNotifier<List<Map<String, dynamic>>>? messageValueNotifier;
  void setMessageValueNotifier(ValueNotifier<List<Map<String, dynamic>>>? v) {  messageValueNotifier = v; }

  VoidCallback? action;
  void setAction(VoidCallback? v) { action = v; }

  IconData? icon;
  double? iconSize;
  Color? iconColor, iconBackgroundColor;
  void setIcon(IconData? v) { icon = v; }
  void setIconSize(double? v) { iconSize = v; }
  void setIconColor(Color? v) { iconColor = v; }
  void setIconBackgroundColor(Color? v) { iconBackgroundColor = v; }

  VoidCallback? linkAction;
  IconData? linkIcon;
  String? linkLabel, linkDescription;
  double? linkLabelSize, linkDescriptionSize, linkIconSize;
  Color? linkLabelColor, linkDescriptionColor, linkIconColor;
  void setLinkAction(VoidCallback? v) { linkAction = v; }
  void setLinkIcon(IconData? v) { linkIcon = v; }
  void setLinkIconSize(double? v) { linkIconSize = v; }
  void setLinkIconColor(Color? v) { linkIconColor = v; }
  void setLinkLabel(String? v) { linkLabel = v; }
  void setLinkLabelSize(double? v) { linkLabelSize = v; }
  void setLinkLabelColor(Color? v) { linkLabelColor = v; }
  void setLinkDescription(String? v) { linkDescription = v; }
  void setLinkDescriptionSize(double? v) { linkDescriptionSize = v; }
  void setLinkDescriptionColor(Color? v) { linkDescriptionColor = v; }

  bool? mainAreaShow = false;
  void showMainArea(bool? v) { mainAreaShow = v; }

  List<Widget>? components = List<Widget>.empty(growable: true);
  void addComponent(Widget? v) { components!.add(v!); }
  void addComponents(List<Widget>? v) { components!.addAll(v!); }

  Color? actionIconColor, actionIconBackgroundColor, actionIconBorderColor, actionLabelColor;
  double? actionIconSize, actionLabelSize;
  void setActionIconSize(double? v) { actionIconSize = v; }
  void setActionIconColor(Color? v) { actionIconColor = v; }
  void setActionIconBackgroundColor(Color? v) { actionIconBackgroundColor = v; }
  void setActionIconBorderColor(Color? v) { actionIconBorderColor = v; }
  void setActionLabelSize(double? v) { actionLabelSize = v; }
  void setActionLabelColor(Color? v) { actionLabelColor = v; }
  List<Map<String, dynamic>>? actions = List<Map<String, dynamic>>.empty(growable: true);
  void addAction(Map<String, dynamic>? v) { actions!.add(v!); }
  void addActions(List<Map<String, dynamic>>? v) { actions!.addAll(v!); }

  bool? awaitAreaShow = false;
  IconData? awaitIcon;
  String? awaitLabel;
  Color? awaitIconColor, awaitIconBackgroundColor, awaitLabelColor, awaitAreaBackgroundColor;
  double? awaitIconSize, awaitLabelSize;
  void showAwaitArea(bool? v) { awaitAreaShow = v; }
  void setAwaitBackgroundColor(Color? v) { awaitAreaBackgroundColor = v; }
  void setAwaitIcon(IconData? v) { awaitIcon = v; }
  void setAwaitIconSize(double? v) { awaitIconSize = v; }
  void setAwaitIconColor(Color? v) { awaitIconColor = v; }
  void setAwaitIconBackgroundColor(Color? v) { awaitIconBackgroundColor = v; }
  void setAwaitLabel(String? v) { awaitLabel = v; }
  void setAwaitLabelSize(double? v) { awaitLabelSize = v; }
  void setAwaitLabelColor(Color? v) { awaitLabelColor = v; }

  bool? messageAreaShow = false;
  void showMessageArea(bool? v) { messageAreaShow = v; }
  double? messageIconSize, messageLabelSize;
  void setMessageIconSize(double? v) { messageIconSize = v; }
  void setMessageLabelSize(double? v) { messageLabelSize = v; }
  IconData? messageDangerIcon, messageWarningIcon, messageInfoIcon, messageSuccessIcon;
  Color? messageBackgroundColor, messageLabelColor,
      messageDangerColor, messageWarningColor, messageInfoColor, messageSuccessColor;
  void setMessageLabelColor(Color? v) { messageLabelColor = v; }
  void setMessageBackgroundColor(Color? v) { messageBackgroundColor = v; }
  void setMessageDangerIcon(IconData? v) { messageDangerIcon = v; }
  void setMessageDangerColor(Color? v) { messageDangerColor = v; }
  void setMessageWarningIcon(IconData? v) { messageWarningIcon = v; }
  void setMessageWarningColor(Color? v) { messageWarningColor = v; }
  void setMessageInfoIcon(IconData? v) { messageInfoIcon = v; }
  void setMessageInfoColor(Color? v) { messageInfoColor = v; }
  void setMessageSuccessIcon(IconData? v) { messageSuccessIcon = v; }
  void setMessageSuccessColor(Color? v) { messageSuccessColor = v; }

}