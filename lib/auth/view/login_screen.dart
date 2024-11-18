import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_kart/auth/model/user_model.dart';
import 'package:snap_kart/auth/provider/auth_provider.dart';
import 'package:snap_kart/auth/view/register_screen.dart';
import 'package:snap_kart/color.dart';
import 'package:snap_kart/core/appUtil.dart';
import 'package:snap_kart/deskboard/view/deshboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final globalKey = GlobalKey<FormState>();
  bool isBool = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: buildBody(),
      bottomSheet: buildContinueButton(),
    );
  }

  Widget buildBody() {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              buildCustomAppBar(size),
              buildContentContainer(size),
            ],
          ),
        ],
      ),
    );
  }

  Container buildContentContainer(Size size) {
    return Container(
      margin: EdgeInsets.only(
        top: size.height * 0.14,
      ),
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
          left: 20,
          right: 20,
        ),
        child: Form(
          key: globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Log in to check your Cart',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 35),
              buildTextFormField('Email ID', 'enter the email address',
                  emailController, false),
              const SizedBox(height: 20),
              buildTextFormField(
                'Password',
                'obscure password',
                passwordController,
                true,
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: handleSingUp,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      ' Sing-Up',
                      style: TextStyle(
                        color: Color(0xFF044AAF),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'By continuing, you agree to Flipkart\'s',
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
                  text: ' and',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                const TextSpan(
                  text: ' Privacy Policy',
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

  Widget buildTextFormField(String text, String validator,
      TextEditingController controller, bool isObscure) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return TextFormField(
          onTap: () {
            isObscure ? provider.boolContainer() : false;
          },
          obscureText: isObscure&&provider.isObscureText,
          controller: controller,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return validator;
            }
            return null;
          },
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            suffixIcon: isObscure
                ? IconButton(
                    onPressed: () {
                      provider.conditionBool();
                    },
                    icon: Icon(
                        provider.isObscureText ? Icons.visibility_off : Icons.visibility),
                  )
                : null,
            labelText: text,
            labelStyle: const TextStyle(
              color: Color(0xFF044AAF),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
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
              width: 2,
              color: Colors.red,
            )),
            focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              width: 2,
              color: Colors.red,
            )),
          ),
        );
      },
    );
  }

  Widget buildCustomAppBar(Size size) {
    return Container(
      width: double.infinity,
      height: size.height * 0.16,
      color: blueColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    );
  }

  Widget buildContinueButton() {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            blurRadius: 10,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: handleContinue,
        child: Container(
          margin: const EdgeInsets.only(
            left: 8,
            right: 8,
            top: 5,
            bottom: 5,
          ),
          color: authProvider.containerColor ? blueColor : Colors.black26,
          child:  Center(
            child: authProvider.isLoading? const CircularProgressIndicator(color: Colors.white,): const Text(
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
  }

  void handleContinue() async {
    String name = emailController.text;
    String password = passwordController.text;
    if (globalKey.currentState!.validate() ?? false) {
      AuthProvider authProvider = Provider.of<AuthProvider>(
        context,
        listen: false,
      );
      UserModel user = UserModel(
        userName: name,
        password: password,
      );
      await authProvider.login(user);
      if (authProvider.isAuthenticated) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => const DeskBoardScreen()));
      }
    } else {
      AppUtil.showToast(' enter the required password');
    }
  }

  void handleSingUp() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const RegisterScreen()));
  }
}
