import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:create_product/domain/entities/see_orders/function_see_orders.dart';
import 'package:flutter/material.dart';

Widget buildAcceptedOrders(BuildContext context) {
  return StreamBuilder<DocumentSnapshot>(
    stream: FirebaseFirestore.instance
        .collection('orders_for_admin')
        .doc('productos')
        .snapshots(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Center(
          child: Text('Error: ${snapshot.error}'),
        );
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (!snapshot.hasData || !snapshot.data!.exists) {
        return const Center(
          child: Text('No hay ordenes aceptadas'),
        );
      }

      final data = snapshot.data!.data() as Map<String, dynamic>;
      final order = data.values.toList();
      final filteredOrder =
          order.where((item) => item['state'] == 'aceptado').toList();

      filteredOrder.sort((a, b) => a['timestamp'].compareTo(b['timestamp']));

      return ListView.builder(
        itemCount: filteredOrder.length,
        itemBuilder: (context, index) {
          final state = filteredOrder[index]['state'];
          final int totalPrice = filteredOrder[index]['totalPrice'];
          final products = filteredOrder[index]['products_list'];
          final uuid = filteredOrder[index]['uuid'];
          final timestamp = filteredOrder[index]['timestamp'];
          final name = filteredOrder[index]['name_user'];
          final user = filteredOrder[index]['user'];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(
                            'Orden: $uuid',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text(
                        'Nombre del usuario $name',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Fecha: ${DateTime.fromMicrosecondsSinceEpoch(timestamp).toString()}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Productos:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: products
                          .map<Widget>(
                            (product) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                children: [
                                  Text(
                                    '${product['name']} - ${product['quantity']} C/unidad - ${product['price'].toStringAsFixed(2)}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Total: \$${totalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Estado: $state',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                icon: const Icon(Icons.check_circle_outline,
                                    size: 50),
                                onPressed: () {
                                  // FunctionSeeOrders.deleteDataOrderAccepted(uuid);
                                },
                                tooltip: 'Listo para entregar',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                icon: const Icon(Icons.delete, size: 50),
                                onPressed: () {
                                  FunctionSeeOrders.changeDataToDelivered(
                                      uuid, 'entregado');
                                  FunctionSeeOrders
                                      .changeDataToDeliveredOrdersUser(
                                          uuid, user, 'entregado');
                                },
                                tooltip: 'Marcar como entregado',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
