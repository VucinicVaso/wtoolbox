import 'package:flutter/material.dart';
import '../../wtoolbox_component.dart';

abstract class WTFormInputField extends WTComponent {

  FocusNode? focusNode, secondaryFocusNode;
  void setFocusNode() { focusNode = FocusNode(); }
  void setSecondaryFocusNode(FocusNode? v) { secondaryFocusNode = v; }

  Function? validator;
  void setValidator(Function? v) { validator = v; }

  TextEditingController? controller;
  void setController(TextEditingController? v) { controller = v; }

  bool? isEnabled = true;
  void enable() { isEnabled = true; }
  void disable() { isEnabled = false; }

  bool? asterixRequired = false;
  Color? asterixColor;
  void requireAsterix() { asterixRequired = true; }
  void setAsterixColor(Color? v) { asterixColor = v; }

  bool? separatorEnabled = false;
  Color? separatorColor;
  double? separatorSize;
  void enableSeparator() { separatorEnabled = true; }
  void setSeparatorColor(Color? v) { separatorColor = v; }
  void setSeparatorSize(double? v) { separatorSize = v; }

  bool? textareaEnabled = false;
  void enableTextarea() { textareaEnabled = true; }

  IconData? prefix;
  double? prefixSize;
  Color? prefixColor;
  Function? prefixAction;
  void setPrefixSize(double? v) { prefixSize = v; }
  void setPrefixColor(Color? v) { prefixColor = v; }
  void setPrefix({ IconData? iconData, Function? action }) {
    prefix       = iconData;
    prefixAction = action;
  }

  IconData? suffix;
  double? suffixSize;
  Color? suffixColor;
  Function? suffixAction;
  void setSuffixSize(double? v) { suffixSize = v; }
  void setSuffixColor(Color? v) { suffixColor = v; }
  void setSuffix({ IconData? iconData, Function? action }) {
    suffix       = iconData;
    suffixAction = action;
  }

  String? inputText, label, hintLabel;
  Color? inputTextColor, labelColor, hintLabelColor, errorTextColor;
  double? inputTextSize, labelSize, hintLabelSize, errorTextSize;
  void setInputText(String? v) { inputText = v; }
  void setInputTextColor(Color? v) { inputTextColor = v; }
  void setInputTextSize(double? v) { inputTextSize = v; }
  void setLabel(String? v) { label = v; }
  void setLabelColor(Color? v) { labelColor = v; }
  void setLabelSize(double? v) { labelSize = v; }
  void setHintLabel(String? v) { hintLabel = v; }
  void setHintColor(Color? v) { hintLabelColor = v; }
  void setHintLabelSize(double? v) { hintLabelSize = v; }
  void setErrorTextColor(Color? v) { errorTextColor = v; }
  void setErrorTextSize(double? v) { errorTextSize = v; }

  Color? buttonColor, buttonBackgroundColor;
  void setButtonColor(Color? v) { buttonColor = v; }
  void setButtonBackgroundColor(Color? v) { buttonBackgroundColor = v; }

  Function? action, submitAction;
  void setAction(Function? v) { action = v; }
  void setSubmitAction(Function? v) { submitAction = v; }

  Function? takeCameraImage, onCameraImageTaken;
  void setTakeCameraImage(Function? v) { takeCameraImage = v; }
  void setCameraImageTaken(Function? v) { onCameraImageTaken = v; }

  Function? selectFilesAction, onFilesSelectedAction;
  void setSelectFilesAction(Function? v) { selectFilesAction = v; }
  void setOnFilesSelectedAction(Function? v) { onFilesSelectedAction = v; }

  List<Map<String, dynamic>>? dropdownItems = List<Map<String, dynamic>>.empty(growable: true);
  void addDropdownItem({ String? label, bool? selected }) { dropdownItems!.add({ 'label': label, 'selected': selected }); }
  void addDropdownItems(List<Map<String, dynamic>>? v) { dropdownItems!.addAll(v!); }

  TextAlign? textAlign = TextAlign.left;
  void setTextAlign(TextAlign? v) { textAlign = v; }

  TextInputType? textInputType;
  void setTextInputType(TextInputType? v) { textInputType = v; }
  void useNumberKeyboard() { textInputType = TextInputType.number; }
  void useTextKeyboard() { textInputType = TextInputType.text; }
  void useEmailKeyboard() { textInputType = TextInputType.emailAddress; }

  TextCapitalization? textCapitalization = TextCapitalization.none;
  void useSentencesTextCapitalization() { textCapitalization = TextCapitalization.sentences; }
  void useWordsTextCapitalization() { textCapitalization = TextCapitalization.words; }
  void useCharactersTextCapitalization() { textCapitalization = TextCapitalization.characters; }
  void useNoneTextCapitalization() { textCapitalization = TextCapitalization.none; }

  AutovalidateMode? autoValidateMode;
  void setAutoValidation(AutovalidateMode? v) { autoValidateMode = v; }
  void autoValidateAlways() { autoValidateMode = AutovalidateMode.always; }
  void autoValidateDisabled() { autoValidateMode = AutovalidateMode.disabled; }
  void autoValidateOnUserInteraction() { autoValidateMode = AutovalidateMode.onUserInteraction; }

  bool? regularBorderEnabled = false;
  bool? styledBorderEnabled = false;
  void enableRegularBorder(bool? v) { regularBorderEnabled = v; }
  void enableStyledBorder(bool? v) { styledBorderEnabled = v; }

  InputBorder? getBorder() {
    if(regularBorderEnabled!) {
      return UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade500, width: 1.0)
      );
    }

    if(styledBorderEnabled!) {
      return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
        borderRadius: BorderRadius.circular(4.0),
      );
    }

    return const UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 0.0));
  }

  UnderlineInputBorder? getFocusedBorder() {
    return UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue.shade300, width: 1.0));
  }

  UnderlineInputBorder? getErrorBorder() {
    return UnderlineInputBorder(borderSide: BorderSide(color: Colors.red.shade300, width: 1.0));
  }

}