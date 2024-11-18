import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_kart/auth/model/user_model.dart';
import 'package:snap_kart/auth/provider/auth_provider.dart';
import 'package:snap_kart/auth/view/login_screen.dart';
import 'package:snap_kart/color.dart';
import 'package:snap_kart/core/appUtil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final userNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomSheet: continueButton(),
    );
  }

  Widget getBody() {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
             customAppBar(size),
              contentContainer(size),
            ],
          )
        ],
      ),
    );
  }

  Container contentContainer(Size size) {
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.14),
      width: double.infinity,
      height: size.height * 0.85,
      decoration: const BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(11),
          topRight: Radius.circular(11),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 35,
          left: 18,
          right: 18,
        ),
        child: Form(
          key: globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign-Up for the best Experience',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Enter your address to continue',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 10),
              buildTextFormField(
                'User Name',
                'Enter the email address',
                userNameController,
                false,
              ),
              const SizedBox(height: 10),
              buildTextFormField(
                'Phone Number',
                'Enter your phone number',
                phoneNumberController,
                false,
              ),
              const SizedBox(height: 10),
              buildTextFormField(
                'Password',
                'Obscure password',
                passwordController,
                true,
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: handleSingUp,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      ' Login-ID',
                      style: TextStyle(
                        color: Color(0xFF044AAF),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'By continuing, you agree to Flipkart\'s ',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                const TextSpan(
                  text: 'Terms of Use',
                  style: TextStyle(
                      color: Color(0xFF044AAF),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                TextSpan(
                  text: ' and ',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                const TextSpan(
                  text: 'Privacy Policy',
                  style: TextStyle(
                      color: Color(0xFF044AAF),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ])),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(String text, String hintText,
      TextEditingController controller, bool isPasswordField) {
    return SizedBox(
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return TextFormField(
            onTap: (){
              if(isPasswordField){
              authProvider.boolContainer();
            }},
            obscureText: isPasswordField && authProvider.isObscureText,
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "$hintText is required";
              }
              if (text == "Phone Number" && value.length != 10) {
                return "Phone number must be 10 digits";
              }
              if (isPasswordField && value.length <  6) {
                return "Password must be at least 6 characters long";
              }else{
              return null;
            }},
            decoration: InputDecoration(
              labelText: text,
              hintText: hintText,
              labelStyle: const TextStyle(
                color: Color(0xFF044AAF),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              suffixIcon: isPasswordField
                  ? IconButton(
                icon: Icon(
                  authProvider.isObscureText
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: const Color(0xFF044AAF),
                ),
                onPressed: () {
                  authProvider.conditionBool();
                },
              )
                  : null,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF044AAF),
                  width: 2,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF044AAF),
                  width: 2,
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
              ),
            ),
          );
        },
      ),
    );
  }


  Widget customAppBar(Size size) {
    return Container(
      width: double.infinity,
      height: size.height * 0.16,
      color: blueColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 3,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Snapkart',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: bgColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(width: 12),
                Image.network(
                  utilImage,
                  width: 25,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget continueButton() {
    return Consumer<AuthProvider>(builder: (context,provider,child){
      return Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.8), blurRadius: 10),
          ],
        ),
        child: GestureDetector(
          onTap: handleContinue,
          child: Container(
            margin: const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
            color: provider.containerColor ? blueColor : Colors.black26,
            child:  Center(
              child:provider.isLoading?const CircularProgressIndicator(color: Colors.white,): const Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  void handleContinue() async {
    if (globalKey.currentState!.validate()) {
      AuthProvider authProvider =
          Provider.of<AuthProvider>(context, listen: false);
      String userName = userNameController.text;
      String password = passwordController.text;
      UserModel user = UserModel(userName: userName, password: password);
      await authProvider.singUp(user);
      if (authProvider.isAuthenticated) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const LoginScreen()));
      } else {
        AppUtil.showToast(authProvider.errorMessage.toString());
      }
    }
  }

  void handleSingUp() {
    Navigator.pop(context);
  }
}
