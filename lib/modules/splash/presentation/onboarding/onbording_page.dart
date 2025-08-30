import 'package:afrypay/common/app_buttons.dart';
import 'package:afrypay/common/app_theme.dart';
import 'package:afrypay/common/routes.dart';
import 'package:afrypay/common/size_config.dart';
import 'package:afrypay/modules/splash/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class OnboardingPages extends StatefulWidget {
  const OnboardingPages({super.key});

  @override
  State<OnboardingPages> createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        builder: (OnboardingController controller) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Spacer(),
                SizedBox(
                  height: 500.h, // getProportionateScreenHeight(500, context),
                  child: Center(
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.pages.length,
                      controller: controller.pageController,
                      onPageChanged: (index) {
                        controller.changePage(index);
                      },
                      itemBuilder: (context, index) => controller.pages[index],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      controller.pages.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: () {
                            // printer(index);
                            controller.jumpToIndex(index);
                          },
                          child: AnimatedContainer(
                            height: 10,
                            width: index == controller.index ? 50 : 10,
                            duration: const Duration(milliseconds: 500),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                index == controller.index ? 5 : 10,
                              ),
                              color: index == controller.index
                                  ? primaryColors
                                  : HexColor("E0E0E3"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.offAllNamed(onboardingLoginScreen);
                        },
                        child: Text(
                          "Passer",
                          style: appTextStyle.copyWith(
                            // fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomAppPrimaryButton(
                        radius: 8,
                        height: 50.h,
                        onpressed: () {
                          if (controller.index == controller.pages.length - 1) {
                            Get.offAllNamed(onboardingLoginScreen);
                          } else {
                            controller.nextPages();
                          }
                        },
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.index == controller.pages.length - 1
                                  ? "Continuer"
                                  : "Suivant",
                              style: appTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: white,
                              ),
                            ),
                            spacerWidth(15),
                            Icon(
                              Icons.arrow_forward,
                              color: AppThemes.whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                spacerHeight(30),
              ],
            ),
          );
        },
      ),
    );
  }
}
