import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nit_alerts/src/nit_alerts_config.dart';

import 'nit_alert_model.dart';

/// Checks if you are awesome. Spoiler: you are.
class NitAlertsManager {
  static String? _alertsEndpoint;
  static NitAlertsConfig? _config;

  static init({
    required String alertsEndpoint,
    required NitAlertsConfig config,
  }) {
    _alertsEndpoint = alertsEndpoint;

    _config = config;
  }

  static reportError({
    required String? text,
    required Map<String, String> state,
    required Object? error,
    required StackTrace? stacktrace,
  }) {
    if (_config != null && _alertsEndpoint != null) {
      _send(
        _config!.prepareAlert(
          type: 'error',
          text: text,
          state: state,
          error: error,
          stacktrace: stacktrace,
        ),
      );
    }
  }

  static _send(NitAlertModel alert) {
    http.post(
      Uri.parse('https://$_alertsEndpoint/code_alert'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(alert.toJson()),
    );
  }
}
