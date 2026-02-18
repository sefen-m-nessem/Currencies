import 'package:currency/core/widgets/custom_container.dart';
import 'package:currency/features/home/data/model/currency_model.dart';
import 'package:flutter/material.dart';

class ExploreCard extends StatelessWidget {
  const ExploreCard({super.key, required this.currency});

  final CurrencyModel currency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: CustomContainer(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Image.network(currency.icon, width: 45),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currency.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(currency.country),
              ],
            ),
            Spacer(),
            Text(
              '${currency.price.toStringAsFixed(2)} \$',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
