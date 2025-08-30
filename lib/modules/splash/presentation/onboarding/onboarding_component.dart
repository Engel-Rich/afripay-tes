import 'package:afrypay/common/app_theme.dart';
import 'package:afrypay/common/size_config.dart';
import 'package:flutter/material.dart';

class OnboardingComponent extends StatelessWidget {
  final String title;
  final String assets;
  final String description;
  const OnboardingComponent({
    super.key,
    required this.assets,
    required this.description,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(assets),
          spacerHeight(20),
          Text(
            title,
            style: appTextStyle.copyWith(
              color: AppThemes.primaryblue,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          spacerHeight(20),
          Text(
            description,
            style: appTextStyle.copyWith(
              // color: secondaryTextColors,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          spacerHeight(20),
        ],
      ),
    );
  }
}

const OnboardingComponent component1 = OnboardingComponent(
  assets: 'assets/onboarding2.png',
  description:
      'Avec Relax, Effectuez des paiements rapides et sécurisés sans contact avec votre bracelet.',
  title: 'Dites adieu aux portefeuilles et aux cartes de crédit.',
);
const OnboardingComponent component2 = OnboardingComponent(
  assets: 'assets/onboarding2v.png',
  description:
      'Configurez votre bracelet en quelques minutes et commencez à payer instantanément.',
  title: 'Payez en quelques minutes avec votre bracelet',
);
const OnboardingComponent component3 = OnboardingComponent(
  assets: 'assets/onbording3.png',
  description:
      'Relax utilise la technologie de pointe pour protéger vos informations personnelles et financières.',
  title: 'Votre sécurité est notre priorité.',
);
