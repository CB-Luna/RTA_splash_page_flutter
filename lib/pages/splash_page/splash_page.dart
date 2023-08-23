import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meraki_splash_page/pages/splash_page/widgets/login_button.dart';

import 'package:meraki_splash_page/pages/splash_page/widgets/login_input_field.dart';
import 'package:meraki_splash_page/providers/providers.dart';
import 'package:meraki_splash_page/theme/theme.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final SplashPageProvider provider =
        Provider.of<SplashPageProvider>(context);
    return Scaffold(
      key: scaffoldKey,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/FondoWeb.png'),
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: -10,
                left: size.width / 2 - 190,
                child: const Image(
                  image: AssetImage('assets/images/Zane.png'),
                  height: 500,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                ),
              ),
              const Positioned(
                bottom: 20,
                right: 20,
                child: Image(
                  image: AssetImage('assets/images/Nascar75.png'),
                  height: 275,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(left: 55, top: 150),
                  padding: const EdgeInsets.all(20),
                  width: 750,
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
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const Image(
                          width: 400,
                          height: 124,
                          image: AssetImage('assets/images/logo.png'),
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 80),
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
                        const SizedBox(height: 50),
                        LoginButton(
                          primaryColor: const Color(0xFF00C0A3),
                          secondaryColor: Colors.white,
                          formKey: formKey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 45,
                bottom: 0,
                child: Image(
                  image: AssetImage('assets/images/Camioneta.png'),
                  height: 375,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
