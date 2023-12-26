import 'package:flutter/material.dart';

class ColorScreen extends StatelessWidget {
  final BuildContext context;
  static const String name = 'color-screen';

  const ColorScreen({Key? key, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    Map<String, Color> colors = {
      "primary": colorScheme.primary,
      "secondary": colorScheme.secondary,
      "background": colorScheme.background,
      "surface": colorScheme.surface,
      "error": colorScheme.error,
      "onPrimary": colorScheme.onPrimary,
      "onSecondary": colorScheme.onSecondary,
      "onBackground": colorScheme.onBackground,
      "onSurface": colorScheme.onSurface,
      "onError": colorScheme.onError,
      "onPrimaryContainer": colorScheme.onPrimaryContainer,
      "onSecondaryContainer": colorScheme.onSecondaryContainer,
      "onSurfaceVariant": colorScheme.onSurfaceVariant,
      "onTertiaryContainer": colorScheme.onTertiaryContainer,
      "onErrorContainer": colorScheme.onErrorContainer,
      "onInverseSurface": colorScheme.onInverseSurface,
      "secondaryContainer": colorScheme.secondaryContainer,
      "primaryContainer": colorScheme.primaryContainer,

      "brightness": colorScheme.brightness == Brightness.dark
          ? Colors.white
          : Colors.black,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Colores'),
      ),
      body: ListView(children: [
        ...colors.entries.map((e) => _buildColorList(e.key, e.value)),
      ]),
    );
  }

  Widget _buildColorList(String colorName, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            colorName,
            style: const TextStyle(
              color: Colors.deepOrangeAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
