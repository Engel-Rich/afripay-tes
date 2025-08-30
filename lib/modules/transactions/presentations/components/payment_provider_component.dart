import 'package:afrypay/common/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PaymentProviderComponent extends StatelessWidget {
  final String title;
  final String logo;
  final bool enable;
  final VoidCallback? onTap;

  const PaymentProviderComponent({
    super.key,
    required this.title,
    required this.logo,
    this.enable = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: HexColor("FEF8E6"),
        borderRadius: BorderRadius.circular(10),
        border: enable ? Border.all(color: primaryColors) : null,
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(0),
        leading: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(8),
          child: Image.asset(logo),
        ),
        title: Text(title, style: TextStyle(fontSize: 18)),
        trailing: enable
            ? Icon(Icons.check_circle, color: primaryColors)
            : Icon(Icons.radio_button_off, color: Colors.grey),
      ),
    );
  }
}
