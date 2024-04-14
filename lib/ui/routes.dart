import 'package:create_product/ui/pages/create_product/create_product.dart';
import 'package:create_product/ui/pages/login/log_in_page.dart';
import 'package:create_product/ui/pages/menu/menu_page.dart';
import 'package:create_product/ui/pages/register/register_page.dart';
import 'package:create_product/ui/pages/see_oders/see_ordes_page.dart';
import 'package:create_product/ui/pages/see_products/see_products_page.dart';
import 'package:create_product/ui/pages/splash_screen/splash_screen_page.dart';
import 'package:create_product/ui/pages/testing/testing.dart';
import 'package:flutter/material.dart';

/// Rutas de la aplicación
final routes = <String, WidgetBuilder>{
  // Rutas de autenticación
  'crearProductos': (BuildContext context) => const CreateProductPage(),
  'bienvenida': (BuildContext context) => SplashScreenPage(),
  'login': (BuildContext context) => const LogInPage(),
  'register': (BuildContext context) => RegisterPage(),
  'seeProducts': (BuildContext context) => const SeeProductsPage(),
  'menu': (BuildContext context) => const MenuPage(),
  'pruebas': (BuildContext context) => Testing(),
  'verOrders': (BuildContext context) => SeeOrdersPage(),
};
