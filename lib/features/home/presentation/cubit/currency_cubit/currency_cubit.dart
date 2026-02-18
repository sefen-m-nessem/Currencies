import 'package:currency/features/home/data/repo/currency_repo.dart';
import 'package:currency/features/home/presentation/cubit/currency_cubit/currency_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit(this.currencyRepo) : super(CurrencyInitial());
  final CurrencyRepo currencyRepo;
  Future<void> getCurrencies() async {
    emit(CurrencyLoading());
    final res = await currencyRepo.getCurrencies();
    res.fold(
      (error) {
        emit(CurrencyError(error.toString()));
      },
      (currencies) {
        emit(CurrencySuccess(currencies));
      },
    );
  }
}
