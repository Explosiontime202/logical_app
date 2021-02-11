enum AppColorMode { DARK, LIGHT }

extension AppColorModeExtension on AppColorMode {
  AppColorMode get other => this == AppColorMode.DARK ? AppColorMode.LIGHT : AppColorMode.DARK;
}
