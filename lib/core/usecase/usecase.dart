import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:konmari/core/failure/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<AppFailure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
