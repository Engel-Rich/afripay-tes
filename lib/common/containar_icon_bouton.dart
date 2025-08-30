import 'package:afrypay/common/app_theme.dart';
import 'package:afrypay/common/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContainerIconButton extends StatelessWidget {
  final Color? color;
  final Widget child;
  final VoidCallback? ontap;
  final double? padding;
  final double? margin;
  const ContainerIconButton({
    super.key,
    required this.child,
    this.color,
    this.ontap,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(padding ?? 5),
        margin: EdgeInsets.all(margin ?? 5),
        decoration: BoxDecoration(
          color: color ?? primaryColors.withAppOppacity(0.4),
          borderRadius: BorderRadius.circular(5),
        ),
        child: child,
      ),
    );
  }
}

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.h,
      padding: EdgeInsets.all(6.w),
      decoration: BoxDecoration(
        color: context.tertiary,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        'assets/icons/arrow_back.svg',
        colorFilter: ColorFilter.mode(context.titleLargeColor, BlendMode.srcIn),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final VoidCallback? onTapBack;
  final Color? appBarbackgroundColor;
  final bool hasLeading;
  const CustomAppBar({
    super.key,
    required this.title,
    this.onTapBack,
    this.actions,
    this.appBarbackgroundColor,
    this.hasLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const SizedBox.shrink(),
      backgroundColor: appBarbackgroundColor,
      leadingWidth: 0.0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (hasLeading)
            GestureDetector(onTap: onTapBack, child: AppBackButton()),

          Expanded(
            child: Center(
              child: Text(
                title,
                style: appTextStyle.copyWith(color: context.titleLargeColor),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
          ),

          if (actions != null) ...actions!,
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class RowValue extends StatelessWidget {
  final String title;
  final String value;
  final Color? valueColor;
  const RowValue({
    super.key,
    required this.title,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(child: Text(title, textAlign: TextAlign.start)),
        spacerWidth(8),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: appTextStyle.copyWith(
              fontWeight: FontWeight.bold,
              color: valueColor ?? context.titleLargeColor,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
