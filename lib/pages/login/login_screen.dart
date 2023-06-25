import 'package:elisoft_flutter_test/cubit/login/authentication_cubit.dart';
import 'package:elisoft_flutter_test/cubit/login/authentication_state.dart';
import 'package:elisoft_flutter_test/pages/dashboard/dashboard_screen.dart';
import 'package:elisoft_flutter_test/pages/login/widget/password_field_widget.dart';
import 'package:elisoft_flutter_test/utils/custom_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationSuccess) {
            
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DashboardScreen();
                },
              ),
            );
          } else if (state is AuthenticationError) {
            final String error = state.error;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(19),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: 384,
                              width: double.infinity,
                              child: Image.asset("assets/images/Image Login.png"),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "My APPS",
                                style: GoogleFonts.inter(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF247881),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: const Color(0xFF247881).withOpacity(.3),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Username",
                                style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF006778)),
                              ),
                              const SizedBox(height: 8),
                              Expanded(
                                child: TextField(
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                  ),
                                  controller: emailController,
                                  decoration: const InputDecoration.collapsed(hintText: ""),
                                  cursorColor: const Color(0xFF006778),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 13),
                        PasswordFieldWidget(passwordController: passwordController),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () {
                            final String email = emailController.text;
                            final String password = passwordController.text;
                            if (email.isEmpty) {
                              customToast(
                                context,
                                'Username cant Empty',
                                CupertinoIcons.exclamationmark_circle_fill,
                              );
                            }
                            if (password.isEmpty) {
                              customToast(
                                context,
                                'Password cant Empty',
                                CupertinoIcons.exclamationmark_circle_fill,
                              );
                            }
                            if (email.isNotEmpty && password.isNotEmpty) {
                              BlocProvider.of<AuthenticationCubit>(context).login(email, password);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF247881),
                            fixedSize: Size(MediaQuery.of(context).size.width, 56),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                          ),
                          child: Text(
                            "LOGIN",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (state is AuthenticationLoading)
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withOpacity(.2),
                ),
              if (state is AuthenticationLoading)
                const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.black,
                    color: Color(0xFF247881),
                    strokeWidth: 6,
                  ),
                )
            ],
          );
          // state is AuthenticationLoading
          //     ? const Center(
          //         child: CircularProgressIndicator(),
          //       )
          //     :
        },
      ),
    );
  }
}
