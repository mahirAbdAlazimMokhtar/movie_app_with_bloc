//create abstract class for BaseUseCase

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_with_bloc/core/error/failures.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<Either<Failure,T>> call(Parameters parameters);
}

class NoParameters extends Equatable {
  @override
  
  List<Object?> get props =>  [];

  
}