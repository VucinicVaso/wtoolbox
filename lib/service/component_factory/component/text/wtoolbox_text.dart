import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../wtoolbox_component.dart';

abstract class WTText extends WTComponent {

  bool? borderEnabled = false;
  void enableBorder() { borderEnabled = true; }

  bool? expanded = false;
  void expand() { expanded = true; }

  bool? scrollable = false;
  void enableScroll() { scrollable = true; }

  String? title;
  double? titleSize, titleScale;
  Color? titleColor;
  TextAlign? titleAlign;
  FontWeight? titleFontWeight;
  void setTitle(String? v) { title = v; }
  void setTitleSize(double? v) { titleSize = v; }
  void lgTitle() { titleScale = 0.065; }
  void mdTitle() { titleScale = 0.055; }
  void smTitle() { titleScale = 0.04; }
  void setTitleColor(Color? v) { titleColor = v; }
  void setTitleAlign(TextAlign? v) { titleAlign = v; }
  void setTitleAlignToLeft() {
    alignment  = Alignment.centerLeft;
    titleAlign = TextAlign.left;
  }
  void setTitleAlignToRight() {
    alignment  = Alignment.centerRight;
    titleAlign = TextAlign.right;
  }
  void setTitleAlignToCenter() {
    alignment  = Alignment.center;
    titleAlign = TextAlign.center;
  }
  void setTitleFontWeight(FontWeight? v) { titleFontWeight = v; }
  void setTitleFontWeightToBold() { titleFontWeight = FontWeight.bold; }
  void setTitleFontWeightToNormal() { titleFontWeight = FontWeight.normal; }

  String? subtitle;
  double? subtitleSize;
  Color? subtitleColor;
  TextAlign? subtitleAlign;
  FontWeight? subtitleFontWeight;
  void setSubtitle(String? v) { subtitle = v; }
  void setSubtitleSize(double? v) { subtitleSize = v; }
  void setSubtitleColor(Color? v) { subtitleColor = v; }
  void setSubtitleAlign(TextAlign? v) { subtitleAlign = v; }
  void setSubtitleFontWeight(FontWeight? v) { subtitleFontWeight = v; }

  String? label;
  double? labelSize;
  Color? labelColor;
  TextAlign? labelAlign;
  FontWeight? labelFontWeight;
  void setLabel(String? v) { label = v; }
  void setLabelSize(double? v) { labelSize = v; }
  void setLabelColor(Color? v) { labelColor = v; }
  void setLabelAlign(TextAlign? v) { labelAlign = v; }
  void setLabelFontWeight(FontWeight? v) { labelFontWeight = v; }

  String? actionLabel;
  VoidCallback? actionLabelAction;
  double? actionLabelSize;
  Color? actionLabelColor;
  TextAlign? actionLabelAlign;
  FontWeight? actionLabelFontWeight;
  void setActionLabel({ String? text, VoidCallback? action }) {
    actionLabel       = text;
    actionLabelAction = action;
  }
  void setActionLabelSize(double? v) { actionLabelSize = v; }
  void setActionLabelColor(Color? v) { actionLabelColor = v; }
  void setActionLabelAlign(TextAlign? v) { actionLabelAlign = v; }
  void setActionLabelFontWeight(FontWeight? v) { actionLabelFontWeight = v; }

  String? actionSubLabel;
  VoidCallback? actionSubLabelAction;
  double? actionSubLabelSize;
  Color? actionSubLabelColor;
  TextAlign? actionSubLabelAlign;
  FontWeight? actionSubLabelFontWeight;
  void setActionSubLabel({ String? text, VoidCallback? action }) {
    actionSubLabel       = text;
    actionSubLabelAction = action;
  }
  void setActionSubLabelSize(double? v) { actionSubLabelSize = v; }
  void setActionSubLabelColor(Color? v) { actionSubLabelColor = v; }
  void setActionSubLabelAlign(TextAlign? v) { actionSubLabelAlign = v; }
  void setActionSubLabelFontWeight(FontWeight? v) { actionSubLabelFontWeight = v; }

  String? text;
  double? textSize;
  Color? textColor;
  TextAlign? textAlign;
  FontWeight? textFontWeight;
  void setText(String? v) { text = v; }
  void setTextSize(double? v) { textSize = v; }
  void setTextColor(Color? v) { textColor = v; }
  void setTextAlign(TextAlign? v) { textAlign = v; }
  void setTextFontWeight(FontWeight? v) { textFontWeight = v; }

  String? actionText;
  VoidCallback? actionTextAction;
  double? actionTextSize;
  Color? actionTextColor;
  TextAlign? actionTextAlign;
  FontWeight? actionTextFontWeight;
  void setActionText({ String? text, VoidCallback? action }) {
    actionText       = text;
    actionTextAction = action;
  }
  void setActionTextSize(double? v) { actionTextSize = v; }
  void setActionTextColor(Color? v) { actionTextColor = v; }
  void setActionTextAlign(TextAlign? v) { actionTextAlign = v; }
  void setActionTextFontWeight(FontWeight? v) { actionTextFontWeight = v; }

  double? linkSize;
  Color? linkColor;
  TextAlign? linkAlign;
  FontWeight? linkFontWeight;
  List<Map<String, dynamic>>? links = List<Map<String, dynamic>>.empty(growable: true);
  void setLink({ String? text, String? link, VoidCallback? action }) {
    links!.add({ 'text': text, 'link': link, 'action': action });
  }
  void setLinkSize(double? v) { linkSize = v; }
  void setLinkColor(Color? v) { linkColor = v; }
  void setLinkAlign(TextAlign? v) { linkAlign = v; }
  void setLinkFontWeight(FontWeight? v) { linkFontWeight = v; }

  String? cardTitle;
  double? cardTitleSize;
  Color? cardTitleColor;
  TextAlign? cardTitleAlign;
  FontWeight? cardTitleFontWeight;
  void setCardTitle(String? v) { cardTitle = v; }
  void setCardTitleSize(double? v) { cardTitleSize = v; }
  void setCardTitleColor(Color? v) { cardTitleColor = v; }
  void setCardTitleAlign(TextAlign? v) { cardTitleAlign = v; }
  void setCardTitleFontWeight(FontWeight? v) { cardTitleFontWeight = v; }

  List<Map<String, dynamic>>? content = List<Map<String, dynamic>>.empty(growable: true);
  void addItem({
    String? title,
    String? actionLabel,
    VoidCallback? actionLabelAction,
    String? subtitle,
    String? actionSubLabel,
    VoidCallback? actionSubLabelAction,
    String? text,
    String? actionText,
    VoidCallback? actionTextAction,
  }) {
    content!.add({
      'title':                title,
      'actionLabel':          actionLabel,
      'actionLabelAction':    actionLabelAction ?? () {},
      'subtitle':             subtitle,
      'actionSubLabel':       actionSubLabel,
      'actionSubLabelAction': actionSubLabelAction ?? () {},
      'text':                 text,
      'actionText':           actionText,
      'actionTextAction':     actionTextAction ?? () {}
    });
  }

}