import 'package:wtoolbox/3rd_party/lib_getx.dart';
import 'package:wtoolbox/3rd_party/lib_stomp.dart';
import '../wtoolbox_connector_service.dart';
import '../../queue/wtoolbox_queue_service.dart';
import '../../../helper/logger/wtoolbox_logger.dart';

class WTConnectorServiceImpl extends WTConnectorService {

  @override
  Future<void> connect() async {
    StompConfig stompConfig = StompConfig(
      url: wsAddress!,
      reconnectDelay: const Duration(seconds: 5),
      heartbeatIncoming: const Duration(seconds: 5),
      heartbeatOutgoing: const Duration(seconds: 10),
      stompConnectHeaders: clientHeaders,
      webSocketConnectHeaders: clientHeaders,
      onConnect: onConnectCallback,
      onStompError: (StompFrame sF) => WTLogger.write('WTConnectorService.connect onStompError: headers: ${sF.headers}, body: ${sF.body}'),
      onDisconnect: (StompFrame sF) => WTLogger.write('WTConnectorService.connect onDisconnect: headers: ${sF.headers}, body: ${sF.body}'),
      onUnhandledFrame: (StompFrame sF) => WTLogger.write('WTConnectorService.connect onUnhandledFrame: headers: ${sF.headers}, body: ${sF.body}'),
      onUnhandledMessage: (StompFrame sF) => WTLogger.write('WTConnectorService.connect onUnhandledMessage: headers: ${sF.headers}, body: ${sF.body}'),
      onUnhandledReceipt: (StompFrame sF) => WTLogger.write('WTConnectorService.connect onUnhandledReceipt: headers: ${sF.headers}, body: ${sF.body}'),
      onWebSocketError: (dynamic e) => WTLogger.write('WTConnectorService.connect onWebSocketError: ${e.toString()}'),
      onDebugMessage: onDebugMessage,
    );

    client = StompClient(config: stompConfig);
    client!.activate();
  }

  @override
  void disconnect() {
    client!.deactivate();
    client = null;
    isConnected(false);
  }

  @override
  Future<void> restart() async {
    disconnect();
    await connect();
  }

  @override
  void onDebugMessage(String? e) {
    if(e!.contains('<<< TOKEN_MISSING')) {
      isConnected(false);
      setErrorMessage(show: true, message: '${'stompError1'.tr}. ${'errorTitle'.tr}: $e');
    }else if(e.contains('<<< TOKEN_INVALID')) {
      isConnected(false);
      setErrorMessage(show: true, message: '${'stompError2'.tr}. ${'errorTitle'.tr}: $e');
    }else if(e.contains('Unknown connection error')) {
      isConnected(false);
      setErrorMessage(show: true, message: '${'stompError3'.tr}. ${'errorTitle'.tr}: $e');
    }else if(e.contains('Connection error')) {
      isConnected(false);
      setErrorMessage(show: true, message: '${'stompError4'.tr}. ${'errorTitle'.tr}: $e');
    }else {
      if(!connected!) {
        isConnected(true);
      }
      if(connected! && errorMessage!.isNotEmpty) {
        setErrorMessage(show: false, message: '');
      }
    }
  }

  @override
  void onConnectCallback(StompFrame sF) async {
    WTLogger.write('WTConnectorService.onConnectCallback successfully connected to: $wsAddress.');
    isConnected(true);

    client!.subscribe(destination: subscribeDestination!, headers: clientHeaders, callback: (f) async => await receive(f));
    await Get.find<WTQueueService>().checkForUnSendMessages();
  }

  @override
  Future<void> receive(StompFrame sF) async {
    Map<String, String> receivedHeaders = sF.headers;
    String? receivedBody = String.fromCharCodes(sF.binaryBody!);
    
    await Get.find<WTQueueService>().receive(headers: receivedHeaders, body: receivedBody);
  }

  @override
  void send({ Map<String, String>? headers, String? body }) {
    client!.send(destination: messageSendAddress!, headers: headers, body: body);
  }

}