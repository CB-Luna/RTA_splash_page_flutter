import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meraki_splash_page/pages/splash_page/widgets/login_button.dart';

import 'package:meraki_splash_page/pages/splash_page/widgets/login_input_field.dart';
import 'package:meraki_splash_page/providers/providers.dart';
import 'package:meraki_splash_page/theme/theme.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final SplashPageProvider provider =
        Provider.of<SplashPageProvider>(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppTheme.of(context).primaryColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: 360,
            height: 300,
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
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Image(
                    width: 200,
                    height: 61.9,
                    image: AssetImage('assets/images/logo.png'),
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Please enter your email to connect to the Internet',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 10),
                  LoginInputField(
                    key: const Key('email'),
                    label: 'Email',
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
                  LoginButton(
                    buttonColor: AppTheme.of(context).primaryColor,
                    formKey: formKey,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
