import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'bottom_bar_event.dart';
part 'bottom_bar_state.dart';

class BottomBarBloc extends Bloc<BottomBarEvent, BottomBarState> {
  BottomBarBloc() : super(const BottomBarInitial(tabIndex: 0)) {
    on<BottomBarEvent>((event, emit) {
      if (event is TabChange) {
        emit(BottomBarInitial(tabIndex: event.tabIndex));
      }
    });
  }
}
