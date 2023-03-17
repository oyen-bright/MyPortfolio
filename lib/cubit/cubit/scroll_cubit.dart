import 'package:bloc/bloc.dart';

part 'scroll_state.dart';

class ScrollCubit extends Cubit<ScrollState> {
  ScrollCubit() : super(const ScrollState(scrollOffset: 0));

  void changeScrollOffset(double newOffset) {
    emit(ScrollState(scrollOffset: newOffset));
  }
}
