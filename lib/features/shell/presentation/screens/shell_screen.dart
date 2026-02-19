import 'package:currency/core/widgets/custom_safe_area.dart';
import 'package:currency/features/home/presentation/screens/home_screen.dart';
import 'package:currency/features/search/presentation/screens/search_screen.dart';
import 'package:currency/features/settings/presentation/screens/settings_screen.dart';
import 'package:currency/features/shell/presentation/cubit/shell_cubit/shell_cubit.dart';
import 'package:currency/features/shell/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShellScreen extends StatelessWidget {
  const ShellScreen({super.key});
  final List<Widget> screens = const [
    HomeScreen(),
    SearchScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: IndexedStack(
            index: context.watch<ShellCubit>().state,
            children: screens,
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }
}
