import 'package:currency/core/widgets/custom_container.dart';
import 'package:currency/core/widgets/title_text.dart';
import 'package:currency/features/home/presentation/cubit/exchange_cubit/exchange_cubit.dart';
import 'package:currency/features/home/presentation/widgets/custom_dropdown.dart';
import 'package:currency/features/home/presentation/widgets/custom_text_field.dart';
import 'package:currency/features/home/presentation/widgets/result_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExtchangeSection extends StatelessWidget {
  const ExtchangeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(text: 'Exchange'),
          SizedBox(height: 15),

          Row(
            children: [
              Expanded(
                child: CustomDropdownButtonFormField(
                  onChange: (value) {
                    context.read<ExchangeCubit>().changeFrom(value);
                  },
                  initialValue: 'USD',
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: CustomDropdownButtonFormField(
                  onChange: (value) {
                    context.read<ExchangeCubit>().changeTo(value);
                  },
                  initialValue: 'EGP',
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          CustomTextField(
            onChange: (value) {
              context.read<ExchangeCubit>().changeAmount(value);
            },
          ),
          SizedBox(height: 15),
          ResultText(),
        ],
      ),
    );
  }
}
