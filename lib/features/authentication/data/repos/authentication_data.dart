 import 'package:ecommerce_app/features/authentication/data/models/authentication_model.dart';

final List<AuthenticationModel> authenticaction_pages = [
  AuthenticationModel(button: "login",textbutton:"Forget Password?", textfield1: "Username or Email", textfield2: "Password", title: "Welcome Back!"),
  AuthenticationModel(button: "Create Account",textbutton:"Register", textfield1: "Username or Email", textfield2: "Password", textfield3: "ConfirmPassword",title: "Create an account"),
  AuthenticationModel(button: "Submit", textfield1: "Enter your email address", title: "Forgot password?"),
];