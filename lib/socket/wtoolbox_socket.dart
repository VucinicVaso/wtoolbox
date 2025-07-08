import 'package:wtoolbox/external/lib_stomp.dart';
import 'package:wtoolbox/logger/wtoolbox_logger.dart';

abstract class WTSocket {

  StompClient? client;

  int? reconnectDelayTime, heartbeatIncomingTime, heartbeatOutgoingTime;
  void setReconnectDelayTime(int? v) { reconnectDelayTime = v; }
  void setHeartbeatIncomingTime(int? v) { heartbeatIncomingTime = v; }
  void setHeartbeatOutgoingTime(int? v) { heartbeatOutgoingTime = v; }

  String? wsAddress;
  void setWebSocketAddress(String? value) { wsAddress = value; }

  String? subscribeDestination;
  void setSubscribeDestination(String? value) { subscribeDestination = value; }

  String? sendDestination;
  void setSendDestionation(String? value) { sendDestination = value!; }

  Map<String, String>? clientHeaders = <String, String>{};
  void setClientHeaders(Map<String, String>? headers) {
    clientHeaders!
      ..clear()
      ..addAll(headers!);
  }

  bool? connected = false;
  void isConnected(bool? value) { connected = value; }

  String? errorMessage = '';
  void setErrorMessage({ bool? show, String? message }) {
    WTLogger.write(message);
    errorMessage = show! ? message! : '';
  }

  Future<void> start();

  void stop();

  Future<void> restart();

  void onError(String? e);

  void onConnect(StompFrame sF);

  Future<void> receive(StompFrame sF);

  void send({ Map<String, String>? headers, String? body });

}