import 'package:create_product/ui/pages/login/widget/btn_back.dart';
import 'package:flutter/material.dart';

Widget imageWidget(BuildContext context) {
  return Stack(
    children: [
      const Image(
        width: double.infinity,
        height: 200.0,
        fit: BoxFit.cover,
        image: AssetImage('assets/LoginPage.jpg'),
      ),
      Container(
        margin: const EdgeInsets.only(top: 60.0),
        child: btnBackLogin(context, Colors.white),
      )
    ],
  );
}
