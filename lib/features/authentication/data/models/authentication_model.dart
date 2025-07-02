class AuthenticationModel {
  final String title;
  final String textfield1;
  final String? textfield2;
  final String? textfield3;
  final String button;
  final String? textbutton;

  const AuthenticationModel({
    required this.title,
    required this.textfield1,
    this.textfield2,
    this.textfield3,
    required this.button,
    this.textbutton,
  });
}