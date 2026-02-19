import 'package:currency/core/routing/app_routes.dart';
import 'package:currency/features/home/data/repo/currency_repo.dart';
import 'package:currency/features/home/presentation/cubit/currency_cubit/currency_cubit.dart';
import 'package:currency/features/home/presentation/cubit/exchange_cubit/exchange_cubit.dart';
import 'package:currency/features/shell/presentation/cubit/shell_cubit/shell_cubit.dart';
import 'package:currency/features/shell/presentation/screens/shell_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final goRoute = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.shellScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ShellCubit()),
            BlocProvider(create: (context) => ExchangeCubit(CurrencyRepo())),
            BlocProvider(
              create: (context) =>
                  CurrencyCubit(CurrencyRepo())..getCurrencies(),
            ),
          ],
          child: ShellScreen(),
        ),
      ),
    ],
  );
}
