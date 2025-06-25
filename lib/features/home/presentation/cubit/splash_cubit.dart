import 'package:flutter_bloc/flutter_bloc.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState(currentPage: 0));

  void nextPage(){
    if (state.currentPage < 4) {
      emit(SplashState(currentPage: state.currentPage + 1));
    }else{
      emit( SplashState(currentPage: 0));
    }
  }
}
