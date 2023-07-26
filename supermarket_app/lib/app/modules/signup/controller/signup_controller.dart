import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:supermarket_app/app/constants/api_endpoints.dart';
import 'package:supermarket_app/app/modules/bag/domain/bag.dart';
import 'package:supermarket_app/app/modules/bag/domain/helpers/bag_helper.dart';
import 'package:supermarket_app/app/modules/user_settings/domain/helper/user_helper.dart';
import 'package:supermarket_app/app/modules/user_settings/domain/user.dart';
import 'package:supermarket_app/app/repositories/app_client/app_client_repository.dart';
import 'package:supermarket_app/app/repositories/local_storage/local_storage_controller.dart';

part 'signup_controller.g.dart';

enum AccountType { admin, user }

class SignupController = SignupControllerBase with _$SignupController;

abstract class SignupControllerBase with Store {
  final localStorage = Modular.get<LocalStorageController>();
  final appClient = Modular.get<AppClientRepository>();

  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String repeatPassword = '';

  @observable
  AccountType accountType = AccountType.user;

  @observable
  bool enableButton = false;

  @action
  onNameChanged(String name) {
    this.name = name;
    validateFields();
  }

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
  onRepeatPasswordChanged(String repPassword) {
    repeatPassword = repPassword;
    validateFields();
  }

  @action
  onChangedTypeAccount(int index) {
    accountType = index == 0 ? AccountType.admin : AccountType.user;
  }

  @action
  validateFields() {
    if (name.trim().isNotEmpty &&
        email.trim().isNotEmpty &&
        password.trim().isNotEmpty &&
        repeatPassword.trim().isNotEmpty &&
        (password == repeatPassword)) {
      enableButton = true;
    }
  }

  Future<bool> onSignupSubmitted() async {
    final isEmailAlreadyRegister = await checkUserEmailAlreadyRegister(email);
    if (isEmailAlreadyRegister) {
      return false;
    }

    final response = await appClient.post(
      endpoint: ApiEndpoints.signupEndpoint,
      bodyMapper: {
        'name': name,
        'email': email,
        'password': password,
        'role': accountType.name.toUpperCase(),
      },
    );
    print('response: $response');
    await createUserBag(email);
    return response != null && response.statusCode == 200;
  }

  Future<bool> checkUserEmailAlreadyRegister(String userEmail) async {
    final user = await appClient.get<User>(
      endpoint: '/users',
      jsonMapper: UserHelper.mapToUser,
      queryParameters: {'email': userEmail},
    );
    return user != null;
  }

  createUserBag(String userEmail) async {
    final userResponse = await appClient.get<User>(
      endpoint: '/users',
      jsonMapper: UserHelper.mapToUser,
      queryParameters: {'email': userEmail},
    );

    if (userResponse != null) {
      userResponse.password = password;

      final bag = await appClient.mappedPost<Bag>(
        endpoint: ApiEndpoints.bagEndpoint,
        jsonMapper: BagHelper.mapToUserBag,
        bodyMapper: Bag(
          itemCount: 0,
          totalPrice: 0,
          items: [],
        ).toJson(),
      );
      if (bag != null) {
        userResponse.bag = bag;
        await appClient.put(
          endpoint: ApiEndpoints.usersEndpoint,
          bodyMapper: userResponse.toJson(),
        );
      }
    }
  }
}
