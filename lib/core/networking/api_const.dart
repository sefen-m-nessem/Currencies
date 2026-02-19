class ApiConst {
  static const String currencyBaseUrl = 'https://v6.exchangerate-api.com/v6/';
  static const String exploreBaseUrl = 'https://api.currencyfreaks.com/v2.0/';

  static const String currencyApiKey = '2df1ddd27ec4937e1978b646';
  static const String exploreApiKey = '7f5664db9e774343b20a9a7e1e2d80ef';

  static const String exploreSymbols = 'EUR,USD,EGP,BTC,XAU,XAG';

  static const String explorePricesEndPoint =
      'rates/latest?apikey=$exploreApiKey&symbols=$exploreSymbols';

  static String compairEndPoint({
    required String from,
    required String to,
    required num amount,
  }) {
    return '$currencyApiKey/pair/$from/$to/$amount';
  }

  static final Map<String, dynamic> supportedCurrencies = {
    "EGP": {
      "currencyCode": "EGP",
      "currencyName": "Egyptian Pound",
      "countryCode": "EG",
      "countryName": "Egypt",
      "status": "AVAILABLE",
      "availableFrom": "1985-01-28",
      "availableUntil": "2026-02-17",
      "icon": "https://currencyfreaks.com/photos/flags/egp.png",
    },
    "USD": {
      "currencyCode": "USD",
      "currencyName": "US Dollar",
      "countryCode": "US",
      "countryName": "United States",
      "status": "AVAILABLE",
      "availableFrom": "1985-01-28",
      "availableUntil": "2026-02-17",
      "icon": "https://currencyfreaks.com/photos/flags/usd.png",
    },

    "EUR": {
      "currencyCode": "EUR",
      "currencyName": "Euro",
      "countryCode": "EU",
      "countryName": "European Union",
      "status": "AVAILABLE",
      "availableFrom": "1999-01-01",
      "availableUntil": "2026-02-17",
      "icon": "https://currencyfreaks.com/photos/flags/eur.png",
    },

    "BTC": {
      "currencyCode": "BTC",
      "currencyName": "Bitcoin",
      "countryCode": "Crypto",
      "countryName": "Crypto",
      "status": "AVAILABLE",
      "availableFrom": "2014-08-11",
      "availableUntil": "2026-02-17",
      "icon": "https://currencyfreaks.com/photos/flags/btc.png",
    },

    "XAU": {
      "currencyCode": "XAU",
      "currencyName": "Gold (troy ounce)",
      "countryCode": "Metal",
      "countryName": "Global",
      "status": "AVAILABLE",
      "availableFrom": "2020-09-02",
      "availableUntil": "2026-02-17",
      "icon": "https://currencyfreaks.com/photos/flags/xau.png",
    },

    "XAG": {
      "currencyCode": "XAG",
      "currencyName": "Silver (troy ounce)",
      "countryCode": "Metal",
      "countryName": "Global",
      "status": "AVAILABLE",
      "availableFrom": "2020-09-02",
      "availableUntil": "2026-02-17",
      "icon": "https://currencyfreaks.com/photos/flags/xag.png",
    },
  };

  static String buildFinanceSearchUrl(String query) {
    final financeFilter =
        '$query AND (stock OR forex OR crypto OR finance OR economy OR market)';

    return 'https://newsdata.io/api/1/latest'
        '?apikey=YOUR_KEY'
        '&q=${Uri.encodeComponent(financeFilter)}'
        '&category=business'
        '&language=en'
        '&removeduplicate=1';
  }
}
