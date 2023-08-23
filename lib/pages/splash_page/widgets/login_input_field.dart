import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: size.width > 1500 ? 600 : 400,
        height: 80,
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
              contentPadding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 22,
                bottom: 22,
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
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppTheme.of(context).primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              focusColor: AppTheme.of(context).primaryColor,
            ),
            style: GoogleFonts.poppins(
              color: AppTheme.of(context).primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
