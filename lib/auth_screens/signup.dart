import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frehas_task/widgets/custom_buttons.dart';
import 'package:frehas_task/widgets/custom_textfeilds.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
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

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) return "Enter name";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // 👈 allows scrolling
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                const Text(
                  "Sign up",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: "Name",
                  controller: nameController,
                  validator: _validateName,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  hintText: "Email",
                  controller: emailController,
                  validator: _validateEmail,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  hintText: "Password",
                  controller: passwordController,
                  obscureText: true,
                  validator: _validatePassword,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: "SIGN UP",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Signup Successful ✅")),
                      );
                      Navigator.pushNamed(
                        context,
                        '/home',
                      ); // 👈 go to Home after signup
                    }
                  },
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/login'),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Center(child: Text("Or sign up with social account")),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/0/09/IOS_Google_icon.png",
                        width: 40, // 👈 smaller size
                        height: 40,
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {},
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
