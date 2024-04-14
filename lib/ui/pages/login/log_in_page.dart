// ignore_for_file: use_build_context_synchronously, avoid_print, no_leading_underscores_for_local_identifiers

import 'package:create_product/ui/pages/login/widget/button_login.dart';
import 'package:create_product/ui/pages/login/widget/email_input.dart';
import 'package:create_product/ui/pages/login/widget/password_input.dart';
import 'package:create_product/ui/pages/login/widget/text_bienvenida.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  bool passwordVisible = false;
  void funtionPasswordVisible() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  bool cargando = false;
  void funtionCargar() {
    setState(() {
      cargando = true;
    });
  }

  void funtionCargarTerminado() {
    setState(() {
      cargando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cargando
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 50),
                  Transform.translate(
                    offset: const Offset(0.0, -50.0),
                    child: Container(
                      width: double.infinity,
                      height: 600,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Column(
                            children: [
                              textBienvenida(),
                              const SizedBox(height: 40),
                              emailInput(emailController),
                              passwordInput(
                                  passwordController,
                                  funtionPasswordVisible,
                                  passwordVisible,
                                  context),
                              const SizedBox(height: 16.0),
                              buttonLogin(
                                  emailController,
                                  passwordController,
                                  cargando,
                                  context,
                                  formKey,
                                  funtionCargar,
                                  funtionCargarTerminado),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
