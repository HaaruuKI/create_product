import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FunctionGetLogin {
  static Future<void> signInWithEmailAndPassword(
      TextEditingController emailController,
      GlobalKey<FormState> formKey,
      TextEditingController passwordController,
      bool cargando,
      BuildContext context,
      Function funtionCargar,
      Function funtionCargarTerminado) async {
    if (formKey.currentState!.validate()) {
      funtionCargar();
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        // User? user = FirebaseAuth.instance.currentUser;
        // if (user != null) {
        //   await FirebaseFirestore.instance
        //       .collection('users_admin')
        //       .doc(user.uid)
        //       .update({'isLogged': true});
        // DocumentSnapshot doc = await FirebaseFirestore.instance
        //     .collection('users_admin')
        //     .doc(user.uid)
        //     .get();
        // print("Nombre (Firestore): ${doc.get('name')}");
        // print("Email (Firestore): ${doc.get('email')}");
        // }
        // Mostrar mensaje de éxito
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Sesión iniciada correctamente')));

        // Redirigir al usuario al menu
        Navigator.pushNamed(context, 'menu');
      } on FirebaseAuthException catch (e) {
        // Mostrar mensaje de error
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message!)));
      } finally {
        funtionCargarTerminado();
      }
    }
  }
}
