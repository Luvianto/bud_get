enum Environment { development, staging, production }

abstract class AppEnv {
  static Environment _env = Environment.development;

  static void initialize(Environment env) {
    AppEnv._env = env;
  }

  static String get appTitle => _env._appTitle;
}

extension _EnvConfig on Environment {
  static const _appTitles = {
    Environment.development: 'BudGet Dev',
    Environment.staging: 'BudGet Staging',
    Environment.production: 'BudGet',
  };

  String get _appTitle => _appTitles[this]!;
}
