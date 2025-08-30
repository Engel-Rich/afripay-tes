import 'package:afrypay/common/app_theme.dart';
import 'package:afrypay/common/size_config.dart';
import 'package:afrypay/modules/transactions/data/transaction_model.dart';
import 'package:afrypay/modules/transactions/data/transaction_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class TransactionComponent extends StatelessWidget {
  final Transactions transactions;
  const TransactionComponent({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return ListTile(
      onTap: () {
        // Get.toNamed(
        //   transactionDetailsScreen,
        //   arguments: {'transaction'.tr: transactions, 'new'.tr: false},
        // );
      },
      contentPadding: EdgeInsets.all(0),
      title: Text(
        TransactionType.interpret(transactions.type ?? ''),
        style: TextStyle(
          color: context.titleLargeColor,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      horizontalTitleGap: 8.w,

      leading: Container(
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.tertiary,
        ),
        child: Image.asset(
          transactions.image,
          height: 30.w,
          width: 30.w,
          color: AppThemes.primaryblue,
        ),
      ),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            transactions.isIn ? "Entrée".tr : 'Sortie'.tr,
            style: TextStyle(
              color: transactionColor(transactions.status ?? ''),
              fontWeight: FontWeight.w400,
            ),
          ),
          spacerWidth(5),
          Icon(
            transactions.isIn ? Icons.trending_up : Icons.trending_down,
            color: transactions.isIn ? primaryColors : redColors,
          ),
          spacerWidth(8),
          Text(
            statuInterpret(transactions.status ?? ''),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12.w,
              color: transactionColor(transactions.status ?? ''),
            ),
          ),
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${transactions.isIn ? transactions.amount : -transactions.amount} FCFA"
                .tr,
            style: TextStyle(
              fontSize: 20,
              color: (transactions.isIn) ? primaryColors : redColors,
            ),
          ),
          spacerHeight(2),
          Text(
            DateFormat(
              "d MMMM y h:mm".tr,
              "FR_fr",
            ).format(transactions.createdAt ?? DateTime.now()),
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
