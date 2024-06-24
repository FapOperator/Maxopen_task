part of 'bottom_bar_bloc.dart';

@immutable
sealed class BottomBarEvent {}

class TabChange extends BottomBarEvent {
  final int tabIndex;

  TabChange({required this.tabIndex});
}
