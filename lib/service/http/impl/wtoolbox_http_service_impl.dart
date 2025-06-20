import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:wtoolbox/3rd_party/lib_http.dart' as http;
import 'package:wtoolbox/3rd_party/lib_http_io_client.dart';
import 'package:wtoolbox/3rd_party/lib_getx.dart';
import 'package:wtoolbox/3rd_party/lib_email.dart';
import '../../../helper/logger/wtoolbox_logger.dart';
import '../../app_lifecycle/wtoolbox_app_lifecycle_service.dart';
import '../wtoolbox_http_service.dart';
import '../helper/wtoolbox_http_support.dart';

class WTHttpServiceImpl extends WTHttpService {

  WTHttpServiceImpl(String? certificate) {
    initSecurityContext(certificate);
    WTHttpSupport.instance.check();
  }

  @override
  Future<void> initSecurityContext(String? certificate) async {
    try {
      final sslCertificate = await rootBundle.load(certificate!);
        
      securityContext = SecurityContext(withTrustedRoots: true)
        ..setTrustedCertificatesBytes(sslCertificate.buffer.asInt8List());
    }catch (e) {
      WTLogger.write('WTHttpService.initSecurityContext Error: ${e.toString()}');
      //throw('WTHttpService.initSecurityContext Error: ${e.toString()}');
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
      throw('WTHttpService.post SocketException: ${e.osError!.message}');
    }on HttpException catch(e) {
      throw('WTHttpService.post HttpException: ${e.toString()}');
    }on FormatException catch(e) {
      throw('WTHttpService.post FormatException: ${e.message}');
    }on Error catch(e) {
      throw('WTHttpService.post Error: ${e.toString()}');
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
      throw('WTHttpService.get request SocketException: ${e.osError!.message.toString()}');
    }on HttpException catch(e) {
      throw('WTHttpService.get request HttpException: ${e.message}');
    }on FormatException catch(e) {
      throw('WTHttpService.get request FormatException: ${e.message}');
    }on Error catch(e) {
      throw('WTHttpService.get request Error: ${e.toString()}');
    }
  }

  @override
  Future<void> sendEmail({ String? subject, String? body, String? filePath }) async {
    Get.find<WTAppLifecycleService>().allow(false);

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
