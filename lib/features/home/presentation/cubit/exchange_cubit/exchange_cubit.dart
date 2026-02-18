import 'dart:async';
import 'dart:developer';

import 'package:currency/features/home/data/repo/currency_repo.dart';
import 'package:currency/features/home/presentation/cubit/exchange_cubit/exchange_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExchangeCubit extends Cubit<ExchangeState> {
  ExchangeCubit(this.currencyRepo) : super(ExchangeInitialState());
  final CurrencyRepo currencyRepo;

  String from = "USD";
  String to = 'EGP';
  num amount = 1;

  void changeFrom(value) {
    from = value;
    getConvAmount();
  }

  void changeTo(value) {
    to = value;
    getConvAmount();
  }

  void changeAmount(String value) {
    if (value.isEmpty) {
      amount = 1;
      return;
    }

    final parsed = num.tryParse(value);
    if (parsed != null) {
      amount = parsed;
    }
    Future.delayed(Duration(milliseconds: 500), () {
      getConvAmount();
    });
  }

  Future<void> getConvAmount() async {
    emit(ExchangeLoadingState());
    final res = await currencyRepo.getConvAmount(
      from: from,
      to: to,
      amount: amount,
    );
    res.fold(
      (error) {
        emit(ExchangeErrorState(error));
      },
      (currencyModel) {
        log(currencyModel.result.toString());

        emit(ExchangeSuccessState(currencyModel, from, to, amount.toString()));
      },
    );
  }
}
