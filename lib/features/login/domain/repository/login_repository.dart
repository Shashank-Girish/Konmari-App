import 'package:dartz/dartz.dart';
import 'package:konmari/core/failure/failure.dart';
import 'package:konmari/features/login/domain/entities/login_info.dart';

abstract class SignInRepository{
  Future<Either<AppFailure , void>>signInEmail(LoginInfo auth);
  Future<Either<AppFailure , void>> signInGmail();
  Future<Either<AppFailure , void>> signInGuest();
  Future<Either<AppFailure , void>> registerUser();
  Future<Either<AppFailure , void>> signOut();
}