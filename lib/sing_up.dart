// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:smo/screens/app_menu.dart';

import 'log_in.dart';
import 'widgets/component.dart';

class Singup extends StatefulWidget {
  const Singup({super.key});

  @override
  State<Singup> createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  var passwordController = TextEditingController();

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage("images/blue 1.png"),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    shareTextFiled(text: "Name", controller: nameController),
                    const SizedBox(
                      height: 10.0,
                    ),
                    shareTextFiled(
                        text: "Phone",
                        keyboardtype: TextInputType.phone,
                        controller: phoneController),
                    const SizedBox(
                      height: 10.0,
                    ),
                    shareTextFiled(
                        text: "Email",
                        keyboardtype: TextInputType.emailAddress,
                        controller: emailController),
                    const SizedBox(
                      height: 10.0,
                    ),
                    shareTextFiledpass(
                        text: "Password",
                        keyboardtype: TextInputType.visiblePassword,
                        controller: passwordController),
                    const SizedBox(
                      height: 10.0,
                    ),
                    shareTextFiledpass(
                        text: "Confirm Password",
                        keyboardtype: TextInputType.visiblePassword,
                        controller: confirmPassController),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios)),
                          hintText: "Specialization",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          filled: true,
                          fillColor: Colors.white),
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_forward_ios)),
                          hintText: "Interests",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          filled: true,
                          fillColor: Colors.white),
                      keyboardType: TextInputType.name,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have account?",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const Login();
                            }));
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                          print(phoneController.text);
                          print(emailController.text);
                          print(passwordController.text);
                          print(confirmPassController.text);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const AppMenu();
                          }));
                        },
                        child: const Text(
                          "SinUp",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
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
                height: 20.0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage("images/fb.png"),
                ),
                const SizedBox(
                  width: 40.0,
                ),
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: const AssetImage("images/google.png"),
                  backgroundColor: Colors.white.withOpacity(0.2),
                ),
                const SizedBox(
                  width: 40.0,
                ),
                const CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage("images/linkedin.png"),
                ),
              ]),
            ]),
          ),
        ),
      ),
    );
  }
}
