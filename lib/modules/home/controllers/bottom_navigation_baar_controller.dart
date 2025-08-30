import 'package:afrypay/modules/home/presentation/home_screen.dart';
import 'package:afrypay/modules/transactions/presentations/transactions_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  int currentIndex = 0;

  chanIndex(int index) {
    currentIndex = index;
    update();
  }

  List<Widget> pages = [
    HommeScreen(),
    TransactionsHistoryScreen(),
    Container(),
  ];

  List<BottomNivigationElement> svgIconAssets = [
    BottomNivigationElement.bottomNavigationElement(
      "assets/icons/home_icons.svg",
      "Accueil",
    ),
    BottomNivigationElement.bottomNavigationElement(
      "assets/icons/history_icon.svg",
      "Historique",
    ),
    BottomNivigationElement.bottomNavigationElement(
      "assets/icons/profile_icone.svg",
      "Compte",
    ),
  ];
}

class BottomNivigationElement {
  final String asset;
  final String label;
  BottomNivigationElement.bottomNavigationElement(this.asset, this.label);
}
