import 'package:flutter/material.dart';
import '../wtoolbox_theme_picker.dart';
import '../../wtoolbox_component_builder.dart';

class WTThemePickerBasic extends WTThemePicker {

  @override
  Widget? build() {
    return ThemePicker(
      key:                 getUniqueKey(),
      context:             buildContext,
      width:               width,
      padding:             padding,
      margin:              margin,
      textColor:           textColor,
      textStyle:           textStyle,
      backgroundColor:     backgroundColor,
      selectedIcon:        selectedIcon,
      selectedIconColor:   selectedIconColor,
      unselectedIcon:      unselectedIcon,
      unselectedIconColor: unselectedIconColor,
      action:              action,
      themes:              themes,
    );
  }

}

// ignore: must_be_immutable
class ThemePicker extends StatefulWidget {

  BuildContext? context;
  Function? textStyle;
  double? width;
  IconData? selectedIcon, unselectedIcon;
  Color? backgroundColor, textColor, selectedIconColor, unselectedIconColor;
  EdgeInsets? padding, margin;
  Function? action;
  List<Map>? themes;

  ThemePicker({
    super.key,
    this.context,
    this.textStyle,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.selectedIcon,
    this.selectedIconColor,
    this.unselectedIcon,
    this.unselectedIconColor,
    this.action,
    this.themes,
    this.padding,
    this.margin,
  });

  @override
  State<ThemePicker> createState() => _ThemePickerState();

}

class _ThemePickerState extends State<ThemePicker> {

  @override
  void initState() {
    setThemes(widget.themes);
    super.initState();
  }

  double? textSize, buttonSize, buttonIconSize, colorContainerSize = 0.0;

  List<Map>? themes = List<Map>.empty(growable: true);
  void onThemeSelect(int? key) {
    for(var t in themes!) { t['selected'] = t['key'] == key ? true : false; }
    setThemes(themes);
    widget.action!(key);
  }
  void setThemes(List<Map>? list) { setState(() { themes = list; }); }

  Widget? createLabelWidget(String? label) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(bottom: 5.0),
      child: WTComponentBuilder.createText(
        text: label,
        textAlign: TextAlign.left,
        textStyle: widget.textStyle!(
          textColor: widget.textColor,
          fontSize: textSize,
        ),
      ),
    );
  }

  Widget? createSelectButtonWidget(int? key, bool? selected) {
    return GestureDetector(
      onTap: () => onThemeSelect(key),
      child: Container(
        width: buttonSize,
        margin: const EdgeInsets.only(right: 5.0),
        child: WTComponentBuilder.createIcon(
          iconData: selected! ? widget.selectedIcon : widget.unselectedIcon,
          color: selected ? widget.selectedIconColor! : widget.unselectedIconColor,
          size: buttonIconSize,
        ),
      ),
    );
  }

  Widget? createColorContainerWidget(Color? c) {
    return Container(
      height: colorContainerSize,
      width: colorContainerSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: c,
        border: Border.all(width: 2, color: Colors.grey.shade200),
        borderRadius: const BorderRadius.all(Radius.circular(4))
      ),
      margin: const EdgeInsets.only(right: 10.0),
    );
  }

  List<Widget>? createThemesListWidget() {
    List<Widget>? list = List<Widget>.empty(growable: true);

    for(var t in themes!) {
      List<Widget>? colors = List<Widget>.empty(growable: true);
      t['colors'].forEach((c) {
        colors.add(createColorContainerWidget(c)!);
      });

      list.add(
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          margin: themes!.last['key'] == t['key']
            ? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0)
            : const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /// button
              createSelectButtonWidget(t['key'], t['selected'])!,

              /// label && colors list
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    /// label
                    createLabelWidget(t['label'])!,

                    /// colors list
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      padding: const EdgeInsets.all(0.0),
                      margin: const EdgeInsets.all(0.0),
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: colors.length,
                        itemBuilder: (c, i) => colors[i]
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      );
    }

    return list;
  }

  Widget? createBody() {
    if(themes!.isEmpty) { return WTComponentBuilder.emptyComponent(); }

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ...createThemesListWidget()!,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        widget.width       = constraints.maxWidth;
        widget.padding     = widget.padding ?? const EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0);
        widget.margin      = widget.margin ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        textSize           = constraints.maxWidth * 0.045;
        buttonSize         = widget.width! * 0.1;
        buttonIconSize     = buttonSize! * 0.85;
        colorContainerSize = widget.width! * 0.115;

        return Container(
          width: widget.width,
          padding: widget.padding,
          margin: widget.margin,
          color: widget.backgroundColor!,
          alignment: Alignment.topCenter,
          child: createBody(),
        );
      }
    );
  }

}