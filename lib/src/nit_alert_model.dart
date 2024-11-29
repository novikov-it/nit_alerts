class NitAlertModel {
  const NitAlertModel({
    required this.project,
    required this.environment,
    required this.platform,
    required this.type,
    required this.text,
    required this.state,
    required this.error,
    required this.stacktrace,
  });

  final String? project;
  final String? environment;
  final String? platform;
  final String? type;
  final String? text;
  final Map<String, String>? state;
  final String? error;
  final String? stacktrace;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'project': project,
        'environment': environment,
        'platform': platform,
        'type': type,
        'text': text,
        'state': state,
        'error': error,
        'stacktrace': stacktrace,
      };
}
