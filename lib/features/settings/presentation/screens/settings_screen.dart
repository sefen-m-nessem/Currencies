import 'package:currency/core/widgets/section_text.dart';
import 'package:currency/features/settings/presentation/cubit/theme_cubit/theme_cubit.dart';
import 'package:currency/features/settings/presentation/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionText(text: 'Appearance'),
        CustomListTile(
          title: 'Theme Mode',
          onTap: () {
            final cubit = context.read<ThemeCubit>();
            final isDark = cubit.state.themeMode == ThemeMode.dark;
            cubit.toggleTheme(!isDark);
          },
          trailing: Transform.scale(
            scale: 0.7,
            child: Switch(
              value:
                  context.watch<ThemeCubit>().state.themeMode == ThemeMode.dark,
              onChanged: (value) {
                context.read<ThemeCubit>().toggleTheme(value);
              },
            ),
          ),
        ),

        SectionText(text: 'Preferences'),
        CustomListTile(title: 'Default Currency'),
        CustomListTile(title: 'Default Market'),
        SectionText(text: 'About'),
        CustomListTile(title: 'App Version'),
      ],
    );
  }
}
