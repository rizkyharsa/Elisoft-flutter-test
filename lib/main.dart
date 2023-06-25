import 'package:elisoft_flutter_test/cubit/dashboard/dashboard_cubit.dart';
import 'package:elisoft_flutter_test/cubit/login/authentication_cubit.dart';
import 'package:elisoft_flutter_test/pages/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elisoft Flutter Test',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.interTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthenticationCubit(),),
          BlocProvider(create: (context) => DashboardCubit(),),
        ],
        child: const LoginScreen(),
      ),
      
    );
  }
}


