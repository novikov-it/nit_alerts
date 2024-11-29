import 'package:nit_alerts/src/nit_alert_model.dart';

class NitAlertsConfig {
  const NitAlertsConfig({
    this.project,
    this.environment,
    this.platform,
  });

  final String? project;
  final String? environment;
  final String? platform;

  NitAlertModel prepareAlert({
    String? type,
    String? text,
    Map<String, String>? state,
    Object? error,
    StackTrace? stacktrace,
  }) {
    return NitAlertModel(
      project: project,
      environment: environment,
      platform: platform,
      type: type,
      text: text,
      state: state,
      error: error?.toString(),
      stacktrace: stacktrace.toString(),
    );
  }
}
