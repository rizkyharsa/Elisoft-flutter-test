import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomToast extends StatelessWidget {
  const CustomToast({
    super.key,
    this.backgroundColor,
    required this.message,
    this.icon,
  });

  final Color? backgroundColor;
  final String message;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color(0xFFB22727),
      ),
      child: Row(
        children: [
          Icon(icon,color: Colors.white,),
          const SizedBox(width: 8),
          Text(
            message,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

customToast(BuildContext context, String message,IconData icon) {
  FToast fToast = FToast();
  fToast.init(context);
  Widget toast = CustomToast(message: message,icon: icon,);

  fToast.showToast(child: toast, toastDuration: const Duration(seconds: 2), gravity: ToastGravity.CENTER);
}
