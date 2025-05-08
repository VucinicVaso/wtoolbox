import 'package:flutter/foundation.dart';
import 'package:wtoolbox/3rd_party/lib_getx.dart';
import '../../service/component_factory/factory/wtoolbox_component_factory_service.dart';
import '../../service/component_factory/variant/impl1/wtoolbox_component_variant.dart';

class WTLogger {

  static write(String? message) {
    if(kDebugMode) { print('-- $message'); }
  }

  static error(String? message) {
    write(message);

    Get.find<WTComponentFactoryService>().createDialogueBox(WTDialogueBoxVariant.notification)!
      ..danger()
      ..setLabel(message)
      ..build();
  }

  static warning(String? message) {
    write(message);

    Get.find<WTComponentFactoryService>().createDialogueBox(WTDialogueBoxVariant.notification)!
      ..warning()
      ..setLabel(message)
      ..build();
  }

  static info(String? message) {
    write(message);

    Get.find<WTComponentFactoryService>().createDialogueBox(WTDialogueBoxVariant.notification)!
      ..info()
      ..setLabel(message)
      ..build();
  }

  static success(String? message) {
    write(message);

    Get.find<WTComponentFactoryService>().createDialogueBox(WTDialogueBoxVariant.notification)!
      ..success()
      ..setLabel(message)
      ..build();
  }

}
