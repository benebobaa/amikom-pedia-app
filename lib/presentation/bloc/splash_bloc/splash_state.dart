

import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashLoaded extends SplashState {
  final Position result;

  const SplashLoaded({required this.result});

  @override
  List<Object> get props => [result];
}

class SplashLocationDenied extends SplashState {}

