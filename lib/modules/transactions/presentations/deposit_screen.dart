import 'package:afrypay/common/app_buttons.dart';
import 'package:afrypay/common/app_loaders.dart';
import 'package:afrypay/common/app_theme.dart';
import 'package:afrypay/common/size_config.dart';
import 'package:afrypay/common/textfield_app.dart';
import 'package:afrypay/modules/transactions/presentations/components/payment_provider_component.dart';
import 'package:afrypay/modules/transactions/presentations/deposit_confirm_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';

class RechargeComponent extends StatefulWidget {
  const RechargeComponent({super.key});

  @override
  State<RechargeComponent> createState() => _RechargeComponentState();
}

class _RechargeComponentState extends State<RechargeComponent> {
  TextEditingController controllerAmount = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool isLoading = false;
  String paymentMethod = 'orange_money';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacerHeight(15),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 10.h,
                    width: 95.h,
                    decoration: BoxDecoration(
                      color: context.tertiary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                spacerHeight(10),
                Text(
                  "Recharger votre compte Principal",
                  style: appTextStyle.copyWith(
                    fontSize: 24.w,
                    color: titlePrimaryColors,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                spacerHeight(15),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text:
                        "Votre argent est en sécurité et garanti par notre politique de dépôt",
                    style: appTextStyle.copyWith(
                      color: context.titleLargeColor,
                    ),
                  ),
                ),
                spacerHeight(20),
                const Text("Montant"),
                spacerHeight(5),
                TextFieldApp(
                  inputFormater: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: inputDecorationApp().copyWith(
                    hintText: 'Entrer le montant ...',
                    suffixIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "XAF",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: context.titleLargeColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  controller: controllerAmount,
                  validator: ValidationBuilder(
                    requiredMessage: 'Le montant est requi',
                  ).required('Le montant est requi').build(),
                  sufixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("XAF")],
                  ),
                ),
                spacerHeight(20),
                const Text("Numero a debiter"),
                spacerHeight(5),
                TextFieldApp(
                  inputFormater: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: inputDecorationApp().copyWith(
                    hintText: 'Entrer le  numero a debiter',
                    suffixIcon: const Icon(Icons.phone),
                  ),
                  maxLength: 9,
                  controller: controllerPhone,
                  validator: ValidationBuilder(
                    requiredMessage: "Le numero de telephone est requi",
                  ).build(),
                ),
                spacerHeight(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Choisir un moyen de paiement ",
                      style: TextStyle(
                        fontSize: 16.w,
                        fontWeight: FontWeight.bold,
                        color: titlePrimaryColors,
                      ),
                    ),
                    spacerHeight(20),
                    PaymentProviderComponent(
                      title: "Orange Money",
                      logo: "assets/om.png",
                      enable: paymentMethod == 'orange_money',
                      onTap: () {
                        setState(() {
                          paymentMethod = 'orange_money';
                        });
                      },
                    ),
                    spacerHeight(10),
                    PaymentProviderComponent(
                      title: "MTN Mobile Money",
                      logo: "assets/momo.png",
                      enable: paymentMethod == 'mtn_mobile_money',
                      onTap: () {
                        setState(() {
                          paymentMethod = 'mtn_mobile_money';
                        });
                      },
                    ),
                    spacerHeight(30),
                    Row(
                      children: [
                        Expanded(
                          child: CustomAppPrimaryButton(
                            color: primaryColors.withAppOppacity(0.3),
                            onpressed: () {
                              Navigator.pop(context);
                            },
                            title: 'Anuller',
                          ),
                        ),
                        spacerWidth(15),
                        Expanded(
                          child: CustomAppPrimaryButton(
                            onpressed: () async {
                              if (formkey.currentState!.validate()) {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  isDismissible: false,
                                  backgroundColor: Colors.transparent,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  builder: (context) => DepositConfirmScreen(),
                                );
                              }
                            },
                            widget: isLoading
                                ? const Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: AppLoader(size: 25),
                                    ),
                                  )
                                : null,
                            title: isLoading ? null : 'Continuer',
                          ),
                        ),
                      ],
                    ),
                    spacerHeight(20),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
