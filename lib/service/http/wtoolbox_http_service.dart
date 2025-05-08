import 'dart:io';

abstract class WTHttpService {

  SecurityContext? securityContext;
  Future<void> initSecurityContext(String? certificate);

  Future<dynamic> post(String? url, Map<String, String>? headers, Map<String, dynamic>? body);

  Future<dynamic> get(String? url, Map<String, String>? headers);

  Future<void> sendEmail({ String? subject, String? body, String? filePath });

}