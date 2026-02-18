import 'package:currency/features/home/presentation/cubit/currency_cubit/currency_cubit.dart';
import 'package:currency/features/home/presentation/cubit/currency_cubit/currency_state.dart';
import 'package:currency/features/home/presentation/widgets/explore_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreSection extends StatelessWidget {
  const ExploreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyCubit, CurrencyState>(
      builder: (context, state) {
        if (state is CurrencyLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CurrencyError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (state is CurrencySuccess) {
          final currencies = state.currencies;

          return ListView.builder(
            itemCount: currencies.length,
            itemBuilder: (context, index) {
              final currency = currencies[index];

              return ExploreCard(currency: currency);
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
