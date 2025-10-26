import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerPageSelected> {
  DrawerCubit() : super(const DrawerPageSelected(0));

  void selectPage(int index) {
    emit(DrawerPageSelected(index));
  }
}
