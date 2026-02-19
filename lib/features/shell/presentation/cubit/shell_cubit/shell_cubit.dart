import 'package:flutter_bloc/flutter_bloc.dart';

class ShellCubit extends Cubit<int> {
  ShellCubit() : super(0);

  void getIndex(int index) {
    emit(index);
  }
}
