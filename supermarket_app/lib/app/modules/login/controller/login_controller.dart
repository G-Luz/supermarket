import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:supermarket_app/app/constants/api_endpoints.dart';
import 'package:supermarket_app/app/repositories/app_client/app_client_repository.dart';
import 'package:supermarket_app/app/repositories/local_storage/local_storage_controller.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final localStorage = Modular.get<LocalStorageController>();
  final appClient = Modular.get<AppClientRepository>();

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool enableButton = false;

  @action
  onEmailChanged(String email) {
    this.email = email;
    validateFields();
  }

  @action
  onPasswordChanged(String password) {
    this.password = password;
    validateFields();
  }

  @action
  validateFields() {
    if (email.trim().isNotEmpty && password.trim().isNotEmpty) {
      enableButton = true;
    }
  }

  Future<String> automaticallyLogin() async {
    final existEmail =
        await localStorage.getValueByKey(localStorage.userEmailKey);
    if (existEmail != null && existEmail != '') {
      return existEmail;
    }
    return '';
  }

  Future<bool> onLoginSubmitted() async {
    final response = await appClient.post(
      endpoint: ApiEndpoints.signinEndpoint,
      bodyMapper: {
        'email': email,
        'password': password,
      },
    );
    if (response != null) {
      await localStorage.setStringValue(
        localStorage.webTokenKey,
        response.toString(),
      );
      await localStorage.setStringValue(
        localStorage.userEmailKey,
        email,
      );
      return true;
    }
    return false;
  }
}
