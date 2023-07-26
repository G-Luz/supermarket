import 'package:supermarket_app/app/modules/user_settings/domain/user.dart';

class UserHelper {
  static User mapToUser(Map<String, dynamic> json) {
    return User.fromJson(json);
  }
}
