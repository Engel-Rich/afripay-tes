import 'package:afrypay/common/app_buttons.dart';
import 'package:afrypay/common/app_loaders.dart';
import 'package:afrypay/common/app_theme.dart';
import 'package:afrypay/common/routes.dart';
import 'package:afrypay/common/size_config.dart';
import 'package:afrypay/common/textfield_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DepositConfirmScreen extends StatefulWidget {
  const DepositConfirmScreen({super.key});

  @override
  State<DepositConfirmScreen> createState() => _DepositConfirmScreenState();
}

class _DepositConfirmScreenState extends State<DepositConfirmScreen> {
  TextEditingController controllerAmount = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController otpController = TextEditingController();
  final numbers = List.generate(10, (e) => e)..shuffle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacerHeight(15),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 10.h,
                    width: 95.h,
                    decoration: BoxDecoration(
                      color: context.tertiary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                spacerHeight(10),
                Text(
                  "Recharger votre compte Principal",
                  style: appTextStyle.copyWith(
                    fontSize: 24.w,
                    color: titlePrimaryColors,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                spacerHeight(15),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text:
                        "Votre argent est en sécurité et garanti par notre politique de dépôt",
                    style: appTextStyle.copyWith(
                      color: context.titleLargeColor,
                    ),
                  ),
                ),
                spacerHeight(30),
                Center(
                  child: const Text(
                    "Entrez votre code secret a six chiffres pour confirmer",
                  ),
                ),
                spacerHeight(5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: OtpFieldApp(
                    obscureText: false,
                    controller: otpController,
                    enabled: false,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return "Veuillez entrer le code de vérification".tr;
                      }
                      if (p0.length < 6) {
                        return "Veuillez entrer un code valide".tr;
                      }
                      return null;
                    },
                    onChanged: (value) async {
                      if (value.length == 6) {}
                    },
                  ),
                ),
                spacerHeight(20),
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: numbers
                            .sublist(0, 3)
                            .map(
                              (e) => NumberCompnent(
                                value: e,
                                ontap: () {
                                  otpController.text += e.toString();
                                  setState(() {});
                                },
                              ),
                            )
                            .toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: numbers
                            .sublist(3, 6)
                            .map(
                              (e) => NumberCompnent(
                                value: e,
                                ontap: () {
                                  otpController.text += e.toString();
                                  setState(() {});
                                },
                              ),
                            )
                            .toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: numbers
                            .sublist(6, 9)
                            .map(
                              (e) => NumberCompnent(
                                value: e,
                                ontap: () {
                                  otpController.text += e.toString();
                                  setState(() {});
                                },
                              ),
                            )
                            .toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NumberCompnent(
                            child: SvgPicture.string(
                              svgFinger,
                              color: titlePrimaryColors,
                            ),
                          ),
                          NumberCompnent(value: numbers.last),
                          NumberCompnent(
                            child: SvgPicture.string(
                              svgGomme,
                              color: titlePrimaryColors,
                            ),
                            ontap: () {
                              if (otpController.text.trim().isEmpty) {
                                return;
                              }
                              otpController.text = otpController.text.substring(
                                0,
                                otpController.text.length - 1,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                spacerHeight(30),
                Row(
                  children: [
                    Expanded(
                      child: CustomAppPrimaryButton(
                        color: primaryColors.withAppOppacity(0.3),
                        onpressed: () {
                          Navigator.pop(context);
                        },
                        title: 'Anuller',
                      ),
                    ),
                    spacerWidth(15),
                    Expanded(
                      child: CustomAppPrimaryButton(
                        onpressed: () async {
                          if (formkey.currentState!.validate()) {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Get.toNamed(transactionsSuccessScreen);
                          }
                        },
                        widget: isLoading
                            ? const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: AppLoader(size: 25),
                                ),
                              )
                            : null,
                        title: isLoading ? null : 'Continuer',
                      ),
                    ),
                  ],
                ),
                spacerHeight(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NumberCompnent extends StatelessWidget {
  final Widget? child;
  final int? value;
  final Color? bgColr;
  final Color? boderColr;
  final void Function()? ontap;
  const NumberCompnent({
    super.key,
    this.value,
    this.child,
    this.bgColr,
    this.boderColr,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 60.h,
        width: 60.h,
        decoration: BoxDecoration(
          color: bgColr,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(color: boderColr ?? titlePrimaryColors),
        ),
        child: Center(
          child:
              child ??
              Text(
                "$value",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: titlePrimaryColors,
                ),
              ),
        ),
      ),
    );
  }
}

const svgGomme =
    '<svg width="31" height="31" viewBox="0 0 31 31" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M28.4062 26.1135H6.84375V27.9885H28.4062V26.1135Z" fill="#235634"/><path d="M25.9499 10.6541L18.5155 3.22911C18.3414 3.05478 18.1346 2.91648 17.907 2.82212C17.6794 2.72777 17.4354 2.6792 17.189 2.6792C16.9426 2.6792 16.6986 2.72777 16.471 2.82212C16.2433 2.91648 16.0365 3.05478 15.8624 3.22911L2.73741 16.3541C2.56308 16.5282 2.42478 16.735 2.33043 16.9627C2.23607 17.1903 2.1875 17.4343 2.1875 17.6807C2.1875 17.9271 2.23607 18.1711 2.33043 18.3987C2.42478 18.6263 2.56308 18.8331 2.73741 19.0072L6.96554 23.301H15.9562L25.9499 13.3072C26.1242 13.1331 26.2625 12.9263 26.3569 12.6987C26.4513 12.4711 26.4998 12.2271 26.4998 11.9807C26.4998 11.7343 26.4513 11.4903 26.3569 11.2627C26.2625 11.035 26.1242 10.8282 25.9499 10.6541ZM15.178 21.426H7.78116L4.03116 17.676L9.94679 11.7604L17.3812 19.1854L15.178 21.426ZM18.703 17.901L11.278 10.4666L17.1562 4.55099L24.6562 11.9854L18.703 17.901Z" fill="#235634"/></svg>';
const svgFinger =
    '<svg width="25" height="29" viewBox="0 0 25 29" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M2.67843 5.79822C5.01537 3.82269 7.97631 2.51727 11.2281 2.21045L11.2902 2.20575C15.3024 2.20575 18.9965 3.56669 21.9368 5.85186L21.8972 5.82269C22.0111 5.90457 22.1523 5.95257 22.3057 5.95257C22.6963 5.95257 23.0125 5.63633 23.0125 5.24575C23.0125 5.00951 22.8968 4.80057 22.7189 4.67257L22.717 4.67069C19.5857 2.2528 15.6055 0.794922 11.2845 0.794922C11.2582 0.794922 11.2328 0.794922 11.2064 0.794922H11.2102C7.58949 1.12339 4.35184 2.54175 1.77113 4.71586L1.79654 4.69516C1.63278 4.82598 1.52925 5.02457 1.52925 5.24763C1.52925 5.63727 1.84549 5.95351 2.23513 5.95351C2.40266 5.95351 2.55701 5.8961 2.67843 5.79822ZM24.0987 10.4175C20.1777 6.11445 16.189 3.93186 12.238 3.93186H12.1965C8.25866 3.94786 4.31137 6.13045 0.461956 10.4213C0.349956 10.5455 0.28125 10.7112 0.28125 10.8928C0.28125 11.2825 0.597485 11.5987 0.987132 11.5987C1.19607 11.5987 1.38337 11.5083 1.51231 11.3643L1.51325 11.3634C5.08407 7.38222 8.68031 5.3568 12.2012 5.34363C15.774 5.3201 19.3984 7.3568 23.053 11.3672C23.1829 11.5093 23.3683 11.5977 23.5754 11.5977C23.965 11.5977 24.2812 11.2815 24.2812 10.8919C24.2812 10.7083 24.2116 10.5417 24.0968 10.4166L24.0987 10.4175ZM18.5693 25.6542C16.9843 25.2363 15.646 24.3488 14.6737 23.1535L14.6634 23.1403C13.6902 21.865 13.0709 20.2726 12.9768 18.5408L12.9758 18.5192C12.9307 18.1606 12.6276 17.8867 12.2615 17.8867C12.2408 17.8867 12.221 17.8876 12.2003 17.8895H12.2031C11.8445 17.9272 11.5678 18.2265 11.5678 18.5916C11.5678 18.617 11.5688 18.6415 11.5716 18.666V18.6632C11.7005 20.7008 12.43 22.5465 13.582 24.0505L13.565 24.0269C14.7368 25.4688 16.3321 26.5248 18.1598 27.0095L18.221 27.0236C18.2737 27.0377 18.334 27.0453 18.3951 27.0453C18.7848 27.0453 19.101 26.729 19.101 26.3394C19.101 26.0119 18.878 25.7361 18.5749 25.657L18.5702 25.6561L18.5693 25.6542ZM16.1354 8.39869C14.957 7.92622 13.5914 7.65233 12.1617 7.65233C11.6102 7.65233 11.0681 7.6928 10.5382 7.77186L10.5984 7.76433C8.58149 8.10504 6.80643 8.95775 5.35701 10.1841L5.37301 10.1709C3.2629 11.8989 1.75231 14.2876 1.15466 17.018L1.1396 17.0989C1.05207 17.5093 0.983368 17.9187 0.925015 18.3874C0.897721 18.6914 0.881721 19.0462 0.881721 19.4039C0.881721 22.1945 1.83419 24.7629 3.43137 26.8015L3.4116 26.7752C3.54243 26.937 3.74007 27.0396 3.96219 27.0396C4.35184 27.0396 4.66807 26.7234 4.66807 26.3337C4.66807 26.1662 4.60972 26.0119 4.51184 25.8914L4.51278 25.8923C3.12643 24.1333 2.28878 21.8857 2.28878 19.4415C2.28878 19.114 2.30384 18.7902 2.33301 18.4702L2.33019 18.5116C2.37788 18.1345 2.44094 17.7615 2.51937 17.3926C3.06337 14.9032 4.40266 12.7883 6.25207 11.274L6.2709 11.2589C7.51701 10.2029 9.0596 9.45939 10.7575 9.16763L10.814 9.1601C11.2177 9.09986 11.6827 9.06598 12.1561 9.06598C13.4078 9.06598 14.6031 9.30598 15.6987 9.74175L15.6337 9.71916C18.558 10.8486 20.7923 13.1977 21.7438 16.1257L21.7645 16.1982C22.2812 17.8716 22.4281 20.8109 21.3598 21.9789C21.0323 22.2989 20.5853 22.4956 20.0911 22.4956C19.885 22.4956 19.6864 22.4608 19.502 22.3977L19.5151 22.4015C18.8158 22.2161 18.2144 21.865 17.7335 21.3916L17.7344 21.3926C17.3805 21.1017 17.1001 20.7347 16.9165 20.3159L16.909 20.297C16.8074 19.9582 16.7481 19.5686 16.7481 19.1657C16.7481 19.1366 16.7481 19.1083 16.749 19.0792V19.0839C16.749 19.0754 16.749 19.066 16.749 19.0566C16.749 18.5342 16.6775 18.0279 16.5448 17.5479L16.5542 17.5874C16.0582 16.2641 14.9692 15.2665 13.6196 14.906L13.5895 14.8994C13.1537 14.7375 12.6511 14.6434 12.126 14.6434C11.8022 14.6434 11.4869 14.6792 11.1838 14.7469L11.2121 14.7413C10.3528 14.9945 9.62619 15.4792 9.08313 16.1239L9.07749 16.1305C8.43843 16.794 7.97913 17.6335 7.77866 18.57L7.77301 18.6029C7.76548 18.7319 7.76078 18.8825 7.76078 19.034C7.76078 21.145 8.59749 23.0603 9.95654 24.4674L9.95466 24.4655C11.2394 26.0034 12.6276 27.37 14.1372 28.5926L14.1937 28.6368C14.3161 28.7432 14.477 28.8072 14.654 28.8072C15.0436 28.8072 15.3598 28.4909 15.3598 28.1013C15.3598 27.8839 15.262 27.69 15.1076 27.5601L15.1067 27.5592C13.614 26.3526 12.2897 25.0519 11.1001 23.6345L11.0643 23.5902C9.88878 22.4373 9.15937 20.8326 9.15937 19.0575C9.15937 18.9869 9.16031 18.9163 9.16313 18.8467V18.857C9.32125 18.1587 9.66007 17.5554 10.1269 17.0792L10.126 17.0801C10.4921 16.6321 10.9796 16.2961 11.5368 16.1182L11.5584 16.1126C11.7288 16.0777 11.9245 16.057 12.125 16.057C12.4958 16.057 12.8507 16.1257 13.1782 16.2509L13.1584 16.2443C14.093 16.4787 14.8394 17.13 15.2008 17.9827L15.2083 18.0025C15.293 18.3281 15.341 18.7027 15.341 19.0886C15.341 19.1055 15.341 19.1224 15.341 19.1394V19.1366C15.341 19.1545 15.341 19.1761 15.341 19.1968C15.341 19.7634 15.4314 20.3093 15.598 20.8203L15.5876 20.7836C15.8577 21.4443 16.2671 21.9987 16.782 22.4326L16.7885 22.4382C17.4464 23.0745 18.27 23.5432 19.1876 23.7756L19.2243 23.7832C19.4925 23.865 19.8003 23.9121 20.1194 23.9121C21.0191 23.9121 21.8314 23.5366 22.4074 22.9333L22.4083 22.9323C23.998 21.1949 23.6874 17.625 23.1198 15.7832C22.014 12.3657 19.47 9.68904 16.2191 8.42786L16.1401 8.40057L16.1354 8.39869ZM5.94713 19.0697C5.99607 17.1272 6.91372 15.4086 8.32454 14.281L8.33678 14.2716C8.87702 13.8114 9.49819 13.4236 10.1721 13.1347L10.2191 13.1168C10.9721 12.7883 11.8492 12.5973 12.7716 12.5973C13.8022 12.5973 14.7772 12.8363 15.645 13.2608L15.6064 13.2439C17.597 14.4627 18.9053 16.6265 18.9053 19.0952C18.9053 19.2006 18.9024 19.306 18.8977 19.4104L18.8987 19.3954C18.9175 19.7709 19.2262 20.0683 19.6045 20.0683C19.9951 20.0683 20.3114 19.7521 20.3114 19.3615C20.3114 19.3512 20.3114 19.3417 20.3104 19.3314V19.3333C20.3161 19.2232 20.3189 19.0942 20.3189 18.9643C20.3189 15.9855 18.6935 13.3869 16.2812 12.0053L16.2417 11.9846C15.2271 11.481 14.0328 11.1865 12.7688 11.1865C11.6516 11.1865 10.5881 11.417 9.62337 11.8321L9.67513 11.8123C8.81396 12.1785 8.07231 12.6406 7.41537 13.2006L7.4276 13.1902C5.71184 14.5822 4.60501 16.6669 4.53537 19.0123V19.0236C4.65301 22.729 6.29537 26.0297 8.8516 28.3347L8.8629 28.345C8.98901 28.4655 9.16125 28.5399 9.35043 28.5399C9.74007 28.5399 10.0563 28.2236 10.0563 27.834C10.0563 27.6335 9.97254 27.4519 9.83796 27.3229C7.54713 25.2768 6.07513 22.3563 5.94713 19.0914L5.94619 19.0697H5.94713Z" fill="#235634"/></svg>';
