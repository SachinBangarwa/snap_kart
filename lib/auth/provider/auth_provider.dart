import 'package:flutter/foundation.dart';
import 'package:snap_kart/auth/model/user_model.dart';
import 'package:snap_kart/auth/service/auth_service.dart';
import 'package:snap_kart/auth/service/storage_helper.dart';
import 'package:snap_kart/core/appUtil.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider(this.authService);

  AuthService authService;
  bool isAuthenticated = false;
  String? errorMessage;
  bool containerColor = false;
  bool isObscureText=true;
  bool isLoading = false;

  void conditionBool() {
    isObscureText = !isObscureText;
    notifyListeners();
  }
  void boolContainer() {
    containerColor = true;
    notifyListeners();
  }

  Future<void> login(UserModel user) async {
    isLoading=true;
    notifyListeners();
    try {
      errorMessage = null;
      String token = await authService.login(user);
      await StorageHelper.storeToken(token);
      if (token.isNotEmpty) {
        AppUtil.showToast('login successfully');
        isAuthenticated = true;
      }
      notifyListeners();
    } catch (e) {
      isAuthenticated = false;
      AppUtil.showToast('enter the email/password correct');
    }finally{
      isLoading=false;
    }
  }

  Future<void> singUp(UserModel user) async {
    isLoading=true;
    notifyListeners();
    try {
      bool success = await authService.singUp(user);
      isAuthenticated = success;
      if (success) {
        AppUtil.showToast('sing Up success');
      }
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      isAuthenticated = false;
      notifyListeners();
    }finally{
      isLoading=false;
    }
  }
}
