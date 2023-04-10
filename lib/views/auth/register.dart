import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/views/auth/login.dart';

class Register extends StatefulWidget {
  const Register({super.key, required this.title});

  final String title;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f2f2),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter your Email here"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter your password here"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim());
                        _showSnackBarAndRedirect(context);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == "weak-password") {
                          print('The password provided is too weak.');
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('The password provided is too weak.'),
                          ));
                        } else if (e.code == "email-already-in-use") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                Text('Such email has been already registered.'),
                          ));
                          print('An account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: const Text("Submit"),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                    child: Column(
                  children: [
                    ElevatedButton(
                      child: const Text('Already have an account?'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Login(title: 'Sign in')),
                        );
                      },
                    ),
                    SizedBox(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: SizedBox(
                            width: 300,
                            height: 300,
                            child: SvgPicture.asset("logo.svg")),
                      ),
                    )
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showSnackBarAndRedirect(BuildContext context) {
  final snackBar = SnackBar(
    content: Text('User sign up success! Redirecting to login page...'),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => Login(title: "Sign in")),
  );
}
