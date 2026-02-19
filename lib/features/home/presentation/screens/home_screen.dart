import 'package:currency/core/widgets/section_text.dart';
import 'package:currency/features/home/presentation/widgets/explore_section.dart';
import 'package:currency/features/home/presentation/widgets/extchange_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionText(text: 'Directions'),
        ExtchangeSection(),
        SectionText(text: 'Explore'),
        Expanded(child: ExploreSection()),
      ],
    );
  }
}
