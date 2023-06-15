import 'package:bloc/bloc.dart';

part 'custom_bottm_navigation_state.dart';

class CustomBottmNavigationCubit extends Cubit<CustomBottmNavigationState> {
  CustomBottmNavigationCubit() : super(CustomBottmNavigationInitial());
  void selectNavigationItem(int index) {
    //controll the bottom navigation bar and home screen pages
    return emit(CustomBottmNavigationState(selectedIndex: index));
  }
}
