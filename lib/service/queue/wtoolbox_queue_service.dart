abstract class WTQueueService {

  Future<void> checkForUnSendMessages();

  Future<void> send({ Map<String, String>? headers, Map<String, dynamic>? body });

  Future<void> receive({ Map<String, String>? headers, String? body });

}