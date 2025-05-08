import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_svg.dart';
import '../wtoolbox_loading_component.dart';

class WTLoadingOnboardingView extends WTLoadingComponent {

  @override
  Widget? build() {
    return WTLoadingOnboardingViewState(
      key:                            getUniqueKey(),
      width:                          width,
      height:                         height,
      backgroundColor:                backgroundColor,
      textStyle:                      textStyle,
      padding:                        padding,
      margin:                         margin,
      content:                        content,
      action:                         action,
      title:                          title,
      titleSize:                      titleSize,
      titleColor:                     titleColor,
      titleBackgroundColor:           titleBackgroundColor,
      subtitle:                       subtitle,
      subtitleSize:                   subtitleSize,
      subtitleColor:                  subtitleColor,
      subtitleBackgroundColor:        subtitleBackgroundColor,
      label:                          label,
      labelSize:                      labelSize,
      labelColor:                     labelColor,
      labelBackgroundColor:           labelBackgroundColor,
      icon:                           icon,
      iconSize:                       iconSize,
      iconColor:                      iconColor,
      iconBackgroundColor:            iconBackgroundColor,
      primaryButtonLabel:             primaryButtonLabel,
      primaryButtonLabelSize:         primaryButtonLabelSize,
      primaryButtonLabelColor:        primaryButtonLabelColor,
      primaryButtonBackgroundColor:   primaryButtonBackgroundColor,
      secondaryButtonLabel:           secondaryButtonLabel,
      secondaryButtonLabelSize:       secondaryButtonLabelSize,
      secondaryButtonLabelColor:      secondaryButtonLabelColor,
      secondaryButtonBackgroundColor: secondaryButtonBackgroundColor,
    );
  }

}

// ignore: must_be_immutable
class WTLoadingOnboardingViewState extends StatefulWidget {

  Function? textStyle;
  VoidCallback? action;
  IconData? icon;
  EdgeInsets? padding, margin;
  double? width, height, titleSize, subtitleSize, labelSize, iconSize,
      primaryButtonLabelSize, secondaryButtonLabelSize;
  String? content, title, subtitle, label, primaryButtonLabel, secondaryButtonLabel;
  Color? backgroundColor, iconColor, iconBackgroundColor,
      titleColor, titleBackgroundColor, subtitleColor, subtitleBackgroundColor, labelColor, labelBackgroundColor,
      primaryButtonLabelColor, primaryButtonBackgroundColor, secondaryButtonLabelColor, secondaryButtonBackgroundColor;

  WTLoadingOnboardingViewState({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.textStyle,
    this.content,
    this.action,
    this.title,
    this.titleSize,
    this.titleColor,
    this.titleBackgroundColor,
    this.subtitle,
    this.subtitleSize,
    this.subtitleColor,
    this.subtitleBackgroundColor,
    this.label,
    this.labelSize,
    this.labelColor,
    this.labelBackgroundColor,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.iconBackgroundColor,
    this.primaryButtonLabel,
    this.primaryButtonLabelSize,
    this.primaryButtonLabelColor,
    this.primaryButtonBackgroundColor,
    this.secondaryButtonLabel,
    this.secondaryButtonLabelSize,
    this.secondaryButtonLabelColor,
    this.secondaryButtonBackgroundColor,
  });

  @override
  State<WTLoadingOnboardingViewState> createState() => WTLoadingOnboardingViewStateless();

}

class WTLoadingOnboardingViewStateless extends State<WTLoadingOnboardingViewState> {

  @override
  void initState() {
    setContent();
    super.initState();
  }

  int? contentItemsCount = 0;
  List<dynamic>? content = List<dynamic>.empty(growable: true);
  void setContent() {
    content!.addAll(jsonDecode(widget.content!));
    contentItemsCount = content!.length;

    setState(() {
      content!;
      contentItemsCount;
    });
  }

  int? currentPage = 0;
  PageController? pageController = PageController(initialPage: 0);
  void setCurrentPage(int? p) { setState(() { currentPage = p!; }); }

  AnimatedContainer buildDot({
    int currentPage   = 0,
    int index         = 0,
    Color onBtnColor  = Colors.black,
    Color offBtnColor = const Color(0xFFD8D8D8),
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: 6, // currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? onBtnColor : offBtnColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  void onHeaderBackButtonTap() {
    int currentPageNumber = currentPage! - 1;
    setCurrentPage(currentPageNumber);
    pageController!.animateToPage(
      currentPageNumber,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut
    );
  }

  void onFooterButtonTap() {
    int currentPageNumber = currentPage! + 1;
    setCurrentPage(currentPageNumber);
    if(currentPage! <= contentItemsCount!) {
      pageController!.animateToPage(
        currentPageNumber,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut
      );
    }
    if(currentPage == contentItemsCount) {
      widget.action!();
    }
  }

  Widget? createHeaderWidget() {
    return Container(
      width: widget.width,
      margin: const EdgeInsets.all(0.0),
      padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          /// icon, iconSize, iconColor, iconBackgroundColor
          currentPage == 0
            ? const SizedBox(height: 50.0, width: 80.0)
            : GestureDetector(
                onTap: () => onHeaderBackButtonTap(),
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  margin: const EdgeInsets.all(0.0),
                  alignment: Alignment.centerLeft,
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: widget.iconBackgroundColor,
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                  ),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      widget.icon!,
                      size: widget.iconSize,
                      color: widget.iconColor,
                    ),
                  ),
                ),
              ),

          /// primaryButtonLabel, primaryButtonLabelSize, primaryButtonLabelColor, primaryButtonBackgroundColor
          GestureDetector(
            onTap: () => widget.action!(),
            child: Container(
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.all(0.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: widget.primaryButtonBackgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
              height: 50.0,
              child: Text(
                widget.primaryButtonLabel!,
                textAlign: TextAlign.center,
                style: widget.textStyle!(
                  textColor: widget.primaryButtonLabelColor,
                  fontSize: widget.primaryButtonLabelSize
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget? createBodyWidget() {
    return Expanded(
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            /***** splash content ( content) *****/
            Container(
              width: widget.width!,
              height: widget.width! + 75.0,
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              color: Colors.transparent,
              child: PageView.builder(
                onPageChanged: (v) => setCurrentPage(v),
                itemCount: contentItemsCount,
                controller: pageController,
                itemBuilder: (context, i) {
                  Map<String, dynamic> data = content![i];

                  return SplashContent(
                    width: widget.width,
                    title: data['title'],
                    text: data['text'],
                    image: data['image'],
                    titleStyle: widget.textStyle!(
                      textColor: widget.titleColor,
                      fontSize: widget.titleSize
                    ),
                    textStyle:  widget.textStyle!(
                      textColor: widget.subtitleColor,
                      fontSize: widget.subtitleSize
                    ),
                  );
                },
              ),
            ),

            /***** content navigation dots ( labelColor, labelBackgroundColor ) *****/
            Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contentItemsCount!,
                  (i) => buildDot(
                    onBtnColor: widget.labelColor!,
                    currentPage: currentPage!,
                    index: i,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget? createFooterWidget() {
    return Container(
      width: widget.width,
      padding: const EdgeInsets.fromLTRB(15.0, 4.5, 15.0, 7.5),
      margin: const EdgeInsets.all(0.0),
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          /// secondaryButtonLabel, secondaryButtonLabelSize, secondaryButtonLabelColor, secondaryButtonBackgroundColor,
          GestureDetector(
            onTap: () => onFooterButtonTap(),
            child: Container(
              padding: const EdgeInsets.fromLTRB(7.5, 7.5, 7.5, 7.5),
              margin: const EdgeInsets.fromLTRB(70.0, 0.0, 70.0, 0.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: widget.secondaryButtonBackgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
              child: Text(
                widget.secondaryButtonLabel!,
                textAlign: TextAlign.center,
                style: widget.textStyle!(
                  textColor: widget.secondaryButtonLabelColor,
                  fontSize: widget.secondaryButtonLabelSize,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      key: widget.key,
      child: LayoutBuilder(
        builder: (context, constraints) {
          widget.width                    = constraints.maxWidth;
          widget.height                   = constraints.maxHeight;
          widget.iconSize                 = widget.width! * 0.06;
          widget.primaryButtonLabelSize   = widget.width! * 0.05;
          widget.secondaryButtonLabelSize = widget.width! * 0.05;
          widget.titleSize                = widget.width! * 0.055;
          widget.subtitleSize             = widget.width! * 0.04;

          return Container(
            width: widget.width!,
            height: widget.height,
            alignment: Alignment.center,
            color: widget.backgroundColor,
            padding: widget.padding,
            margin: widget.margin,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                createHeaderWidget()!, /// header
                createBodyWidget()!,   /// body
                createFooterWidget()!, /// footer
              ],
            ),
          );
        }
      ),
    );
  }

}

// ignore: must_be_immutable
class SplashContent extends StatelessWidget {

  SplashContent({
    super.key,
    this.width,
    this.title,
    this.text,
    this.image,
    this.titleStyle,
    this.textStyle,
  });

  double? width;
  String? title, text, image;
  TextStyle? titleStyle, textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      //height: width! + 75.0,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          /*************** image ***************/
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
            child: SvgPicture.asset(
              image!,
              width: width! * 0.60,
              height: width! * 0.60,
            ),
          ),

          /*************** title && text ***************/
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /**** title ****/
                Container(
                  child: Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: titleStyle!,
                  ),
                ),

                const SizedBox(height: 12.0),

                /**** text ****/
                Container(
                  child: Text(
                    text!,
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

}