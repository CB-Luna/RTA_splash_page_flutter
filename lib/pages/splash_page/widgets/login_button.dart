import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:meraki_splash_page/providers/providers.dart';
import 'package:meraki_splash_page/theme/theme.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({
    Key? key,
    required this.buttonColor,
    required this.formKey,
  }) : super(key: key);

  final Color buttonColor;
  final GlobalKey<FormState> formKey;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  late Color buttonColor;

  @override
  void initState() {
    buttonColor = widget.buttonColor;
    super.initState();
  }

  Color lighten(Color c, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var p = percent / 100;
    return Color.fromARGB(
      c.alpha,
      c.red + ((255 - c.red) * p).round(),
      c.green + ((255 - c.green) * p).round(),
      c.blue + ((255 - c.blue) * p).round(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final SplashPageProvider provider =
        Provider.of<SplashPageProvider>(context);
    return MouseRegion(
      onEnter: (event) {
        buttonColor = lighten(buttonColor, 10);
        setState(() {});
      },
      onExit: (event) {
        buttonColor = AppTheme.of(context).primaryColor;
        setState(() {});
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          if (!widget.formKey.currentState!.validate()) {
            return;
          }
          await provider.saveEmail();
          if (provider.baseGrantUrl == null) {
            print('BaseGranUrl is null');
            return;
          }
          final Uri url = Uri.parse(
              '${provider.baseGrantUrl}?continue_url=${provider.userContinueUrl}');
          print(url);
          try {
            await launchUrl(url, webOnlyWindowName: "_self");
          } catch (e) {
            log('Error on redirect - $e');
          }

          // if (!mounted) return;
          // context.pushReplacement('/thanks');
        },
        child: Container(
          height: 41,
          width: 150,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(7.75),
          ),
          child: Center(
            child: Text(
              'LOG IN TO WIFI',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
