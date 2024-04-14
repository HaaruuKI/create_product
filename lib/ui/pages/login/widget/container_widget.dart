// import 'package:create_product/ui/pages/login/widget/button_login.dart';
// import 'package:create_product/ui/pages/login/widget/email_input.dart';
// import 'package:create_product/ui/pages/login/widget/password_input.dart';
// import 'package:create_product/ui/pages/login/widget/text_bienvenida.dart';
// import 'package:flutter/material.dart';

// Widget containerWidget(
//     BuildContext context,
//     GlobalKey<FormState> formKey,
//     TextEditingController emailController,
//     TextEditingController passwordController,
//     bool cargando,
//     Function funtionCargar,
//     Function funtionPasswordVisible,
//     bool passwordVisible,
//     Function funtionCargarTerminado) {
//   return Transform.translate(
//     offset: const Offset(0.0, -50.0),
//     child: Container(
//       width: double.infinity,
//       height: 600,
//       decoration: BoxDecoration(
//           color: const Color.fromARGB(255, 255, 255, 255),
//           borderRadius: BorderRadius.circular(20.0)),
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Center(
//           child: Column(
//             children: [
//               textBienvenida(),
//               const SizedBox(height: 40),
//               emailInput(emailController),
//               passwordInput(passwordController, funtionPasswordVisible,
//                   passwordVisible, context),
//               const SizedBox(height: 16.0),
//               buttonLogin(emailController, passwordController, cargando,
//                   context, formKey, funtionCargar, funtionCargarTerminado),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
