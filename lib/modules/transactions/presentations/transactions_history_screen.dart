import 'package:afrypay/common/containar_icon_bouton.dart';
import 'package:afrypay/modules/home/controllers/bottom_navigation_baar_controller.dart';
import 'package:afrypay/modules/transactions/data/transaction_model.dart';
import 'package:afrypay/modules/transactions/presentations/components/transaction_component.dart';
import 'package:afrypay/modules/transactions/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionsHistoryScreen extends StatelessWidget {
  const TransactionsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Historique",
        hasLeading: true,
        onTapBack: () {
          Get.find<BottomNavigationController>().chanIndex(0);
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: GetBuilder<TransactionsController>(
          builder: (controller) {
            return ListView.builder(
              itemCount: transactionsListFacker.length,
              itemBuilder: (_, index) {
                return TransactionComponent(
                  transactions: transactionsListFacker[index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
