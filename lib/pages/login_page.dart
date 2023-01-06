import 'package:catlog/utilis/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool isClicked = false;
  final _formKey = GlobalKey<FormState>();

  goToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isClicked = true;
      });
      await Future.delayed(const Duration(milliseconds: 1000));
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        isClicked = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                'assets/images/login_image.png',
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              Text(
                "Welcome $name",
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Username",
                        hintText: "Enter Username",
                      ),
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter a valid Username";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        hintText: "Enter Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter a valid Password";
                        } else if (value.length < 8) {
                          return "Please enter a password with min 8 characters";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Material(
                      color: isClicked ? Colors.green : Colors.deepPurple,
                      borderRadius: isClicked
                          ? BorderRadius.circular(50)
                          : BorderRadius.circular(5),
                      child: InkWell(
                        onTap: () => goToHome(context),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 1000),
                          height: 50,
                          width: isClicked ? 50 : 150,
                          alignment: Alignment.center,
                          child: isClicked
                              ? const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : const Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
