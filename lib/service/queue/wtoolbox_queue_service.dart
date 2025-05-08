import '../../entity/account/account.dart';

abstract class WTQueueService {

  Future<void> checkForUnSendMessages({ Account? account });

  Future<void> send({ Map<String, String>? headers, Map<String, dynamic>? body, Account? account });

  Future<void> receive({ Map<String, String>? headers, String? body, Account? account });

}