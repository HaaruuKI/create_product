import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                labelText: 'Nombre(s)',
              ),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                labelText: 'Apellidos',
              ),
            ),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Número de teléfono',
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Correo',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                // Obtener los valores de los campos de texto
                String firstName = _firstNameController.text;
                String lastName = _lastNameController.text;
                String phoneNumber = _phoneNumberController.text;
                String email = _emailController.text;
                String password = _passwordController.text;

                // Verificar si el número de teléfono ya está registrado
                QuerySnapshot phoneSnapshot = await _firestore
                    .collection('users_admin')
                    .where('phoneNumber', isEqualTo: phoneNumber)
                    .get();
                if (phoneSnapshot.docs.isNotEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content:
                            Text('El número de teléfono ya está registrado.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Aceptar'),
                          ),
                        ],
                      );
                    },
                  );
                  return;
                }

                // Verificar si el correo electrónico ya está registrado
                QuerySnapshot emailSnapshot = await _firestore
                    .collection('users_admin')
                    .where('email', isEqualTo: email)
                    .get();
                if (emailSnapshot.docs.isNotEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content:
                            Text('El correo electrónico ya está registrado.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Aceptar'),
                          ),
                        ],
                      );
                    },
                  );
                  return;
                }

                try {
                  // Crear el usuario en Firebase Auth
                  UserCredential userCredential =
                      await _auth.createUserWithEmailAndPassword(
                    email: email,
                    password:
                        password, // Reemplaza 'contraseña' con la contraseña real
                  );

                  // Obtener el ID del usuario creado
                  String userId = userCredential.user!.uid;

                  // Guardar los datos en Firestore
                  await _firestore.collection('users_admin').doc(userId).set({
                    'firstName': firstName,
                    'lastName': lastName,
                    'phoneNumber': phoneNumber,
                    'email': email,
                  });

                  // Imprimir los datos en la consola
                  print('Nombre(s): $firstName');
                  print('Apellidos: $lastName');
                  print('Número de teléfono: $phoneNumber');
                  print('Correo: $email');

                  // Mostrar un mensaje de éxito
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Registro exitoso'),
                        content: Text(
                            'El usuario ha sido registrado correctamente.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Aceptar'),
                          ),
                        ],
                      );
                    },
                  );
                } catch (e) {
                  // Mostrar un mensaje de error
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content:
                            Text('Ocurrió un error durante el registro: $e'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Aceptar'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Registrarse'),
            )
          ],
        ),
      ),
    );
  }
}
