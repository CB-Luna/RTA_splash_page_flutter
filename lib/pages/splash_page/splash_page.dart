import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:meraki_splash_page/helpers/constants.dart';
import 'package:meraki_splash_page/pages/splash_page/widgets/email_form_widget.dart';
import 'package:meraki_splash_page/providers/providers.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage('assets/images/FondoMovil.png'), context);
    precacheImage(const AssetImage('assets/images/FondoWeb.png'), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > mobileSize) {
              return const SplashPageDesktop();
            } else {
              return const SplashPageMobile();
            }
          },
        ),
      ),
    );
  }
}

class SplashPageDesktop extends StatefulWidget {
  const SplashPageDesktop({super.key});

  @override
  State<SplashPageDesktop> createState() => _SplashPageDesktopState();
}

class _SplashPageDesktopState extends State<SplashPageDesktop> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
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
          Positioned(
            bottom: 20,
            right: 20,
            child: Image(
              image: const AssetImage('assets/images/Nascar75.png'),
              height: size.width > 1500 ? 275 : 150,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
            ),
          ),
          const Center(child: EmailFormWidget()),
          Positioned(
            left: 45,
            bottom: 0,
            child: Image(
              image: const AssetImage('assets/images/Camioneta.png'),
              height: size.width > 1500 ? 375 : 200,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
            ),
          ),
        ],
      ),
    );
  }
}

class SplashPageMobile extends StatefulWidget {
  const SplashPageMobile({super.key});

  @override
  State<SplashPageMobile> createState() => _SplashPageMobileState();
}

class _SplashPageMobileState extends State<SplashPageMobile> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final SplashPageProvider provider =
        Provider.of<SplashPageProvider>(context);

    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/FondoMovil.png'),
          filterQuality: FilterQuality.high,
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 140,
            left: size.width / 5,
            child: const Image(
              image: AssetImage('assets/images/Zane.png'),
              height: 300,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
            ),
          ),
          Positioned(
            bottom: 10,
            left: size.width / 3.2,
            child: const Image(
              image: AssetImage('assets/images/Nascar75.png'),
              height: 125,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
            ),
          ),
          const Center(child: EmailFormWidget()),
          const Positioned(
            left: 10,
            bottom: 100,
            child: Image(
              image: AssetImage('assets/images/Camioneta.png'),
              height: 200,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
            ),
          ),
        ],
      ),
    );
  }
}
