import 'package:afrypay/common/app_buttons.dart';
import 'package:afrypay/common/app_theme.dart';
import 'package:afrypay/common/containar_icon_bouton.dart';
import 'package:afrypay/common/routes.dart';
import 'package:afrypay/common/size_config.dart';
import 'package:afrypay/modules/home/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class BuildWalletNatif extends StatefulWidget {
  final String title;
  const BuildWalletNatif({super.key, required this.title});

  @override
  State<BuildWalletNatif> createState() => _BuildWalletNatifState();
}

class _BuildWalletNatifState extends State<BuildWalletNatif> {
  bool isSoldVisible = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApppController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () =>
              Get.toNamed(accompteDetails, arguments: {'title': widget.title}),
          child: Container(
            height: 125.h,
            width: SizeConfig.screenWidth * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.h),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: SizedBox(
              height: 125.h,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: -0.h,
                    child: Image.asset('assets/relax_log.png'),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox.shrink(),
                            Text(
                              widget.title,
                              style: TextStyle(
                                color: titlePrimaryColors,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.w,
                              ),
                            ),
                            controller.nativeSoldVisible
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${controller.balanceNative} FCFA",
                                        style: TextStyle(
                                          fontSize: 20.w,
                                          color: HexColor("6F48C5"),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      spacerWidth(15),
                                      ContainerIconButton(
                                        ontap: () {
                                          setState(() {
                                            controller
                                                .changeNativeSoldVisibility();
                                          });
                                        },
                                        child: Icon(
                                          Icons.visibility_off_outlined,
                                          size: 25.w,
                                        ),
                                      ),
                                    ],
                                  )
                                : CustomAppPrimaryButton(
                                    onpressed: () {
                                      controller.changeNativeSoldVisibility();
                                    },
                                    height: getProportionateScreenHeight(40),
                                    width: getProportionateScreenWidth(167),
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: primaryColors,
                                      width: 1.5,
                                    ),
                                    radius: 5,
                                    widget: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Afficher le solde",
                                          style: TextStyle(
                                            color: titlePrimaryColors,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.w,
                                          ),
                                        ),
                                        Icon(
                                          Icons.visibility_outlined,
                                          size: 16.w,
                                          color: titlePrimaryColors,
                                        ),
                                      ],
                                    ),
                                  ),
                            const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
