import 'package:wtoolbox/3rd_party/lib_stomp.dart';
import 'package:wtoolbox/helper/logger/wtoolbox_logger.dart';

abstract class WTConnectorService {

  StompClient? client;

  String? wsAddress;
  void setWebSocketAddress(String? value) { wsAddress = value; }

  String? subscribeDestination;
  void setSubscribeDestination(String? value) { subscribeDestination = value; }

  String? messageSendAddress;
  void setMessageSendAddress(String? value) { messageSendAddress = value!; }

  Map<String, String>? clientHeaders = <String, String>{};
  void setClientHeaders(Map<String, String>? headers) {
    clientHeaders!.clear();
    clientHeaders!.addAll(headers!);
  }

  bool? connected = false;
  void isConnected(bool? value) { connected = value; }

  String? errorMessage = '';
  void setErrorMessage({ bool? show, String? message }) {
    WTLogger.write(message);
    errorMessage = show! ? message! : '';
  }

  Future<void> connect();

  void disconnect();

  Future<void> restart();

  void onDebugMessage(String? e);

  void onConnectCallback(StompFrame sF);

  Future<void> receive(StompFrame sF);

  void send({ Map<String, String>? headers, String? body });

}