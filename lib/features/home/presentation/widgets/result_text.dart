import 'package:currency/features/home/presentation/cubit/exchange_cubit/exchange_cubit.dart';
import 'package:currency/features/home/presentation/cubit/exchange_cubit/exchange_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultText extends StatelessWidget {
  const ResultText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: BlocBuilder<ExchangeCubit, ExchangeState>(
        builder: (context, state) {
          if (state is ExchangeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ExchangeSuccessState) {
            return Text(
              "${state.amount} ${state.from} = "
              "${state.currencyModel.result.toStringAsFixed(2)} ${state.to}",
            );
          } else if (state is ExchangeErrorState) {
            return Text(state.error);
          }

          return const SizedBox();
        },
      ),
    );
  }
}
