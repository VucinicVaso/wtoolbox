import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wtoolbox/3rd_party/lib_signature.dart';
import '../wtoolbox_signature.dart';

class WTSignatureBasic extends WTSignature {

  @override
  Widget? build() {
    return SignatureStatefulWidget(
      width:                 width,
      height:                height,
      padding:               padding,
      margin:                margin,
      penColor:              penColor,
      backgroundColor:       backgroundColor,
      penStrokeWidth:        penStrokeWidth,
      textEditingController: textEditingController,
      doneAction:            doneAction,
      doneButtonLabel:       doneButtonLabel,
      doneButtonLabelColor:  doneButtonLabelColor,
      doneButtonColor:       doneButtonColor,
      clearButtonLabel:      clearButtonLabel,
      clearButtonLabelColor: clearButtonLabelColor,
      clearButtonColor:      clearButtonColor,
    );
  }

}

// ignore: must_be_immutable
class SignatureStatefulWidget extends StatefulWidget {

  double? width, height;
  EdgeInsets? padding, margin;
  Color? penColor, backgroundColor, doneButtonColor, doneButtonLabelColor, clearButtonColor, clearButtonLabelColor;
  double? penStrokeWidth;
  TextEditingController? textEditingController;
  String? doneButtonLabel, clearButtonLabel;
  Function? doneAction, clearAction;

  SignatureStatefulWidget({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.penColor,
    this.backgroundColor,
    this.penStrokeWidth,
    this.textEditingController,
    this.doneButtonColor,
    this.doneButtonLabel,
    this.doneButtonLabelColor,
    this.doneAction,
    this.clearButtonColor,
    this.clearButtonLabel,
    this.clearButtonLabelColor,
    this.clearAction,
  });

  @override
  State<SignatureStatefulWidget> createState() => SignatureStatefulWidgetState();
}

class SignatureStatefulWidgetState extends State<SignatureStatefulWidget> {

  @override
  void initState() {
    initSignatureController();
    super.initState();
  }


  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  SignatureController? _controller;
  void initSignatureController() {
    _controller = SignatureController(
      penStrokeWidth:        widget.penStrokeWidth!,
      penColor:              widget.penColor!,
      exportBackgroundColor: widget.backgroundColor!,
      onDrawEnd:             () async => await onDrawEnd()
    );

    if(widget.textEditingController!.text.isNotEmpty) {
      Map<dynamic, dynamic> map = jsonDecode(widget.textEditingController!.text);

      List<Point>? points = List<Point>.empty(growable: true);
      for(Map? m in map['points']) {
        Offset offset   = Offset(m!['dx'], m['dy']);
        PointType pT    = PointType.values.firstWhere((p) => p.name == m['type']);
        double pressure = m['pressure'];

        points.add(Point(offset, pT, pressure));
      }
      setState(() { _controller!.points = points; });
    }
  }

  void onClear() {
    setState(() {
      _controller!.clear();
      widget.textEditingController!.text = '';
    });
  }

  Future<void> onDrawEnd() async {
    List<Map>? points = List<Map>.empty(growable: true);
    for(Point p in _controller!.points) {
      points.add({
        'dx': p.offset.dx,
        'dy': p.offset.dy,
        'type': p.type.name,
        'pressure': p.pressure
      });
    }

    Map<dynamic, dynamic> map = <dynamic, dynamic>{};
    map['png']    = await _controller!.toPngBytes();
    map['points'] = points;

    setState(() {
      widget.textEditingController!.text = jsonEncode(map);
    });
  }

  Widget? createSignatureWidget() {
    return Expanded(
      child: Signature(
        controller: _controller!,
        width: widget.width,
        backgroundColor: widget.backgroundColor!,
      ),
    );
  }

  Widget? createOnDoneButtonWidget() {
    return GestureDetector(
      onTap: () => widget.doneAction!(),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
        decoration: BoxDecoration(
          color: widget.doneButtonColor,
          border: Border(
            bottom: BorderSide(
              color: widget.doneButtonLabelColor!,
              width: 1.0,
            ),
          ),
        ),
        child: Text(
          widget.doneButtonLabel!,
          style: TextStyle(
            fontSize: 16.0,
            color: widget.doneButtonLabelColor
          ),
        ),
      ),
    );
  }

  Widget? createOnClearButtonWidget() {
    return GestureDetector(
      onTap: () => onClear(),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
        color: widget.clearButtonColor,
        child: Text(
          widget.clearButtonLabel!,
          style: TextStyle(
            fontSize: 16.0,
            color: widget.clearButtonLabelColor
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: widget.key,
      builder: (context, constraints) {
        widget.width   = widget.width ?? constraints.maxWidth;
        widget.height  = widget.height ?? constraints.maxHeight;
        widget.padding = widget.padding ?? const EdgeInsets.fromLTRB(0, 0, 0, 0);
        widget.margin  = widget.margin  ?? const EdgeInsets.fromLTRB(0, 0, 0, 0);

        return Container(
          padding: widget.padding,
          margin: widget.margin,
          width: widget.width,
          height: widget.height,
          color: widget.backgroundColor,
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              /// signature widget
              createSignatureWidget()!,

              /// actions widgets (done  && clear)
              Container(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    createOnDoneButtonWidget()!,
                    createOnClearButtonWidget()!,
                  ],
                ),
              ),

            ],
          ),
        );
      }
    );
  }

}