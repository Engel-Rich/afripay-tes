import 'package:afrypay/common/app_buttons.dart';
import 'package:afrypay/common/app_theme.dart';
import 'package:afrypay/common/containar_icon_bouton.dart';
import 'package:afrypay/common/size_config.dart';
import 'package:afrypay/modules/home/controllers/app_controller.dart';
import 'package:afrypay/modules/home/controllers/bottom_navigation_baar_controller.dart';
import 'package:afrypay/modules/home/presentation/component/transactuions_actions.dart';
import 'package:afrypay/modules/transactions/presentations/components/transaction_home_list_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class AccountDetailsScreen extends StatelessWidget {
  final String title;
  const AccountDetailsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        hasLeading: true,
        onTapBack: () {
          Get.back();
        },
      ),
      body: GetBuilder<ApppController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${controller.nativeSoldVisible ? controller.balanceNative.toInt() : "******"} FCFA",
                          textAlign: TextAlign.center,
                          style: appTextStyle.copyWith(
                            fontSize: 30,
                            color: HexColor("6F48C5"),
                          ),
                        ),
                        spacerWidth(15),
                        ContainerIconButton(
                          ontap: () {
                            controller.changeNativeSoldVisibility();
                          },
                          child: Icon(
                            controller.nativeSoldVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  spacerHeight(10),
                  TransactuionsActions(),
                  spacerHeight(35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dernières transactions",
                        style: TextStyle(
                          color: titlePrimaryColors,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(flex: 2),
                      Expanded(
                        flex: 5,
                        child: CustomAppPrimaryButton(
                          height: 40,
                          radius: 5,
                          onpressed: () {
                            Get.back();
                            Get.find<BottomNavigationController>().chanIndex(1);
                          },
                          title: 'Voir Tout',
                          color: Colors.transparent,
                          border: Border.all(color: primaryColors),
                          textColor: primaryColors,
                        ),
                      ),
                    ],
                  ),
                  spacerHeight(20),
                  TransactionHomeListComponent(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
