import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

const customcolor3 = Color(0xFF3B41F0);
const customcolor5 = Color(0xFF16086F);
const customcolor6 = Color(0xFFEB7D72);
const customcolor7 = Color(0xFF9882DB);

CustomColors lightCustomColors = CustomColors(
  sourceCustomcolor3: Color(0xFF3B41F0),
  customcolor3: Color(0xFF3C42F1),
  onCustomcolor3: Color(0xFFFFFFFF),
  customcolor3Container: Color(0xFFE0E0FF),
  onCustomcolor3Container: Color(0xFF02006D),
  sourceCustomcolor5: Color(0xFF16086F),
  customcolor5: Color(0xFF5753AF),
  onCustomcolor5: Color(0xFFFFFFFF),
  customcolor5Container: Color(0xFFE3DFFF),
  onCustomcolor5Container: Color(0xFF100069),
  sourceCustomcolor6: Color(0xFFEB7D72),
  customcolor6: Color(0xFF9D4139),
  onCustomcolor6: Color(0xFFFFFFFF),
  customcolor6Container: Color(0xFFFFDAD6),
  onCustomcolor6Container: Color(0xFF410002),
  sourceCustomcolor7: Color(0xFF9882DB),
  customcolor7: Color(0xFF6550A5),
  onCustomcolor7: Color(0xFFFFFFFF),
  customcolor7Container: Color(0xFFE8DDFF),
  onCustomcolor7Container: Color(0xFF21005E),
);

CustomColors darkCustomColors = CustomColors(
  sourceCustomcolor3: Color(0xFF3B41F0),
  customcolor3: Color(0xFFBFC2FF),
  onCustomcolor3: Color(0xFF0500AB),
  customcolor3Container: Color(0xFF1C1DDB),
  onCustomcolor3Container: Color(0xFFE0E0FF),
  sourceCustomcolor5: Color(0xFF16086F),
  customcolor5: Color(0xFFC3C0FF),
  onCustomcolor5: Color(0xFF27207E),
  customcolor5Container: Color(0xFF3F3A95),
  onCustomcolor5Container: Color(0xFFE3DFFF),
  sourceCustomcolor6: Color(0xFFEB7D72),
  customcolor6: Color(0xFFFFB4AB),
  onCustomcolor6: Color(0xFF601410),
  customcolor6Container: Color(0xFF7E2A24),
  onCustomcolor6Container: Color(0xFFFFDAD6),
  sourceCustomcolor7: Color(0xFF9882DB),
  customcolor7: Color(0xFFCEBDFF),
  onCustomcolor7: Color(0xFF361E73),
  customcolor7Container: Color(0xFF4D378B),
  onCustomcolor7Container: Color(0xFFE8DDFF),
);

/// Defines a set of custom colors, each comprised of 4 complementary tones.
///
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourceCustomcolor3,
    required this.customcolor3,
    required this.onCustomcolor3,
    required this.customcolor3Container,
    required this.onCustomcolor3Container,
    required this.sourceCustomcolor5,
    required this.customcolor5,
    required this.onCustomcolor5,
    required this.customcolor5Container,
    required this.onCustomcolor5Container,
    required this.sourceCustomcolor6,
    required this.customcolor6,
    required this.onCustomcolor6,
    required this.customcolor6Container,
    required this.onCustomcolor6Container,
    required this.sourceCustomcolor7,
    required this.customcolor7,
    required this.onCustomcolor7,
    required this.customcolor7Container,
    required this.onCustomcolor7Container,
  });

  final Color? sourceCustomcolor3;
  final Color? customcolor3;
  final Color? onCustomcolor3;
  final Color? customcolor3Container;
  final Color? onCustomcolor3Container;
  final Color? sourceCustomcolor5;
  final Color? customcolor5;
  final Color? onCustomcolor5;
  final Color? customcolor5Container;
  final Color? onCustomcolor5Container;
  final Color? sourceCustomcolor6;
  final Color? customcolor6;
  final Color? onCustomcolor6;
  final Color? customcolor6Container;
  final Color? onCustomcolor6Container;
  final Color? sourceCustomcolor7;
  final Color? customcolor7;
  final Color? onCustomcolor7;
  final Color? customcolor7Container;
  final Color? onCustomcolor7Container;

  @override
  CustomColors copyWith({
    Color? sourceCustomcolor3,
    Color? customcolor3,
    Color? onCustomcolor3,
    Color? customcolor3Container,
    Color? onCustomcolor3Container,
    Color? sourceCustomcolor5,
    Color? customcolor5,
    Color? onCustomcolor5,
    Color? customcolor5Container,
    Color? onCustomcolor5Container,
    Color? sourceCustomcolor6,
    Color? customcolor6,
    Color? onCustomcolor6,
    Color? customcolor6Container,
    Color? onCustomcolor6Container,
    Color? sourceCustomcolor7,
    Color? customcolor7,
    Color? onCustomcolor7,
    Color? customcolor7Container,
    Color? onCustomcolor7Container,
  }) {
    return CustomColors(
      sourceCustomcolor3: sourceCustomcolor3 ?? this.sourceCustomcolor3,
      customcolor3: customcolor3 ?? this.customcolor3,
      onCustomcolor3: onCustomcolor3 ?? this.onCustomcolor3,
      customcolor3Container:
          customcolor3Container ?? this.customcolor3Container,
      onCustomcolor3Container:
          onCustomcolor3Container ?? this.onCustomcolor3Container,
      sourceCustomcolor5: sourceCustomcolor5 ?? this.sourceCustomcolor5,
      customcolor5: customcolor5 ?? this.customcolor5,
      onCustomcolor5: onCustomcolor5 ?? this.onCustomcolor5,
      customcolor5Container:
          customcolor5Container ?? this.customcolor5Container,
      onCustomcolor5Container:
          onCustomcolor5Container ?? this.onCustomcolor5Container,
      sourceCustomcolor6: sourceCustomcolor6 ?? this.sourceCustomcolor6,
      customcolor6: customcolor6 ?? this.customcolor6,
      onCustomcolor6: onCustomcolor6 ?? this.onCustomcolor6,
      customcolor6Container:
          customcolor6Container ?? this.customcolor6Container,
      onCustomcolor6Container:
          onCustomcolor6Container ?? this.onCustomcolor6Container,
      sourceCustomcolor7: sourceCustomcolor5 ?? this.sourceCustomcolor5,
      customcolor7: customcolor5 ?? this.customcolor5,
      onCustomcolor7: onCustomcolor5 ?? this.onCustomcolor5,
      customcolor7Container:
          customcolor5Container ?? this.customcolor5Container,
      onCustomcolor7Container:
          onCustomcolor5Container ?? this.onCustomcolor5Container,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceCustomcolor3:
          Color.lerp(sourceCustomcolor3, other.sourceCustomcolor3, t),
      customcolor3: Color.lerp(customcolor3, other.customcolor3, t),
      onCustomcolor3: Color.lerp(onCustomcolor3, other.onCustomcolor3, t),
      customcolor3Container:
          Color.lerp(customcolor3Container, other.customcolor3Container, t),
      onCustomcolor3Container:
          Color.lerp(onCustomcolor3Container, other.onCustomcolor3Container, t),
      sourceCustomcolor5:
          Color.lerp(sourceCustomcolor5, other.sourceCustomcolor5, t),
      customcolor5: Color.lerp(customcolor5, other.customcolor5, t),
      onCustomcolor5: Color.lerp(onCustomcolor5, other.onCustomcolor5, t),
      customcolor5Container:
          Color.lerp(customcolor5Container, other.customcolor5Container, t),
      onCustomcolor5Container:
          Color.lerp(onCustomcolor5Container, other.onCustomcolor5Container, t),
      sourceCustomcolor6:
          Color.lerp(sourceCustomcolor6, other.sourceCustomcolor6, t),
      customcolor6: Color.lerp(customcolor6, other.customcolor6, t),
      onCustomcolor6: Color.lerp(onCustomcolor6, other.onCustomcolor6, t),
      customcolor6Container:
          Color.lerp(customcolor6Container, other.customcolor6Container, t),
      onCustomcolor6Container:
          Color.lerp(onCustomcolor6Container, other.onCustomcolor6Container, t),
      sourceCustomcolor7:
          Color.lerp(sourceCustomcolor5, other.sourceCustomcolor5, t),
      customcolor7: Color.lerp(customcolor5, other.customcolor5, t),
      onCustomcolor7: Color.lerp(onCustomcolor5, other.onCustomcolor5, t),
      customcolor7Container:
          Color.lerp(customcolor5Container, other.customcolor5Container, t),
      onCustomcolor7Container:
          Color.lerp(onCustomcolor5Container, other.onCustomcolor5Container, t),
    );
  }

  /// Returns an instance of [CustomColors] in which the following custom
  /// colors are harmonized with [dynamic]'s [ColorScheme.primary].
  ///   * [CustomColors.sourceCustomcolor3]
  ///   * [CustomColors.customcolor3]
  ///   * [CustomColors.onCustomcolor3]
  ///   * [CustomColors.customcolor3Container]
  ///   * [CustomColors.onCustomcolor3Container]
  ///   * [CustomColors.sourceCustomcolor5]
  ///   * [CustomColors.customcolor5]
  ///   * [CustomColors.onCustomcolor5]
  ///   * [CustomColors.customcolor5Container]
  ///   * [CustomColors.onCustomcolor5Container]
  ///   * [CustomColors.sourceCustomcolor6]
  ///   * [CustomColors.customcolor6]
  ///   * [CustomColors.onCustomcolor6]
  ///   * [CustomColors.customcolor6Container]
  ///   * [CustomColors.onCustomcolor6Container]
  ///   * [CustomColors.sourceCustomcolor5]
  ///   * [CustomColors.customcolor5]
  ///   * [CustomColors.onCustomcolor5]
  ///   * [CustomColors.customcolor5Container]
  ///   * [CustomColors.onCustomcolor5Container]
  ///
  /// See also:
  ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization>
  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith(
      sourceCustomcolor3: sourceCustomcolor3!.harmonizeWith(dynamic.primary),
      customcolor3: customcolor3!.harmonizeWith(dynamic.primary),
      onCustomcolor3: onCustomcolor3!.harmonizeWith(dynamic.primary),
      customcolor3Container:
          customcolor3Container!.harmonizeWith(dynamic.primary),
      onCustomcolor3Container:
          onCustomcolor3Container!.harmonizeWith(dynamic.primary),
      sourceCustomcolor5: sourceCustomcolor5!.harmonizeWith(dynamic.primary),
      customcolor5: customcolor5!.harmonizeWith(dynamic.primary),
      onCustomcolor5: onCustomcolor5!.harmonizeWith(dynamic.primary),
      customcolor5Container:
          customcolor5Container!.harmonizeWith(dynamic.primary),
      onCustomcolor5Container:
          onCustomcolor5Container!.harmonizeWith(dynamic.primary),
      sourceCustomcolor6: sourceCustomcolor6!.harmonizeWith(dynamic.primary),
      customcolor6: customcolor6!.harmonizeWith(dynamic.primary),
      onCustomcolor6: onCustomcolor6!.harmonizeWith(dynamic.primary),
      customcolor6Container:
          customcolor6Container!.harmonizeWith(dynamic.primary),
      onCustomcolor6Container:
          onCustomcolor6Container!.harmonizeWith(dynamic.primary),
      sourceCustomcolor7: sourceCustomcolor5!.harmonizeWith(dynamic.primary),
      customcolor7: customcolor5!.harmonizeWith(dynamic.primary),
      onCustomcolor7: onCustomcolor5!.harmonizeWith(dynamic.primary),
      customcolor7Container:
          customcolor5Container!.harmonizeWith(dynamic.primary),
      onCustomcolor7Container:
          onCustomcolor5Container!.harmonizeWith(dynamic.primary),
    );
  }
}
