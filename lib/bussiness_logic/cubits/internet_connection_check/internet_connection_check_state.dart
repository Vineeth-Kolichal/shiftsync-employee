part of 'internet_connection_check_cubit.dart';

@immutable
abstract class InternetConnectionCheckState {}

class InternetConnectionCheckLoading extends InternetConnectionCheckState {}

class InternetConnected extends InternetConnectionCheckState {}

class InternetDisconnected extends InternetConnectionCheckState {}
