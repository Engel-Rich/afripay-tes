import 'package:afrypay/modules/splash/presentation/onboarding/onboarding_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  PageController pageController = PageController(initialPage: 0);
  var index = 0;
  final pages = [component1, component2, component3];

  changePage(int index_) {
    index = index_;
    update();
  }

  jumpToIndex(int index_) {
    pageController.animateToPage(
      index_,
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );
    index = index_;
    update();
  }

  nextPages() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );
    update();
  }

  prevPages() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );
    update();
  }
}
