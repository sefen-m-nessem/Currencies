import 'package:currency/features/home/data/model/exchange_model.dart';

abstract class ExchangeState {}

class ExchangeInitialState extends ExchangeState {
  final String from;
  final String to;

  ExchangeInitialState({this.from = 'USD', this.to = 'EGP'});
}

class ExchangeLoadingState extends ExchangeState {}

class ExchangeSuccessState extends ExchangeState {
  final CurrencyConversionModel currencyModel;
  final String from;
  final String to;
  final String amount;
  ExchangeSuccessState(this.currencyModel, this.from, this.to, this.amount);
}

class ExchangeErrorState extends ExchangeState {
  final String error;

  ExchangeErrorState(this.error);
}
