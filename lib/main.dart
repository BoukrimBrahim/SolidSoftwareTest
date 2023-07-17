import 'package:flutter/material.dart';
import 'package:solidsoftwaretest/ui/views/home_view.dart';

void main() {
  runApp(const Main());
}

/// The Main class serves as the entry point of the application.
class Main extends StatelessWidget {
  /// Constructs a new instance of Main.
  const Main({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solid Software',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
