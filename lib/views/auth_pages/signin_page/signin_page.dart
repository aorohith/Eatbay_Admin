import 'package:eatbay_admin/controllers/auth_controller/auth_controller.dart';
import 'package:eatbay_admin/views/widgets/big_text.dart';
import 'package:eatbay_admin/views/widgets/core/colors.dart';
import 'package:eatbay_admin/views/widgets/core/constant.dart';
import 'package:eatbay_admin/views/widgets/icon_text_filed.dart';
import 'package:eatbay_admin/views/widgets/signin_button.dart';
import 'package:eatbay_admin/views/widgets/signup_or_signin_with.dart';
import 'package:eatbay_admin/views/widgets/small_text.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        h30,
                        h30,
                        Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://thumbs.dreamstime.com/b/food-delivery-logo-food-delivery-logo-vector-template-157000359.jpg',
                              ),
                            ),
                          ),
                        ),
                        h30,
                        Text(
                          "Welcome Back Chief.!!",
                          style: TextStyle(
                              color: AppColors.mainColor, fontSize: 25),
                        ),
                        h30,
                        IconTextFiield(
                            icon: Icons.email,
                            hintText: "Admin Email",
                            controller: emailController),
                        IconTextFiield(
                          icon: Icons.password,
                          hintText: "Password",
                          controller: passwordController,
                        ),
                        LoginButton(
                          text: "Sign In",
                          onClick: () {
                            AuthController.instance.signin(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );
                          },
                        ),
                        h30,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SmallText(
                              text: "Contact Team",
                              size: 18,
                            ),
                            BigText(text: " Forgot?"),
                          ],
                        ),
                        h20,
                        AuthWithButton(),
                      ],
                    ),
                  )
      ),
    );
  }
}
