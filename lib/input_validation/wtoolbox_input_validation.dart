import 'package:wtoolbox/external/lib_getx.dart';

class WTInputValidation {

  static String? isEmpty({ required String key, required String value }) {
    if(value.isEmpty) { return 'emptyField'.trParams({ 'value': key.toLowerCase() }); }
    return null;
  }

  static String? containsEmptySpace({ required String key, required String value }) {
    if(value.contains(' ')) { return 'emptySpaceValidator'.trParams({ 'value': key.toLowerCase() }); }
    return null;
  }

  static String? isEmail({ required String key, required String value }) {
    if(!value.isEmail) { return 'emailValidator'.trParams({ 'value': key.toLowerCase() }); }
    if(!RegExp(r'^[a-zA-Z0-9.+_]+$').hasMatch(value.split('@').first)) { return 'emailValidator1'.tr; }
    return null;
  }

  static String? isPhoneNumber({ required String key, required String value }) {
    if(!RegExp(r'^\+?\d+$').hasMatch(value)) { return 'phoneValidator'.trParams({ 'value': key.toLowerCase() }); }
    return null;
  }

  static String? containsLetters({ required String key, required String value }) {
    if(RegExp(r'[a-zA-Z]').hasMatch(value)) { return 'letterValidator'.trParams({ 'value': key.toLowerCase() }); }
    return null;
  }

  static String? containsNumbers({ required String key, required String value }) {
    if(RegExp(r'\d').hasMatch(value)) { return 'numberValidator'.trParams({ 'value': key.toLowerCase() }); }
    return null;
  }

  static String? isDouble({ required String key, required String value }) {
    if(value.startsWith('.')) { return 'invalidValidator'.trParams({ 'value': key.toLowerCase() }); }
    if(double.tryParse(value) == null) { return 'invalidValidator'.trParams({ 'value': key.toLowerCase() }); }
    return null;
  }

  static String? isDoubleNegative({ required String key, required double value }) {
    if(value.isNegative) { return 'negativeValidator'.trParams({ 'value': key.toLowerCase() }); }
    return null;
  }

  static String? isInteger({ required String key, required String value }) {
    if(int.tryParse(value) == null) { return 'invalidValidator'.trParams({ 'value': key.toLowerCase() }); }
    return null;
  }

  static String? isIntengerNegative({ required String key, required int value }) {
    if(value < 0) { return 'negativeValidator'.trParams({ 'value': key.toLowerCase() }); }
    return null;
  }

  static String? containsNonAlphanumeric({ required String key, required String value }) {
    if(RegExp(r'[^a-zA-Z0-9]').hasMatch(value)) { return 'nonAlphanumericValidator'.trParams({ 'value': key.toLowerCase() }); }
    return null;
  }

}