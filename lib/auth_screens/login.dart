import 'package:flutter/material.dart';
import 'package:frehas_task/navigations/navigator.dart';
import 'package:frehas_task/widgets/custom_buttons.dart';
import 'package:frehas_task/widgets/custom_textfeilds.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Enter email";
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!regex.hasMatch(value)) return "Invalid email";
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.length < 6) return "Min 6 characters";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: "Email",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: _validateEmail,
              ),
              const SizedBox(height: 15),
              CustomTextField(
                hintText: "Password",
                controller: passwordController,
                obscureText: true,
                validator: _validatePassword,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/forgot'),
                  child: const Text(
                    "Forgot your password?",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              CustomButton(
                text: "LOGIN",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Login Successful ✅")),
                    );
                    Navigator.pushNamed(
                      context,
                      AppRoutes.bar,
                    ); // 👈 Example navigation
                  }
                },
              ),
              const SizedBox(height: 20),
              const Center(child: Text("Or login with social account")),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {}, // Google login
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/0/09/IOS_Google_icon.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {}, // Facebook login
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: SvgPicture.network(
                        "https://upload.wikimedia.org/wikipedia/commons/c/c2/F_icon.svg",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don’t have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/signup',
                      ); // 👈 Navigation to signup
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
