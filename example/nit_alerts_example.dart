import 'package:nit_alerts/nit_alerts.dart';
import 'package:nit_alerts/src/nit_alerts_config.dart';

import 'env.dart';

void main() {
  NitAlertsManager.init(
    alertsEndpoint: nitAlertsEndpoint,
    config: NitAlertsConfig(
      project: 'nit_alerts',
      environment: 'test',
      platform: 'test',
    ),
  );

  print("init finished");

  NitAlertsManager.reportError(
    text: 'Test',
    state: {
      'user': '1',
    },
    error: UnimplementedError('Test error'),
    stacktrace: StackTrace.current,
  );
}
