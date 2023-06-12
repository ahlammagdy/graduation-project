// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:smo/screens/app_menu.dart';

import 'widgets/component.dart';
import 'sing_up.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

var formkey = GlobalKey<FormState>();

class _LoginState extends State<Login> {
  var passwordController = TextEditingController();

  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(children: [
                const SizedBox(
                  height: 30.0,
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      const Image(
                        image: AssetImage("images/blue 1.png"),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      shareTextFiled(
                        text: "UserName",
                        controller: nameController,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      shareTextFiledpass(
                          text: "Password",
                          keyboardtype: TextInputType.visiblePassword,
                          controller: passwordController),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "don't have account?",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Singup()));
                            },
                            child: const Text(
                              "Singup",
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 300.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 40.0,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30.0)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: MaterialButton(
                          onPressed: () {
                            print(nameController.text);

                            print(passwordController.text);

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const AppMenu();
                            }));
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "or continue with :",
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 20.0,
                              backgroundImage: AssetImage("images/fb.png"),
                            ),
                            const SizedBox(
                              width: 40.0,
                            ),
                            CircleAvatar(
                              radius: 20.0,
                              backgroundImage:
                                  const AssetImage("images/google.png"),
                              backgroundColor: Colors.white.withOpacity(0.2),
                            ),
                            const SizedBox(
                              width: 40.0,
                            ),
                            const CircleAvatar(
                              radius: 20.0,
                              backgroundImage:
                                  AssetImage("images/linkedin.png"),
                            ),
                          ]),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
