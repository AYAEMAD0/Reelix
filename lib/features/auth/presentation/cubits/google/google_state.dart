part of 'google_cubit.dart';

sealed class GoogleState {}

final class GoogleInitial extends GoogleState {}

class GoogleLoading extends GoogleState {}

class GoogleSuccess extends GoogleState {}

class GoogleFailure extends GoogleState {
  final String message;
  GoogleFailure(this.message);
}
