import 'package:expense_tracker_app/common_widget/secondary_button.dart';
import 'package:expense_tracker_app/view/login/sign_up_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/primery_button.dart';
import '../../common_widget/round_textfield.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isRemember = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/img/app_logo.png",
                  width: media.width * 0.5, fit: BoxFit.contain),
              const Spacer(),
              RoundTextField(
                title: "Login",
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                title: "Password",
                controller: txtPassword,
                obscureText: true,
              ),

               const SizedBox(
                height: 8,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isRemember = !isRemember;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isRemember
                              ? Icons.check_box_rounded
                              : Icons.check_box_outline_blank_rounded,
                          size: 25,
                          color: TColor.gray50,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Remember me",
                          style: TextStyle(color: TColor.gray50, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot password",
                      style: TextStyle(color: TColor.gray50, fontSize: 14),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 8,
              ),

              PrimeryButton(
                title: "Sign In",
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const SocialLoginView(),
                  //   ),
                  // );
                },
              ),
              const Spacer(),
              Text(
                "if you don't have an account yet?",
                textAlign: TextAlign.center,
                style: TextStyle(color: TColor.white, fontSize: 14),
              ),
              const SizedBox(
                height: 20,
              ),
              SecondaryButton(
                title: "Sign up",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpView(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}