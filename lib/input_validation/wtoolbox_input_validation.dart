import 'package:wtoolbox/external/lib_getx.dart';

class WTInputValidation {

  static String? isEmpty({ required String key, required String value }) {
    if(value.isEmpty) { return 'emptyValidator'.trParams({ 'value': key.toLowerCase() }); }
    return '';
  }

  static String? containsEmptySpace({ required String key, required String value }) {
    if(value.contains(' ')) { return 'emptySpaceValidator'.trParams({ 'value': key.toLowerCase() }); }
    return '';
  }

  static String? isEmail({ required String key, required String value }) {
    if(!value.isEmail) { return 'emailValidator'.trParams({ 'value': key.toLowerCase() }); }
    if(!RegExp(r'^[a-zA-Z0-9.+_]+$').hasMatch(value.split('@').first)) { return 'emailValidator1'.tr; }
    return '';
  }

  static String? minimumLength({ required String key, required String value, required int length  }) {
    if(value.length < length) { return 'minLengthValidator'.trParams({ 'key': key, 'value': length.toString() }); }  
    return '';
  }

  static String? missingSign({ required String key, required String value, required String sign }) {
    if(!value.contains(sign)) { return 'missingValidator'.trParams({ 'key': key, 'value': sign.toLowerCase() }); }  
    return '';
  }

  static String? isPhoneNumber({ required String key, required String value }) {
    if(!RegExp(r'^\+?\d+$').hasMatch(value)) { return 'phoneValidator'.trParams({ 'value': key.toLowerCase() }); }
    return '';
  }

  static String? containsLetters({ required String key, required String value }) {
    if(RegExp(r'[a-zA-Z]').hasMatch(value)) { return 'letterValidator'.trParams({ 'value': key.toLowerCase() }); }
    return '';
  }

  static String? containsNumbers({ required String key, required String value }) {
    if(RegExp(r'\d').hasMatch(value)) { return 'numberValidator'.trParams({ 'value': key.toLowerCase() }); }
    return '';
  }

  static String? isDouble({ required String key, required String value }) {
    if(value.startsWith('.')) { return 'invalidValidator'.trParams({ 'value': key.toLowerCase() }); }
    if(double.tryParse(value) == null) { return 'invalidValidator'.trParams({ 'value': key.toLowerCase() }); }
    return '';
  }

  static String? isDoubleNegative({ required String key, required double value }) {
    if(value.isNegative) { return 'negativeValidator'.trParams({ 'value': key.toLowerCase() }); }
    return '';
  }

  static String? isInteger({ required String key, required String value }) {
    if(int.tryParse(value) == null) { return 'invalidValidator'.trParams({ 'value': key.toLowerCase() }); }
    return '';
  }

  static String? isIntengerNegative({ required String key, required int value }) {
    if(value < 0) { return 'negativeValidator'.trParams({ 'value': key.toLowerCase() }); }
    return '';
  }

  static String? containsNonAlphanumeric({ required String key, required String value }) {
    if(RegExp(r'[^a-zA-Z0-9]').hasMatch(value)) { return 'nonAlphanumericValidator'.trParams({ 'value': key.toLowerCase() }); }
    return '';
  }

}