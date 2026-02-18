import 'package:currency/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropdownButtonFormField extends StatelessWidget {
  final void Function(String?) onChange;
  final String initialValue;
  final List<String> currencies = const [
    'USD',
    'EGP',
    'EUR',
    'JPY',
    'CNY',
    'SAR',
    'AED',
    'KWD',
  ];
  const CustomDropdownButtonFormField({
    super.key,
    required this.onChange,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      dropdownColor: AppColors.grey,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.grey,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      borderRadius: BorderRadius.circular(16),
      initialValue: initialValue,
      items: currencies.map((currency) {
        return DropdownMenuItem(value: currency, child: Text(currency));
      }).toList(),
      onChanged: onChange,
    );
  }
}
