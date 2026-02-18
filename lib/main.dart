import 'package:currency/core/constants/app_colors.dart';
import 'package:currency/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:currency/core/networking/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DioHelper.init();

  runApp(Currency());
}

class Currency extends StatelessWidget {
  const Currency({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.goRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.grey,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
