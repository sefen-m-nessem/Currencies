// import 'package:country_flags/country_flags.dart';
// import 'package:currency/core/widgets/custom_elevated_button.dart';
// import 'package:currency/features/home/presentation/cubit/currency_cubit.dart';
// import 'package:currency/features/home/presentation/cubit/currency_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});

//   final TextEditingController amountController =
//       TextEditingController();

//   final Map<String, String> currencyFlags = {
//     'USD': 'US',
//     'EGP': 'EG',
//     'EUR': 'EU',
//     'JPY': 'JP',
//     'CNY': 'CN',
//     'SAR': 'SA',
//     'AED': 'AE',
//     'KWD': 'KW',
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Currency Converter"),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: BlocBuilder<CurrencyCubit, CurrencyState>(
//           builder: (context, state) {

//             /// current values
//             String from = 'USD';
//             String to = 'EGP';

//             if (state is CurrencyInitialState) {
//               from = state.from;
//               to = state.to;
//             } else if (state is CurrencySuccessState) {
//               from = state.from;
//               to = state.to;
//             }

//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [

//                 /// FROM & TO DROPDOWN
//                 Row(
//                   children: [
//                     Expanded(
//                       child: DropdownButtonFormField<String>(
//                         value: from,
//                         items: currencies.map((currency) {
//                           return DropdownMenuItem(
//                             value: currency,
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   width: 30,
//                                   height: 20,
//                                   child: CountryFlag.fromCountryCode(
//                                     currencyFlags[currency]!,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 10),
//                                 Text(currency),
//                               ],
//                             ),
//                           );
//                         }).toList(),
//                         onChanged: (value) {
//                           context
//                               .read<CurrencyCubit>()
//                               .changeFrom(value!);
//                         },
//                         decoration:
//                             const InputDecoration(labelText: "From"),
//                       ),
//                     ),
//                     const SizedBox(width: 20),
//                     Expanded(
//                       child: DropdownButtonFormField<String>(
//                         value: to,
//                         items: currencies.map((currency) {
//                           return DropdownMenuItem(
//                             value: currency,
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   width: 30,
//                                   height: 20,
//                                   child: CountryFlag.fromCountryCode(
//                                     currencyFlags[currency]!,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 10),
//                                 Text(currency),
//                               ],
//                             ),
//                           );
//                         }).toList(),
//                         onChanged: (value) {
//                           context
//                               .read<CurrencyCubit>()
//                               .changeTo(value!);
//                         },
//                         decoration:
//                             const InputDecoration(labelText: "To"),
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 20),

//                 /// AMOUNT
//                 TextField(
//                   controller: amountController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                     labelText: "Amount",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 /// BUTTON
//                 CustomElevatedButton(
//                   onPressed: () {
//                     if (amountController.text.isEmpty) return;

//                     context.read<CurrencyCubit>().getConvAmount(
//                           amount:
//                               num.parse(amountController.text),
//                         );
//                   },
//                   text: "Convert",
//                   color: Colors.blue,
//                 ),

//                 const SizedBox(height: 30),

//                 /// RESULT AREA
//                 if (state is CurrencyLoadingState)
//                   const CircularProgressIndicator(),

//                 if (state is CurrencySuccessState)
//                   Text(
//                     "${amountController.text} ${state.from} = "
//                     "${state.currencyModel.result.toStringAsFixed(2)} ${state.to}",
//                     style: const TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),

//                 if (state is CurrencyErrorState)
//                   Text(
//                     state.error,
//                     style: const TextStyle(color: Colors.red),
//                   ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'package:currency/core/widgets/custom_elevated_button.dart';
// import 'package:currency/features/home/presentation/cubit/currency_cubit.dart';
// import 'package:currency/features/home/presentation/cubit/currency_state.dart';
// import 'package:currency/features/home/presentation/widgets/custom_dropdown.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),

//         child: Column(
//           children: [
//             SizedBox(height: 70),
//             Row(
//               children: [
//                 Expanded(
//                   child: CustomDropdownButtonFormField(
//                     initialValue: 'USD',
//                     onChange: (value) {
//                       context.read<CurrencyCubit>().changeFrom(value);
//                     },
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Expanded(
//                   child: CustomDropdownButtonFormField(
//                     initialValue: 'EGP',
//                     onChange: (value) {
//                       context.read<CurrencyCubit>().changeTo(value);
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             TextField(
//               decoration: InputDecoration(hintText: '1'),
//               onChanged: (value) {
//                 context.read<CurrencyCubit>().changeAmount(value);
//               },
//             ),
//             BlocBuilder<CurrencyCubit, CurrencyState>(
//               builder: (context, state) {
//                 if (state is CurrencyLoadingState) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (state is CurrencySuccessState) {
//                   return Text(
//                     "${state.amount} ${state.from} = "
//                     "${state.currencyModel.result.toStringAsFixed(2)} ${state.to}",
//                   );
//                 } else if (state is CurrencyErrorState) {
//                   return Text(state.error);
//                 }

//                 return const SizedBox();
//               },
//             ),

//             CustomElevatedButton(
//               onPressed: () {
//                 context.read<CurrencyCubit>().getConvAmount();
//               },
//               text: 'Convert',
//               color: Colors.blue,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
