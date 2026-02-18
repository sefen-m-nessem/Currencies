import 'package:currency/features/home/data/model/currency_model.dart';

abstract class CurrencyState {}

class CurrencyInitial extends CurrencyState {}

class CurrencyLoading extends CurrencyState {}

class CurrencySuccess extends CurrencyState {
  final List<CurrencyModel> currencies;

  CurrencySuccess(this.currencies);
}

class CurrencyError extends CurrencyState {
  final String message;

  CurrencyError(this.message);
}
