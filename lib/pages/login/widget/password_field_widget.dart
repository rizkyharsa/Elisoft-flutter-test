import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordFieldWidget extends StatefulWidget {
  const PasswordFieldWidget({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController passwordController;

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color(0xFF247881).withOpacity(.3),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Password",
                  style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF006778)),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: TextField(
                    obscureText: _obscureText,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                    ),
                    controller: widget.passwordController,
                    decoration: const InputDecoration.collapsed(hintText: ""),
                    cursorColor: const Color(0xFF006778),
                  ),
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _obscureText =! _obscureText;
              });
            },
            icon: Icon(_obscureText?Icons.visibility:Icons.visibility_off),
            color: const Color(0xFF006778),
          ),
        ],
      ),
    );
  }
}