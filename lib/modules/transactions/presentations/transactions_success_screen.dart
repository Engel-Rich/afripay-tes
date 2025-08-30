import 'package:afrypay/common/app_buttons.dart';
import 'package:afrypay/common/app_theme.dart';
import 'package:afrypay/common/size_config.dart';
import 'package:flutter/material.dart';

class TransactionsSuccessScreen extends StatelessWidget {
  const TransactionsSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: titlePrimaryColors,
      body: SuccesWidgetComponent(
        succesMessage: "Votre transaction à été éffectué avec succès",
        asset: "assets/succes_pay.png",
        onbackButton: () {
          Navigator.pop(context);
        },
        backMessage: "Retourner sur le Compte",
      ),
    );
  }
}

class SuccesWidgetComponent extends StatelessWidget {
  final String succesMessage;
  final String? backMessage;
  final String? asset;
  final VoidCallback onbackButton;
  const SuccesWidgetComponent({
    super.key,
    required this.succesMessage,
    required this.onbackButton,
    this.backMessage,
    this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(getProportionateScreenHeight(20)),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(color: titlePrimaryColors),
          borderRadius: BorderRadius.circular(getProportionateScreenHeight(15)),
        ),
        width: SizeConfig.screenWidth * 0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(asset ?? "images/succes_image.png"),
            spacerHeight(30),
            Text(
              'Felicitation',
              style: TextStyle(
                fontSize: 25,
                color: titlePrimaryColors,
                fontWeight: FontWeight.w900,
              ),
            ),

            spacerHeight(20),
            Text(succesMessage, textAlign: TextAlign.center),
            spacerHeight(20),
            CustomAppPrimaryButton(
              onpressed: onbackButton,
              title: backMessage ?? "Retour",
              radius: 12,
            ),
            spacerHeight(20),
          ],
        ),
      ),
    );
  }
}
