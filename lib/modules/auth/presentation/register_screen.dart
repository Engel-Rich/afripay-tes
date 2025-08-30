import 'package:afrypay/common/app_buttons.dart';
import 'package:afrypay/common/app_loaders.dart';
import 'package:afrypay/common/app_theme.dart';
import 'package:afrypay/common/containar_icon_bouton.dart';
import 'package:afrypay/common/routes.dart';
import 'package:afrypay/common/size_config.dart';
import 'package:afrypay/common/textfield_app.dart';
import 'package:afrypay/modules/auth/presentation/components/oauth2_buttons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  bool isObscure = true;

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: "", hasLeading: true, onTapBack: Get.back),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Creer un compte",
                  style: appTextStyle.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppThemes.primaryblue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              spacerHeight(20),
              Text(
                "Nom d'utilisateur",
                style: appTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              spacerHeight(5),
              TextFieldApp(
                controller: controllerPhone,
                keyboardType: TextInputType.name,
                hintext: "Entrez votre nom d'utilisateur",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nom d\'utilisateur obligatoire';
                  }
                  return null;
                },
              ),
              spacerHeight(15),
              Text(
                "Mot de passe",
                style: appTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              spacerHeight(5),
              TextFieldApp(
                controller: controllerPhone,
                keyboardType: TextInputType.visiblePassword,
                hintext: "Entrez votre mot de passe",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mot de passe obligatoire';
                  }
                  return null;
                },
                obscureText: isObscure,
                sufixIcon: InkWell(
                  onTap: () {
                    isObscure = !isObscure;
                    setState(() {});
                  },
                  child: isObscure
                      ? Icon(Icons.visibility_outlined)
                      : Icon(Icons.visibility_off_outlined),
                ),
              ),
              spacerHeight(30),
              CustomAppPrimaryButton(
                onpressed: () async {
                  Get.toNamed(otpScreen);
                },
                // title: "Se connecter",
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isLoading) const AppLoader(size: 40),
                    if (isLoading) spacerWidth(15),
                    Text(
                      "Creer un compte",
                      style: appTextStyle.copyWith(
                        color: black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              spacerHeight(20),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      text: "MEn creant votre compte vous acceptez les ",
                      style: appTextStyle,
                      children: [
                        TextSpan(
                          text: "conditions d'utilisation ",
                          style: appTextStyle.copyWith(color: primaryColors),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              await launchUrl(
                                Uri.parse("https://www.africremit.ca/faq"),
                              );
                            },
                        ),
                        TextSpan(text: "et les "),
                        TextSpan(
                          text: "termes de confidentialite ",
                          style: appTextStyle.copyWith(color: primaryColors),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              await launchUrl(
                                Uri.parse("https://www.africremit.ca/faq"),
                              );
                            },
                        ),
                        TextSpan(text: "de @fric payment"),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              OrAuthLine(),
              spacerHeight(15),
              Oauth2Buttons(),
              Spacer(),
              Center(
                child: Text("Vous avez deja un compte ?", style: appTextStyle),
              ),
              spacerHeight(10),
              Center(
                child: CustomAppPrimaryButton(
                  onpressed: () {
                    Get.back();
                    Get.toNamed(login);
                  },
                  height: 30,
                  width: 250.h,
                  radius: 5,
                  title: "Se connecter",
                  color: context.tertiary,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
