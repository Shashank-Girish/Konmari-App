import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:konmari/core/failure/failure.dart';
import 'package:konmari/features/login/domain/entities/login_info.dart';
import 'package:konmari/features/login/domain/entities/user_info.dart';

abstract class SignInRepository {
  Future<Either<AppFailure, User?>> signInEmail(LoginInfo auth);
  Future<Either<AppFailure, User?>> signInGmail();
  Future<Either<AppFailure, User?>> signInGuest();
  Future<Either<AppFailure, User?>> registerUser(NewUserInfo user);
  Future<Either<AppFailure, void>> signOut();
}
