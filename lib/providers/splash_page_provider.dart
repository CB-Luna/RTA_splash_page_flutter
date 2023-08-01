import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meraki_splash_page/helpers/constants.dart';

class SplashPageProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();

  String? baseGrantUrl;
  String? userContinueUrl;
  String? nodeMac;
  String? clientIp;
  String? clientMac;

  void initParameters(Map<String, String> parameters) {
    print(parameters);
    baseGrantUrl = parameters['base_grant_url'];
    userContinueUrl = parameters['user_continue_url'];
    nodeMac = parameters['node_mac'];
    clientIp = parameters['client_ip'];
    clientMac = parameters['client_mac'];
  }

  Future<void> saveEmail() async {
    try {
      final res = await supabase.from('email').insert({
        'email': emailController.text,
        'client_ip': clientIp,
        'client_mac': clientMac,
        'node_mac': nodeMac,
      });
      print('Respuesta - $res');
    } catch (e) {
      log('Error in saveEmail() - $e');
      print('Error en saveEmail() - $e');
    }
  }
}
