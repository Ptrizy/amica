import 'package:amica/view/provider/auth_provider.dart';
import 'package:amica/view/provider/pet_provider.dart';
import 'package:amica/view/routes/route.dart';
import 'package:amica/view/routes/route_path.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => PetProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'amica',
          debugShowCheckedModeBanner: false,
          initialRoute: RoutePath.initialRoute,
          routes: amicaRoutes,
        );
      },
    );
  }
}
