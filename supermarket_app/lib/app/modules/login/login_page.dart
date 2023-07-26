import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supermarket_app/app/constants/app_colors.dart';
import 'package:supermarket_app/app/modules/login/controller/login_controller.dart';
import 'package:supermarket_app/app/widgets/app_button.dart';
import 'package:supermarket_app/app/widgets/app_loading_dialog.dart';
import 'package:supermarket_app/app/widgets/app_text.dart';
import 'package:supermarket_app/app/widgets/app_textfield.dart';
import 'package:supermarket_app/app/widgets/app_toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Modular.get<LoginController>();

  ///TODO: QUANDO VOLTAR AMANHÃ TERMINAR AS LISTAGENS E CADASTROS
  ///
  ///CADASTRO DE PRODUCTS
  ///LISTAGEM DE PRODUCTS PELA CATEGORIA
  ///ESTADO DA BAG

  @override
  void initState() {
    super.initState();
    checkExistUser();
  }

  void checkExistUser() async {
    final userEmail = await controller.automaticallyLogin();
    if (userEmail != '') {
      Modular.to.pushReplacementNamed(
        '/home/',
        arguments: {
          'email': userEmail,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    text: 'Faça compras online e receba em sua residência',
                    fontSize: 20,
                    fontColor: AppColors.ltTeal,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 50),
                  AppTextfield(
                    hint: 'Digite seu email',
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => controller.onEmailChanged(value),
                  ),
                  const SizedBox(height: 30),
                  AppTextfield(
                    hint: 'Digite sua senha',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: false,
                    suffixIcon: GestureDetector(
                      child: const Icon(
                        Icons.visibility_off,
                      ),
                    ),
                    onChanged: (value) => controller.onPasswordChanged(value),
                  ),
                  const SizedBox(height: 30),
                  AppButton(
                    text: 'Entrar',
                    width: deviceWidth,
                    enable: controller.enableButton,
                    backgroundColor: controller.enableButton
                        ? AppColors.teal
                        : AppColors.ltTeal.withOpacity(.8),
                    onPressedCallback: () async {
                      showLoadingDialog(context);
                      final result = await controller.onLoginSubmitted();
                      if (result) {
                        Modular.to.pushReplacementNamed(
                          '/home',
                          arguments: {
                            'email': controller.email,
                          },
                        );
                      } else {
                        showToast('Ocorreu um erro ao efetuar o login');
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Não possui uma conta? ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Modular.to.pushNamed('/signup'),
                            text: 'Registre-se agora!',
                            style: const TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFF468589),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          )
                        ],
                        style: const TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
