import 'dart:convert';

class JwtTokenDecoder {
  static String? getSub(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) {
        throw Exception('Invalid JWT token');
      }

      final payload = parts[1];
      final normalized = base64Url.normalize(payload);
      final decodedBytes = base64Url.decode(normalized);
      final jsonString = utf8.decode(decodedBytes);
      final Map<String, dynamic> payloadMap = json.decode(jsonString);

      return payloadMap['sub']?.toString();
    } catch (e) {
      return null;
    }
  }
}
