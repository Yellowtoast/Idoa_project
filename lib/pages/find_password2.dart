import 'dart:async';

import 'package:app/configs/colors.dart';
import 'package:app/configs/routes.dart';
import 'package:app/configs/size.dart';
import 'package:app/configs/text_styles.dart';
import 'package:app/controllers/auth_controller.dart';
import 'package:app/controllers/password_controller.dart';

import 'package:app/controllers/signup_controller.dart';
import 'package:app/helpers/formatter.dart';

import 'package:app/helpers/validator.dart';

import 'package:app/widgets/button/button.dart';
import 'package:app/widgets/appbar.dart';
import 'package:app/widgets/textfield/regnum_textfield.dart';
import 'package:app/widgets/textfield/textfield.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindPasswordPage2 extends StatelessWidget {
  FindPasswordPage2({Key? key}) : super(key: key);
  PasswordController passwordController = Get.find();
  AuthController authController = Get.find();
  // PasswordController passwordController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: IcoAppbar(
            title: '비밀번호 변경',
            usePop: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 27,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '새로운 비밀번호를\n입력해주세요',
                      style: IcoTextStyle.boldTextStyle24B,
                    ),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IcoTextFormField(
                          width: double.infinity,
                          obscureText: true,
                          hintText: "8~12자 / 영문숫자조합",
                          textFieldLabel: "비밀번호",
                          errorText: passwordController.passwordErrorText,
                          myTextController:
                              passwordController.passwordController,
                          onChanged: (value) async {
                            validatePassword(
                                value, passwordController.passwordErrorText);
                          },
                        ),
                        IcoTextFormField(
                          width: double.infinity,
                          obscureText: true,
                          hintText: "8~12자 / 영문숫자조합",
                          textFieldLabel: "비밀번호 확인",
                          errorText:
                              passwordController.confirmPasswordErrorText,
                          myTextController:
                              passwordController.confirmPasswordController,
                          onChanged: (value) {
                            validateConfirmPassword(
                                passwordController
                                    .passwordController.value.text,
                                value,
                                passwordController.confirmPasswordErrorText);
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IcoButton(
                            onPressed: () async {},
                            active: passwordController.isButtonValid,
                            buttonColor: IcoColors.primary,
                            textStyle: IcoTextStyle.buttonTextStyleW,
                            text: "다음으로"),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
