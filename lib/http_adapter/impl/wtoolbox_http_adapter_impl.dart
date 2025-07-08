import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:wtoolbox/external/lib_http.dart' as http;
import 'package:wtoolbox/external/lib_http_io_client.dart';
import 'package:wtoolbox/external/lib_email.dart';
import '../wtoolbox_http_adapter.dart';
import '../helper/wtoolbox_http_adapter_support.dart';

class WTHttpAdapterImpl extends WTHttpAdapter {

  WTHttpAdapterImpl(String? certificate) {
    initSecurityContext(certificate);
    WTHttpAdapterSupport.instance.check();
  }

  @override
  Future<void> initSecurityContext(String? certificate) async {
    if(certificate != null || certificate != '') {
      try {
        final sslCertificate = await rootBundle.load(certificate!);
          
        securityContext = SecurityContext(withTrustedRoots: true)
          ..setTrustedCertificatesBytes(sslCertificate.buffer.asInt8List());
      }catch (e) {
        throw('WTHttpAdapter.initSecurityContext() Error: ${e.toString()}');
      }
    }
  }

  @override
  Future<dynamic> post(String? url, Map<String, String>? headers, Map<String, dynamic>? body) async {
    try {
      Map<String, String> headersMap = <String, String>{};
      headersMap['Content-Type'] = 'application/json; charset=UTF-8';
      headersMap['Charset']      = 'utf-8';
      if(headers!.isNotEmpty) { headersMap.addAll(headers); }

      String encodedBody = jsonEncode(body);

      Uri uri = Uri.parse(url!);
      HttpClient? httpClient;
      if(securityContext != null) {
        httpClient = HttpClient(context: securityContext);
        httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) => false;
      }else {
        httpClient = HttpClient();
        httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      }
      final ioHttpClient = IOClient(httpClient);

      final http.Response response = await ioHttpClient.post(uri, headers: headersMap, body: encodedBody);
      if(response.statusCode != 200) { throw HttpException('${response.statusCode}'); }
      return jsonDecode(response.body);
    }on SocketException catch (e) {
      throw('WTHttpAdapter.post() SocketException: ${e.osError!.message}');
    }on HttpException catch(e) {
      throw('WTHttpAdapter.post() HttpException: ${e.toString()}');
    }on FormatException catch(e) {
      throw('WTHttpAdapter.post() FormatException: ${e.message}');
    }on Error catch(e) {
      throw('WTHttpAdapter.post() Error: ${e.toString()}');
    }
  }

  @override
  Future<dynamic> get(String? url, Map<String, String>? headers) async {
    try {
      Map<String, String> headersMap = <String, String>{};
      headersMap['Content-Type'] = 'application/json; charset=UTF-8';
      headersMap['Charset']      = 'utf-8';
      if(headers!.isNotEmpty) { headersMap.addAll(headers); }

      Uri uri = Uri.parse(url!);
      HttpClient? httpClient;
      if(securityContext != null) {
        httpClient = HttpClient(context: securityContext);
        httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) => false;
      }else {
        httpClient = HttpClient();
        httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      }
      final ioHttpClient = IOClient(httpClient);

      final http.Response response = await ioHttpClient.get(uri, headers: headers);
      if(response.statusCode != 200) { throw HttpException('${response.statusCode}'); }
      return jsonDecode(response.body);
    }on SocketException catch (e) {
      throw('WTHttpAdapter.get() SocketException: ${e.osError!.message.toString()}');
    }on HttpException catch(e) {
      throw('WTHttpAdapter.get() HttpException: ${e.message}');
    }on FormatException catch(e) {
      throw('WTHttpAdapter.get() FormatException: ${e.message}');
    }on Error catch(e) {
      throw('WTHttpAdapter.get() Error: ${e.toString()}');
    }
  }

  @override
  Future<void> email({ String? subject, String? body, String? filePath }) async {
    if(filePath != null) {
      XFile? xfile = XFile(filePath);
      List<XFile>? xFileList = List.empty(growable: true);
      xFileList.addAll([ xfile ]);

      await Share.shareXFiles(xFileList, subject: subject, text: body);
    }
    
    if(filePath == null) {
      await Share.share(body!, subject: subject);
    }
  }

}
