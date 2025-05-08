import 'package:flutter/material.dart';
import '../wtoolbox_form_input_field.dart';
import '../wtoolbox_form_input_field_builder.dart';
import '../../../wtoolbox_component_builder.dart';

class WTFormInputFieldFilePicker extends WTFormInputField {

  @override
  Widget? build() {
    return FilePickerInputField(
      key:                   getUniqueKey(),
      padding:               padding,
      margin:                margin,
      backgroundColor:       backgroundColor,
      borderColor:           borderColor,
      label:                 label,
      labelSize:             labelSize,
      labelColor:            labelColor,
      hintLabel:             hintLabel,
      hintLabelSize:         hintLabelSize,
      hintLabelColor:        hintLabelColor,
      prefix:                prefix,
      prefixSize:            prefixSize,
      prefixColor:           prefixColor,
      suffix:                suffix,
      suffixSize:            suffixSize,
      suffixColor:           suffixColor,
      selectFilesAction:     selectFilesAction,
      onFilesSelectedAction: onFilesSelectedAction,
      textStyle:             textStyle,
    );
  }

}

// ignore: must_be_immutable
class FilePickerInputField extends StatefulWidget {

  EdgeInsets? padding, margin;
  Color? backgroundColor, borderColor, labelColor, hintLabelColor, prefixColor, suffixColor;
  double? labelSize, hintLabelSize, prefixSize, suffixSize;
  String? label, hintLabel;
  IconData? prefix, suffix;
  Function? selectFilesAction, onFilesSelectedAction, textStyle;

  FilePickerInputField({
    super.key,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.label,
    this.labelSize,
    this.labelColor,
    this.hintLabel,
    this.hintLabelSize,
    this.hintLabelColor,
    this.prefix,
    this.prefixSize,
    this.prefixColor,
    this.suffix,
    this.suffixSize,
    this.suffixColor,
    this.selectFilesAction,
    this.onFilesSelectedAction,
    this.textStyle,
  });

  @override
  State<FilePickerInputField> createState() => FilePickerInputFieldState();

}

class FilePickerInputFieldState extends State<FilePickerInputField> with WTFormInputFieldBuilder {

  @override
  void initState() {
    super.initState();
  }

  List<Map> files = List<Map>.empty(growable: true);
  Future<void> selectFiles() async {
    List<Map>? list = await widget.selectFilesAction!();

    if(list!.isNotEmpty) {
      int key = files.length;
      for(var xF in list) {
        key++;
        setState(() => files.add({ 'key': key, 'name': xF['basename'], 'approved': false, 'file': xF }));
      }
    }
  }

  Future<void> deleteSelectedFile(int? key) async {
    setState(() { files.removeWhere((e) => e['key'] == key); });
    widget.onFilesSelectedAction!(files.where((e) => e['approved'] == true).toList());
  }

  Future<void> approveFile(int? key) async {
    for(var f in files) {
      if(f['key'] == key) { f['approved'] = f['approved'] == true ? false : true; }
      setState(() { files = files; });
      widget.onFilesSelectedAction!(files.where((e) => e['approved'] == true).toList());
    }
  }

  Widget? createPrefixWidget() {
    if(widget.prefix == null) { return WTComponentBuilder.emptyComponent()!; }

    return Container(
      padding: const EdgeInsets.all(0.0),
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 7.5, 0.0),
      child: WTComponentBuilder.createIcon(
        iconData: widget.prefix,
        color: widget.prefixColor,
        size: widget.prefixSize,
      ),
    );
  }

  Widget? createSuffixWidget() {
    if(widget.suffix == null) { return WTComponentBuilder.emptyComponent()!; }

    return Container(
      padding: const EdgeInsets.all(0.0),
      margin: const EdgeInsets.fromLTRB(7.5, 0.0, 0.0, 0.0),
      child: WTComponentBuilder.createIcon(
        iconData: widget.suffix,
        color: widget.suffixColor,
        size: widget.suffixSize,
      ),
    );
  }

  Widget? createHintLabelWidget() {
    if(widget.hintLabel == null) { return WTComponentBuilder.emptyComponent(); }

    return createLabelContainer(
      label: '${widget.hintLabel}: (${files.where((e) => e['approved'] == true).length})',
      margin: const EdgeInsets.fromLTRB(0.0, 7.5, 0.0, 0.0),
      textStyle: widget.textStyle!(
        fontSize: widget.hintLabelSize,
        textColor: widget.hintLabelColor,
        fontWeight: FontWeight.bold
      ),
    )!;
  }

  Widget? selectedFilesWidget() {
    if(files.isEmpty) { return WTComponentBuilder.emptyComponent()!; }

    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ...files.map((e) =>
            Container(
              margin: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  /// icon
                  GestureDetector(
                    onTap: () async => approveFile(e['key']),
                    child: WTComponentBuilder.createIcon(
                      iconData: Icons.check,
                      color: e['approved'] ? widget.hintLabelColor : widget.labelColor,
                      size: 30.0,
                    )!,
                  ),

                  /// file name
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                      child: WTComponentBuilder.createText(
                        text: e['name'],
                        color: widget.labelColor,
                        size: 16.5,
                      ),
                    ),
                  ),

                  /// delete file action
                  GestureDetector(
                    onTap: () async => await deleteSelectedFile(e['key']),
                    child: WTComponentBuilder.createIcon(
                      iconData: Icons.delete_outline,
                      color: widget.hintLabelColor,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: widget.key,
      builder: (context, constraints) {
        double width         = constraints.maxWidth;
        widget.padding       = widget.padding ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        widget.margin        = widget.margin ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
        widget.labelSize     = width * 0.04;
        widget.hintLabelSize = width * 0.035;
        widget.prefixSize    = width * 0.045;
        widget.suffixSize    = width * 0.045;

        return Container(
          key: widget.key,
          padding: widget.padding,
          margin: widget.margin,
          alignment: Alignment.centerLeft,
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              /// prefix, label (select file), suffix
              GestureDetector(
                onTap: () async => await selectFiles(),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                  margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  decoration: createContainerDecoration(
                    backgroundColor: widget.backgroundColor,
                    borderColor: widget.borderColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      /// prefix
                      createPrefixWidget()!,

                      /// label
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(0.0),
                          margin: const EdgeInsets.all(0.0),
                          child: Text(
                            widget.label!,
                            style: widget.textStyle!(
                              fontSize: widget.labelSize,
                              textColor: widget.labelColor,
                              fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),

                      /// suffix
                      createSuffixWidget()!,
                    ],
                  ),
                ),
              ),

              /// hint label
              createHintLabelWidget()!,

              /// show list of selected files
              selectedFilesWidget()!,

            ],
          ),
        );
      }
    );
  }

}