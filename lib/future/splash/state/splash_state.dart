part of 'splash_cubit.dart';

sealed class SplashState extends Equatable {
  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashLoaded extends SplashState {
  SplashLoaded({required this.version});
  final bool version;

  @override
  List<Object> get props => [version];
}

class SplashError extends SplashState {
  SplashError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
