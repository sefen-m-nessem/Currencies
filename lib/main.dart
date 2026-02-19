import 'package:currency/core/constants/app_colors.dart';
import 'package:currency/core/routing/app_router.dart';
import 'package:currency/core/themes/app_themes.dart';
import 'package:currency/features/settings/presentation/cubit/theme_cubit/theme_cubit.dart';
import 'package:currency/features/settings/presentation/cubit/theme_cubit/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:currency/core/networking/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DioHelper.init();

  runApp(Currency());
}

class Currency extends StatelessWidget {
  const Currency({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.goRoute,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: state.themeMode,
          );
        },
      ),
    );
  }
}
