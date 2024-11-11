import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:jombang/Animations/FadeAnimation.dart';
import 'package:jombang/controllers/login_controller.dart';

class Login1Page extends StatelessWidget {
  const Login1Page({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());

    return Obx(
      () => Scaffold(
        backgroundColor: const Color(0xAA1A1B1E),
        body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const FadeAnimation(
                  1.2,
                  Text(
                    "Let's sign you in.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
              const Gap(30),
              FadeAnimation(
                  1.5,
                  Container(
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xAA1A1B1E),
                        border: Border.all(color: const Color(0xFF373A3F))),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Color(0xFF373A3F)))),
                          child: TextField(
                            controller: loginController.emailController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Color(0xFF5C5F65)),
                                hintText: "Email or Phone number"),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: const BoxDecoration(),
                          child: TextField(
                            controller: loginController.passwordController,
                            obscureText:
                                !loginController.isPasswordVisible.value,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle:
                                    const TextStyle(color: Color(0xFF5C5F65)),
                                suffixIcon: InkWell(
                                    onTap: () {
                                      loginController.showPassword();
                                    },
                                    child: Icon(
                                      loginController.isPasswordVisible.value
                                          ? Icons.remove_red_eye
                                          : Icons.energy_savings_leaf,
                                      color: const Color(0xFF5C5F65),
                                    )),
                                hintText: "Password"),
                          ),
                        ),
                      ],
                    ),
                  )),
              const Gap(40),
              const FadeAnimation(
                  1.6,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Color(0xFF5C5F65)),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Register",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  )),
              const Gap(20),
              FadeAnimation(
                  1.8,
                  Center(
                    child: MaterialButton(
                      onPressed: () => loginController.loginWithEmail(),
                      color: const Color(0xAA3A5BDA),
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white.withOpacity(.7), fontSize: 16),
                      )),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
