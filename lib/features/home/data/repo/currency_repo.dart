import 'package:currency/core/networking/api_const.dart';
import 'package:currency/core/networking/dio_helper.dart';
import 'package:currency/features/home/data/model/currency_model.dart';
import 'package:currency/features/home/data/model/exchange_model.dart';
import 'package:dartz/dartz.dart';

class CurrencyRepo {
  Future<Either<String, CurrencyConversionModel>> getConvAmount({
    required String from,
    required String to,
    required num amount,
  }) async {
    try {
      final res = await DioHelper.getExchangeCurrency(
        endPoint: ApiConst.compairEndPoint(from: from, to: to, amount: amount),
      );

      final model = CurrencyConversionModel.fromJson(res.data);

      return Right(model);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<CurrencyModel>>> getCurrencies() async {
    try {
      final response = await DioHelper.getCurrencies();

      final data = response.data as Map<String, dynamic>;

      final rates = data['rates'] as Map<String, dynamic>;
      final info = ApiConst.supportedCurrencies;

      List<CurrencyModel> currencies = [];

      rates.forEach((code, price) {
        if (info.containsKey(code)) {
          final currencyInfo = info[code];

          currencies.add(
            CurrencyModel(
              code: code,
              name: currencyInfo['currencyName'] ?? code,
              icon: currencyInfo['icon'],
              country: currencyInfo['countryName'] ?? '',
              price: 1 / double.parse(price.toString()),
            ),
          );
        }
      });

      return Right(currencies);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
