

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:amikompedia_app/core/error/failure.dart';

abstract class SplashRepository{
  Future<Either<Failure,Position>> getCurrentLocation();
}