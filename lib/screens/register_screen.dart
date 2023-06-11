import 'package:flutter/material.dart';
import 'package:chat_app/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Logo(text: "Register"),
                  _Form(),
                  Labels(
                    onNavigate: () =>
                        Navigator.pushReplacementNamed(context, 'login'),
                    navigateText: "Sign In to your account",
                    introText: 'Already have an account?',
                  ),
                  const Text(
                    "Terms and Conditions",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(children: [
        CustomInput(
          prefixIcon: Icons.person_outline,
          hint: 'Name',
          controller: nameCtrl,
        ),
        CustomInput(
          prefixIcon: Icons.email_outlined,
          hint: 'Email',
          textInputType: TextInputType.emailAddress,
          controller: emailCtrl,
        ),
        CustomInput(
          prefixIcon: Icons.lock_clock_outlined,
          hint: 'Password',
          obscureText: true,
          controller: passwordCtrl,
        ),
        BlueButton(text: 'Create Account', onPressed: () {})
      ]),
    );
  }
}
