import 'package:konmari/features/login/domain/entities/user_info.dart';

class UserModel extends NewUserInfo {
  String? firstName;
  String? lastName;
  DateTime? dob;
  String? password;
  UserModel(
      {required firstName, required lastName, required dob, required password})
      : super(
            firstName: firstName,
            lastName: lastName,
            dob: dob,
            password: password);
}
