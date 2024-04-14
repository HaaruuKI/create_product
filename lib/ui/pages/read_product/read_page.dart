// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:create_product/ui/colors.dart';
// import 'package:create_product/ui/widget/btn_back.dart';
// import 'package:flutter/material.dart';

// class ReadPage extends StatefulWidget {
//   @override
//   State<ReadPage> createState() => _ReadPageState();
// }

// class _ReadPageState extends State<ReadPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Ordenes',
//           style: TextStyle(color: Colors.black),
//         ),
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//             size: 50.0,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         centerTitle: true,
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('orders_for_admin')
//             .doc('productos')
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           if (!snapshot.hasData || !snapshot.data!.exists) {
//             return const Center(
//               child: Text('No hay ordenes registradas'),
//             );
//           }

//           final data = snapshot.data!.data() as Map<String, dynamic>;
//           final order = data.values.toList();
//           final filteredOrder =
//               order.where((item) => item['state'] != 'entregado').toList();

//           // Ordenar por fecha más antigua
//           filteredOrder
//               .sort((a, b) => a['timestamp'].compareTo(b['timestamp']));

//           return ListView.builder(
//             itemCount: filteredOrder.length,
//             itemBuilder: (context, index) {
//               final state = filteredOrder[index]['state'];
//               final int totalPrice = filteredOrder[index]['totalPrice'];
//               final products = filteredOrder[index]['products_list'];
//               final uuid = filteredOrder[index]['uuid'];
//               final timestamp = filteredOrder[index]['timestamp'];
//               final name = filteredOrder[index]['name_user'];

//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Card(
//                   child: ListTile(
//                     title: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(0.0),
//                               child: Text(
//                                 'Orden: $uuid',
//                                 style: const TextStyle(
//                                     fontSize: 20, fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(0.0),
//                           child: Text(
//                             'Nombre del usuario $name',
//                             style: const TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           'Fecha: ${DateTime.fromMicrosecondsSinceEpoch(timestamp).toString()}',
//                           style: const TextStyle(fontSize: 16),
//                         ),
//                         const SizedBox(height: 8),
//                         const Text(
//                           'Productos:',
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         Column(
//                           children: products
//                               .map<Widget>(
//                                 (product) => Padding(
//                                   padding:
//                                       const EdgeInsets.symmetric(vertical: 4),
//                                   child: Row(
//                                     children: [
//                                       Text(
//                                         '${product['name']} - ${product['quantity']} C/unidad - ${product['price'].toStringAsFixed(2)}',
//                                         style: const TextStyle(fontSize: 16),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               )
//                               .toList(),
//                         ),
//                         const SizedBox(height: 8),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 'Total: \$${totalPrice.toStringAsFixed(2)}',
//                                 style: const TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 'Estado: $state',
//                                 style: const TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: IconButton(
//                                     icon:
//                                         Icon(Icons.add_task_outlined, size: 50),
//                                     onPressed: () {
//                                       // Acción para el botón de editar
//                                     },
//                                   ),
//                                 ),
//                                 // Padding(
//                                 //   padding: const EdgeInsets.all(8.0),
//                                 //   child: IconButton(
//                                 //     icon: const Icon(Icons.qr_code, size: 50),
//                                 //     onPressed: () {
//                                 //       // Acción para el botón de generar QR
//                                 //     },
//                                 //   ),
//                                 // ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: IconButton(
//                                     icon: Icon(Icons.delete, size: 50),
//                                     onPressed: () {
//                                       // Acción para el botón de eliminar
//                                     },
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
