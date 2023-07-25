import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meraki_splash_page/theme/theme.dart';

class ThanksPage extends StatelessWidget {
  const ThanksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).primaryColor,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 450,
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
              const SizedBox(height: 10),
              const Icon(
                Icons.check,
                color: Colors.greenAccent,
                size: 75,
              ),
              Text(
                'Thanks! You are now connected to the Wifi network',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
