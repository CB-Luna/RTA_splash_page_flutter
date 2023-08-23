import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:meraki_splash_page/providers/providers.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({
    Key? key,
    required this.primaryColor,
    required this.secondaryColor,
    required this.formKey,
  }) : super(key: key);

  final Color primaryColor;
  final Color secondaryColor;
  final GlobalKey<FormState> formKey;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  late Color primaryColor;
  late Color secondaryColor;

  void setColors(bool isPrimary) {
    if (isPrimary) {
      primaryColor = widget.primaryColor;
      secondaryColor = widget.secondaryColor;
    } else {
      primaryColor = widget.secondaryColor;
      secondaryColor = widget.primaryColor;
    }
  }

  @override
  void initState() {
    primaryColor = widget.primaryColor;
    secondaryColor = widget.secondaryColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SplashPageProvider provider =
        Provider.of<SplashPageProvider>(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => setColors(false)),
      onExit: (_) => setState(() => setColors(true)),
      child: GestureDetector(
        onTap: () async {
          if (!widget.formKey.currentState!.validate()) {
            return;
          }
          await provider.saveEmail();
          if (provider.baseGrantUrl == null) {
            return;
          }
          final Uri url = Uri.parse(
              '${provider.baseGrantUrl}?continue_url=${provider.userContinueUrl}');
          try {
            await launchUrl(url, webOnlyWindowName: "_self");
          } catch (e) {
            log('Error on redirect - $e');
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 60,
          width: 175,
          decoration: BoxDecoration(
            color: secondaryColor,
            border: Border.all(color: primaryColor),
            boxShadow: [
              BoxShadow(
                color: primaryColor,
                offset: const Offset(0, 2),
                blurRadius: 6,
              ),
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              'LOG IN TO WIFI',
              style: GoogleFonts.poppins(
                color: primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
