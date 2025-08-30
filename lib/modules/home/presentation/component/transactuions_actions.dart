import 'package:afrypay/common/app_buttons.dart';
import 'package:afrypay/common/app_theme.dart';
import 'package:afrypay/common/size_config.dart';
import 'package:afrypay/modules/transactions/presentations/deposit_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TransactuionsActions extends StatelessWidget {
  const TransactuionsActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomAppPrimaryButton(
              radius: 8,
              onpressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  isDismissible: false,
                  backgroundColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (context) => RechargeComponent(),
                );
              },
              border: Border.all(color: primaryColors),
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Recharger",
                    style: TextStyle(
                      color: titlePrimaryColors,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.arrow_upward, size: 30, color: titlePrimaryColors),
                ],
              ),
            ),
          ),
          spacerWidth(15),
          Expanded(
            child: CustomAppPrimaryButton(
              radius: 8,
              onpressed: () {},
              color: HexColor("E8E9F1"),
              border: Border.all(color: titlePrimaryColors),
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Retrait",
                    style: TextStyle(
                      color: titlePrimaryColors,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_downward,
                    size: 30,
                    color: titlePrimaryColors,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
