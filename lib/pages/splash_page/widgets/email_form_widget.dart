import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:meraki_splash_page/helpers/constants.dart';
import 'package:provider/provider.dart';

import 'package:meraki_splash_page/pages/splash_page/widgets/login_button.dart';
import 'package:meraki_splash_page/pages/splash_page/widgets/login_input_field.dart';
import 'package:meraki_splash_page/providers/splash_page_provider.dart';
import 'package:meraki_splash_page/theme/theme.dart';

class EmailFormWidget extends StatefulWidget {
  const EmailFormWidget({
    super.key,
  });

  @override
  State<EmailFormWidget> createState() => _EmailFormWidgetState();
}

class _EmailFormWidgetState extends State<EmailFormWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > mobileSize) {
          return const EmailFormWidgetDesktop();
        } else {
          return const EmailFormWidgetMobile();
        }
      },
    );
  }
}

class EmailFormWidgetDesktop extends StatefulWidget {
  const EmailFormWidgetDesktop({super.key});

  @override
  State<EmailFormWidgetDesktop> createState() => _EmailFormWidgetDesktopState();
}

class _EmailFormWidgetDesktopState extends State<EmailFormWidgetDesktop> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final SplashPageProvider provider =
        Provider.of<SplashPageProvider>(context);

    return Container(
      margin: const EdgeInsets.only(left: 55, top: 150),
      padding: const EdgeInsets.all(20),
      width: size.width > 1500 ? 750 : 600,
      height: 500,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 15,
              color: Color(0xFF000080),
            ),
          ]),
      child: Stack(
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Image(
                  width: 570,
                  height: 150,
                  image: AssetImage('assets/images/guestwifi_logo.png'),
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.email_outlined,
                      color: AppTheme.of(context).primaryColor,
                      size: 60,
                    ),
                    const SizedBox(width: 10),
                    LoginInputField(
                      key: const Key('email'),
                      label: 'Connect with Email',
                      hint: 'Email',
                      controller: provider.emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'The email is required';
                        } else if (!EmailValidator.validate(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                LoginButton(
                  primaryColor: const Color(0xFF00C0A3),
                  secondaryColor: Colors.white,
                  formKey: formKey,
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 10,
            right: 10,
            child: Image(
              width: 150,
              image: AssetImage('assets/images/logo.png'),
              filterQuality: FilterQuality.high,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

class EmailFormWidgetMobile extends StatefulWidget {
  const EmailFormWidgetMobile({super.key});

  @override
  State<EmailFormWidgetMobile> createState() => _EmailFormWidgetMobileState();
}

class _EmailFormWidgetMobileState extends State<EmailFormWidgetMobile> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final SplashPageProvider provider =
        Provider.of<SplashPageProvider>(context);

    return Container(
      margin: const EdgeInsets.only(top: 150),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      width: 300,
      height: 250,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 15,
              color: Color(0xFF000080),
            ),
          ]),
      child: Stack(
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Image(
                  width: 200,
                  height: 62,
                  image: AssetImage('assets/images/guestwifi_logo.png'),
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.email_outlined,
                      color: AppTheme.of(context).primaryColor,
                      size: 40,
                    ),
                    const SizedBox(width: 5),
                    LoginInputField(
                      key: const Key('email'),
                      label: 'Please enter your email address',
                      hint: 'Email',
                      controller: provider.emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'The email is required';
                        } else if (!EmailValidator.validate(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                LoginButton(
                  primaryColor: const Color(0xFF00C0A3),
                  secondaryColor: Colors.white,
                  formKey: formKey,
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 10,
            child: Image(
              width: 50,
              image: AssetImage('assets/images/logo.png'),
              filterQuality: FilterQuality.high,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
