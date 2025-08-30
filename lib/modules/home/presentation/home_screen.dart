import 'package:afrypay/common/app_buttons.dart';
import 'package:afrypay/common/app_theme.dart';
import 'package:afrypay/common/size_config.dart';
import 'package:afrypay/modules/home/controllers/app_controller.dart';
import 'package:afrypay/modules/home/controllers/bottom_navigation_baar_controller.dart';
import 'package:afrypay/modules/home/presentation/component/build_wallet.dart';
import 'package:afrypay/modules/transactions/presentations/components/transaction_home_list_component.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HommeScreen extends StatefulWidget {
  const HommeScreen({super.key});

  @override
  State<HommeScreen> createState() => _HommeScreenState();
}

class _HommeScreenState extends State<HommeScreen> with WidgetsBindingObserver {
  CarouselSliderController carouselController = CarouselSliderController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {}
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApppController>(
      builder: (controller) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(40.h + 42.h),
            child: Container(
              decoration: BoxDecoration(color: titlePrimaryColors),
              child: Column(
                children: [
                  spacerHeight(40),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      spacerWidth(16),
                      Container(
                        height: getProportionateScreenHeight(46),
                        width: getProportionateScreenHeight(46),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: white),
                          color: primaryColors,
                          image: const DecorationImage(
                            image: AssetImage("assets/profile_image.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      spacerWidth(15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Bienvenus',
                            style: TextStyle(
                              color: white54,
                              fontSize: 14.h,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            controller.users?.name ?? 'Dans @Fric pay',
                            style: TextStyle(
                              color: white,
                              fontSize: 20.h,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: getProportionateScreenHeight(40),
                            width: getProportionateScreenHeight(40),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: primaryColors,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/icons/menu_icon.svg",
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: getProportionateScreenHeight(40),
                          width: getProportionateScreenHeight(40),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryColors,
                          ),
                          child: const Center(
                            child: Icon(Icons.notifications_outlined),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: Stack(
            children: [
              const HomeBackgourndWidget(),
              Column(
                children: [
                  BuildHomeCaroucel(
                    carouselController: carouselController,
                    controller: controller,
                  ),
                  spacerHeight(15),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {},
                      child: ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15,
                              right: 15,
                              left: 15,
                            ),
                            child: Row(
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
                                    radius: 8,
                                    onpressed: () {
                                      Get.find<BottomNavigationController>()
                                          .chanIndex(1);
                                    },
                                    title: 'Voir Tout',
                                    textColor: titlePrimaryColors,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          spacerHeight(15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TransactionHomeListComponent(),
                          ),
                          spacerHeight(30),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class BuildHomeCaroucel extends StatelessWidget {
  final ApppController controller;
  const BuildHomeCaroucel({
    super.key,
    required this.carouselController,
    required this.controller,
  });

  final CarouselSliderController carouselController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: CarouselSlider(
        carouselController: carouselController,
        options: CarouselOptions(
          height: getProportionateScreenHeight(140),
          scrollDirection: Axis.horizontal,
          // aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.2,
          onPageChanged: (index, reason) {
            if (index == 0) {}
          },
        ),
        items: [
          Card(child: BuildWalletNatif(title: 'Compte Principal')),
          Card(child: BuildWalletNatif(title: 'Solde Épargne')),
        ],
      ),
    );
  }
}

class HomeBackgourndWidget extends StatelessWidget {
  const HomeBackgourndWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 170.h - 88.h,
          child: Container(
            decoration: BoxDecoration(
              color: titlePrimaryColors,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(getProportionateScreenHeight(20)),
              ),
            ),
          ),
        ),
        const Expanded(child: SizedBox.shrink()),
      ],
    );
  }
}
