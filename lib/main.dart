import 'package:flutter/material.dart';
import 'package:food_panda/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      theme: Provider.of<ThemeProvider>(context).themedata,
    );
  }
}
