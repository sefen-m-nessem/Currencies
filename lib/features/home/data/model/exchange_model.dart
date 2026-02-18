class CurrencyConversionModel {
  final String from;
  final String to;
  final double rate;
  final double result;

  CurrencyConversionModel({
    required this.from,
    required this.to,
    required this.rate,
    required this.result,
  });

  factory CurrencyConversionModel.fromJson(Map<String, dynamic> json) {
    return CurrencyConversionModel(
      from: json['base_code'],
      to: json['target_code'],
      rate: (json['conversion_rate'] as num).toDouble(),
      result: (json['conversion_result'] as num).toDouble(),
    );
  }
}
