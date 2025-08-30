import 'package:afrypay/common/app_theme.dart';
import 'package:afrypay/modules/home/controllers/bottom_navigation_baar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ApplicationHomeScreen extends StatefulWidget {
  const ApplicationHomeScreen({super.key});

  @override
  State<ApplicationHomeScreen> createState() => _ApplicationHomeScreenState();
}

class _ApplicationHomeScreenState extends State<ApplicationHomeScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    intit();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {}

  void intit() {}

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(
      init: BottomNavigationController(),
      builder: (controller) {
        return Scaffold(
          body: controller.pages[controller.currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: context.tertiary, width: 2),
              ),
            ),
            child: BottomNavigationBar(
              elevation: 0,
              selectedItemColor: AppThemes.primaryColor,
              unselectedItemColor: Theme.of(
                context,
              ).textTheme.titleLarge!.color,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedLabelStyle: appTextStyle.copyWith(
                color: AppThemes.primaryColor,
              ),
              unselectedLabelStyle: appTextStyle.copyWith(
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
              items: controller.svgIconAssets.map((element) {
                return BottomNavigationBarItem(
                  label: element.label.tr,
                  icon: SvgPicture.asset(
                    element.asset,
                    height: 30,
                    width: 30,
                    colorFilter: ColorFilter.mode(
                      context.titleLargeColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  activeIcon: SvgPicture.asset(
                    element.asset,
                    height: 30,
                    width: 30,
                    colorFilter: ColorFilter.mode(
                      AppThemes.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                );
              }).toList(),
              currentIndex: controller.currentIndex,
              onTap: controller.chanIndex,
            ),
          ),
        );
      },
    );
  }
}
