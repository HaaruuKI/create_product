import 'package:create_product/ui/colors.dart';
import 'package:flutter/material.dart';

Widget passwordInput(
    TextEditingController passwordController,
    Function funtionPasswordVisible,
    bool passwordVisible,
    BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 15.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: const Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(30.0)),
    child: TextFormField(
      keyboardType: TextInputType.text,
      controller: passwordController,
      obscureText: !passwordVisible, //This will obscure text dynamically
      decoration: InputDecoration(
        hintText: 'Contraseña',
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        suffixIcon: IconButton(
          icon: Icon(
            passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: amarillo,
          ),
          onPressed: () {
            funtionPasswordVisible();
          },
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'La contraseña no puede estar vacía';
        }
        return null;
      },
    ),
  );
}
