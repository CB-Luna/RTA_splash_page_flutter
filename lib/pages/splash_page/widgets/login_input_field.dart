import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meraki_splash_page/helpers/constants.dart';
import 'package:meraki_splash_page/theme/theme.dart';

class LoginInputField extends StatefulWidget {
  const LoginInputField({
    Key? key,
    required this.label,
    this.hint,
    required this.controller,
    this.validator,
    this.unfocusedTextColor = Colors.grey,
  }) : super(key: key);

  final String label;
  final String? hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Color unfocusedTextColor;

  @override
  State<LoginInputField> createState() => _LoginInputFieldState();
}

class _LoginInputFieldState extends State<LoginInputField> {
  late Color currentTextColor;

  @override
  void initState() {
    currentTextColor = widget.unfocusedTextColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    double widgetWidth = 600;

    if (size.width > 1500) {
      widgetWidth = 600;
    } else if (size.width > 700) {
      widgetWidth = 400;
    } else {
      widgetWidth = 240;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: widgetWidth,
        height: size.width > mobileSize ? 80 : 30,
        child: FocusScope(
          onFocusChange: (value) {
            if (value) {
              currentTextColor = AppTheme.of(context).primaryColor;
            } else {
              currentTextColor = Colors.grey;
            }
            setState(() {});
          },
          child: TextFormField(
            key: widget.key,
            controller: widget.controller,
            validator: widget.validator,
            decoration: InputDecoration(
              isCollapsed: true,
              isDense: true,
              contentPadding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: size.width > mobileSize ? 22 : 10,
                bottom: size.width > mobileSize ? 22 : 10,
              ),
              labelText: widget.label,
              labelStyle: GoogleFonts.poppins(
                color: currentTextColor,
                fontWeight: FontWeight.normal,
              ),
              alignLabelWithHint: true,
              hintText: widget.hint,
              hintStyle: GoogleFonts.poppins(
                color: currentTextColor,
                fontWeight: FontWeight.normal,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme.of(context).primaryColor,
                  width: size.width > mobileSize ? 2 : 1,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme.of(context).primaryColor,
                  width: size.width > mobileSize ? 2 : 1,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: size.width > mobileSize ? 2 : 1,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: size.width > mobileSize ? 2 : 1,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              focusColor: AppTheme.of(context).primaryColor,
            ),
            style: GoogleFonts.poppins(
              color: AppTheme.of(context).primaryColor,
              fontSize: size.width > mobileSize ? 20 : 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
