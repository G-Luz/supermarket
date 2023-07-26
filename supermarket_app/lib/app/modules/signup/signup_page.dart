import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supermarket_app/app/constants/app_colors.dart';
import 'package:supermarket_app/app/modules/signup/controller/signup_controller.dart';
import 'package:supermarket_app/app/widgets/app_button.dart';
import 'package:supermarket_app/app/widgets/app_loading_dialog.dart';
import 'package:supermarket_app/app/widgets/app_text.dart';
import 'package:supermarket_app/app/widgets/app_textfield.dart';
import 'package:supermarket_app/app/widgets/app_toast.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<SignupController>();
    final deviceWidth = MediaQuery.of(context).size.width;
    return Observer(builder: (context) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    text: 'Gabriel\'s Market',
                    fontSize: 40,
                    fontColor: AppColors.teal,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 100),
                  const AppText(
                    text: 'Bem vindo',
                    fontSize: 30,
                    fontColor: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 20),
                  const AppText(
                    text: 'Crie uma nova conta e comece a efetuar compras!',
                    fontSize: 20,
                    fontColor: AppColors.ltTeal,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 50),
                  AppTextfield(
                    hint: 'Digite seu nome',
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => controller.onNameChanged(value),
                  ),
                  const SizedBox(height: 15),
                  AppTextfield(
                    hint: 'Digite seu email',
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => controller.onEmailChanged(value),
                  ),
                  const SizedBox(height: 15),
                  AppTextfield(
                    hint: 'Digite sua senha',
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon:
                        GestureDetector(child: Icon(Icons.visibility_off)),
                    onChanged: (value) => controller.onPasswordChanged(value),
                  ),
                  const SizedBox(height: 15),
                  AppTextfield(
                    hint: 'Repita sua senha',
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon:
                        GestureDetector(child: Icon(Icons.visibility_off)),
                    onChanged: (value) =>
                        controller.onRepeatPasswordChanged(value),
                  ),
                  const SizedBox(height: 30),
                  const AppText(
                    text: 'Tipo de conta',
                    fontColor: AppColors.teal,
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: SizedBox(
                      child: ToggleSwitch(
                        minWidth: deviceWidth * .4,
                        initialLabelIndex: controller.accountType.index,
                        cornerRadius: 10,
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        labels: const ['Administrador', 'Usuário'],
                        activeBgColors: const [
                          [AppColors.ltBlue],
                          [AppColors.ltTeal]
                        ],
                        onToggle: (index) =>
                            controller.onChangedTypeAccount(index!),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  AppButton(
                    text: 'Registrar',
                    width: deviceWidth,
                    enable: controller.enableButton,
                    backgroundColor: controller.enableButton
                        ? AppColors.teal
                        : AppColors.ltTeal.withOpacity(.8),
                    onPressedCallback: () async {
                      showLoadingDialog(context);
                      final result = await controller.onSignupSubmitted();
                      Modular.to.pop();
                      if (result) {
                        showToast('Conta cadastrada com sucesso!');
                        Modular.to.pop();
                      } else {
                        showToast('Erro ao cadastrar sua conta');
                      }
                    },
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
