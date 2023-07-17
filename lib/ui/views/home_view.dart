import 'dart:math';

import 'package:flutter/material.dart';

/// The HomeView class represents the main view of the application.
class HomeView extends StatefulWidget {
  /// Creates a new instance of HomeView.
  /// The `key` parameter is used to provide a unique identifier for the
  /// widget, which can be useful for managing the widget
  /// lifecycle, state preservation, and efficient widget updates.
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Color viewBackgroundColor = Colors.white;
  static const double fontSize = 22;
  static const text = "Hello there";
  static const luminanceBreckPoint = 0.5;
  static const luminanceMax = 255;
  static const int colorToStart = 0xFFFFFF;

  /// Changes the background color of the view to a randomly generated color.
  ///
  /// The `changeViewBackgroundColor` function generates a random color
  /// using the `Random` class and sets it as the new
  /// background color of the view. It uses the `setState` method to update
  /// the view and trigger a rebuild, ensuring that
  /// the UI reflects the new background color.
  ///
  /// Example Usage:
  ///
  /// ```dart
  /// changeViewBackgroundColor();
  /// ```
  void changeViewBackgroundColor() {
    setState(() {
      viewBackgroundColor = Color(
        (Random().nextDouble() * colorToStart).toInt(),
      ).withOpacity(1.0);
    });
  }

  /// Calculates the appropriate text color for a given background color.
  ///
  /// The `getTextColor` function analyzes the luminance of the provided
  /// `color` and determines whether to return a light or dark
  /// text color that will provide good contrast against the background. It
  /// uses a luminance threshold to determine the switch
  /// point between light and dark colors.
  ///
  /// Parameters:
  /// - [color]: The background color to calculate the text color for.
  ///
  /// Returns:
  /// The calculated text color that provides good contrast against the
  /// background color.
  ///
  /// Example Usage:
  ///
  /// ```dart
  /// final backgroundColor = Colors.blue;
  /// final textColor = getTextColor(backgroundColor);
  /// ```
  Color getTextColor(Color color) {
    int d = 0;
    final luminance =
        (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;
    d = luminance > luminanceBreckPoint ? 0 : luminanceMax;

    return Color.fromARGB(
      color.alpha,
      d,
      d,
      d,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: viewBackgroundColor,
      body: InkWell(
        onTap: () => changeViewBackgroundColor(),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: getTextColor(viewBackgroundColor),
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
