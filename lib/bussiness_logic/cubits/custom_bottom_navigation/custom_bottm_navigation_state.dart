part of 'custom_bottm_navigation_cubit.dart';

class CustomBottmNavigationState {
  final int selectedIndex;

  CustomBottmNavigationState({required this.selectedIndex});
}

class CustomBottmNavigationInitial extends CustomBottmNavigationState {
  CustomBottmNavigationInitial() : super(selectedIndex: 0);
}
