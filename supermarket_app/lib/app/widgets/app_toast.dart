import 'package:fluttertoast/fluttertoast.dart';
import 'package:supermarket_app/app/constants/app_colors.dart';

Future<void> showToast(String toastText) {
  return Fluttertoast.showToast(
    msg: toastText,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: AppColors.iceWhite,
    textColor: AppColors.teal,
    fontSize: 16.0,
  );
}
