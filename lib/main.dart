import 'package:flutter/material.dart';
import 'package:jombang/pages/app_navigation.dart';
// import 'package:jombang/pages/login_page.dart';

// void main() => runApp(
//       const GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: LoginPage(),
//       ),
//     );

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppNavigation.router,
    );
  }
}
