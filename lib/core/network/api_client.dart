import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:solterra/core/errors/exceptions.dart';

class ApiClient {
  final String baseUrl;
  String Function() tokenController;
  final http.Client _client;
  ApiClient(this.baseUrl, {required this.tokenController, http.Client? client})
    : _client = client ?? http.Client();

  Map<String, String> _buildHeaders({bool requiresAuth = true}) {
    final headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    if (requiresAuth) {
      final token = tokenController();
      if (token.isNotEmpty) {
        headers["Authorization"] = "Bearer $token";
      }
    }
    return headers;
  }

  Map<String, dynamic> _handleStatus(http.Response response) {
    switch (response.statusCode) {
      case 200:
        if (response.body.isEmpty) return {};
        return jsonDecode(response.body) as Map<String, dynamic>;
      case 201:
        if (response.body.isEmpty) return {};
        return jsonDecode(response.body) as Map<String, dynamic>;
      case 204:
        return {};
      case 400:
        final body = response.body.isNotEmpty
            ? jsonDecode(response.body)
            : <String, dynamic>{};
        throw BadRequestException(
          body["message"] as String? ?? "Bad - Request: invalid data sent...",
        );
      case 401:
        throw const UnauthorizedException();
      case 403:
        throw const ForbiddenException();
      case 404:
        throw NotFoundException();
      case 500:
        throw const ServerException();
      case 503:
        throw const ServerException(
          "Server is intentionally offline - try again later...",
        );
      default:
        throw ServerException(
          "Unexpected status code: ${response.statusCode} \n Body: ${response.body}",
        );
    }
  }

  Future<Map<String, dynamic>> get(
    String endpoint, {
    bool requiresAuth = true,
    Map<String, String>? queryParams,
  }) async {
    try {
      final url = Uri.https(baseUrl, endpoint, queryParams);
      final response = await _client
          .get(url, headers: _buildHeaders(requiresAuth: requiresAuth))
          .timeout(Duration(seconds: 15));
      return _handleStatus(response);
    } on SocketException {
      throw NetworkException();
    } on TimeoutException {
      throw NetworkException("Connection time out");
    }
  }

  Future<Map<String, dynamic>> post(
    String path, {
    bool requiresAuth = true,
    Map<String, dynamic>? body,
  }) async {
    try {
      final url = Uri.https(baseUrl, path);
      final response = await _client
          .post(
            url,
            headers: _buildHeaders(requiresAuth: requiresAuth),
            body: body != null ? jsonEncode(body) : null,
          )
          .timeout(Duration(seconds: 15));
      return _handleStatus(response);
    } on SocketException {
      throw const NetworkException();
    } on TimeoutException {
      throw const NetworkException("Connection time out");
    }
  }

  Future<Map<String, dynamic>> patch(
    String path, {
    Map<String, dynamic>? body,
    bool requiresAuth = true,
  }) async {
    try {
      final url = Uri.https(baseUrl, path);
      final response = await _client
          .patch(
            url,
            headers: _buildHeaders(requiresAuth: requiresAuth),
            body: body != null ? jsonEncode(body) : null,
          )
          .timeout(Duration(seconds: 15));
      return _handleStatus(response);
    } on SocketException {
      throw const NetworkException();
    } on TimeoutException {
      throw const NetworkException("Server time out");
    }
  }

  Future<Map<String, dynamic>> delete(
    String path, {
    bool requiresAuth = true,
  }) async {
    try {
      final url = Uri.https(baseUrl, path);
      final response = await _client
          .delete(url, headers: _buildHeaders(requiresAuth: requiresAuth))
          .timeout(Duration(seconds: 15));
      return _handleStatus(response);
    } on SocketException {
      throw const NetworkException();
    } on TimeoutException {
      throw const NetworkException("Server time out");
    }
  }

  Future<List<Map<String, dynamic>>> getList(
    String path, {
    Map<String, String>? queryParams,
    bool requiresAuth = true,
  }) async {
    try {
      final url = Uri.https(baseUrl, path, queryParams);
      final response = await _client
          .get(url, headers: _buildHeaders(requiresAuth: requiresAuth))
          .timeout(Duration(seconds: 15));
      if (response.statusCode == 400) throw const BadRequestException();
      if (response.statusCode == 401) throw const UnauthorizedException();
      if (response.statusCode == 404) throw const NotFoundException();
      if (response.statusCode == 500) throw const ServerException();
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return (body as List)
            .map((item) => item as Map<String, dynamic>)
            .toList();
      } else {
        throw NetworkException("Status ${response.statusCode}");
      }
    } on SocketException {
      throw const NetworkException();
    } on TimeoutException {
      throw const NetworkException("Server time out");
    }
  }

  void dispose() {
    _client.close();
  }
}
