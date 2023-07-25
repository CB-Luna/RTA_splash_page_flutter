import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meraki_splash_page/helpers/constants.dart';

class SplashPageProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();

  Future<void> saveEmail() async {
    try {
      await supabase.from('email').insert({'email': emailController.text});
    } catch (e) {
      log('Error in saveEmail() - $e');
    }
  }
}
