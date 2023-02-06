import 'package:konmari/features/login/domain/entities/login_info.dart';

class LoginInfoModel extends LoginInfo{
  String ? email;
  String ? password;
   
  LoginInfoModel({required  email, required  password}):super(email:email, password:password);

}