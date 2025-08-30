import 'package:afrypay/common/app_theme.dart';
import 'package:afrypay/common/size_config.dart';
import 'package:afrypay/common/textfield_app.dart';
import 'package:afrypay/modules/transactions/data/transaction_model.dart';
import 'package:afrypay/modules/transactions/presentations/components/transaction_component.dart';
import 'package:afrypay/modules/transactions/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TransactionHomeListComponent extends StatelessWidget {
  const TransactionHomeListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldApp(
          hintext: "Recherche de transaction".tr,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/icons/search_icon.svg",
              colorFilter: ColorFilter.mode(
                context.titleLargeColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        spacerHeight(15),
        GetBuilder<TransactionsController>(
          builder: (controller) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: transactionsListFacker.length,
              itemBuilder: (_, index) {
                return TransactionComponent(
                  transactions: transactionsListFacker[index],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
