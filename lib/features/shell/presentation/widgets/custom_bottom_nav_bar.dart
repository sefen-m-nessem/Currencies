import 'package:currency/features/shell/presentation/cubit/shell_cubit/shell_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShellCubit, int>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state,
          onTap: (value) => context.read<ShellCubit>().getIndex(value),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        );
      },
    );
  }
}
