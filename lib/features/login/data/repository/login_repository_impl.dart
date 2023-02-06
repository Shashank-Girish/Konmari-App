import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:konmari/features/login/domain/entities/user_info.dart';
import 'package:konmari/features/login/domain/entities/login_info.dart';
import 'package:konmari/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:konmari/features/login/domain/repository/login_repository.dart';

class SignInRepositoryImpl implements SignInRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<Either<AppFailure, User>> registerUser(NewUserInfo user) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }

  @override
  Future<Either<AppFailure, User?>> signInEmail(LoginInfo auth) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: auth.email!, password: auth.password!);
      var user = result.user;
      return Right(user);
    } catch (e) {
      return Left(AppFailure());
    }
  }

  @override
  Future<Either<AppFailure, User?>> signInGmail() async {
    try {
      User? user;
      final GoogleSignIn signIn = GoogleSignIn();
      final GoogleSignInAccount? account = await signIn.signIn();
      if (account != null) {
        final GoogleSignInAuthentication authentication =
            await account.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: authentication.accessToken,
          idToken: authentication.idToken,
        );
        try {
          final UserCredential userCredential =
              await _auth.signInWithCredential(credential);

          user = userCredential.user;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            return Left(AppFailure());
          } else if (e.code == 'invalid-credential') {
            // handle the error here
            return Left(AppFailure());
          }
        } catch (e) {
          // handle the error here
          return Left(AppFailure());
        }
      }
      return Right(user);
    } catch (e) {
      return Left(AppFailure());
    }
  }

  @override
  Future<Either<AppFailure, User?>> signInGuest() async {
    try {
      final result = await _auth.signInAnonymously();
      User? user = result.user;
      return Right(user);
    } catch (e) {
      return Left(AppFailure());
    }
  }

  @override
  Future<Either<AppFailure, void>> signOut() async {
    try {
      var logout = await _auth.signOut();
      return Right(logout);
    } catch (e) {
      return Left(AppFailure());
    }
  }
}
