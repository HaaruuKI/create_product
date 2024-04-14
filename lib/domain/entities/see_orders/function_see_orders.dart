import 'package:cloud_firestore/cloud_firestore.dart';

class FunctionSeeOrders {
  static Future<void> deleteDataOrderpending(String orderId) async {
    DocumentReference<Map<String, dynamic>> docDataDelete = FirebaseFirestore
        .instance
        .collection('orders_for_admin')
        .doc('productos');

    await docDataDelete.update(
      {
        orderId: FieldValue.delete(),
      },
    );
    print(orderId);
  }

  static Future<void> changeDataToDelivered(
      String orderId, String newState) async {
    FirebaseFirestore.instance
        .collection("orders_for_admin")
        .doc("productos")
        .update({"$orderId.state": newState});
  }

  static Future<void> changeDataToDeliveredOrdersUser(
      String orderId, user, newState) async {
    FirebaseFirestore.instance
        .collection("orders")
        .doc(user)
        .update({"$orderId.state": newState});
  }

  static Future<void> sendDataProdcutosAceptados(
      String orderId, String newState) async {
    FirebaseFirestore.instance
        .collection("orders_for_admin")
        .doc("productos")
        .update({"$orderId.state": newState});
  }

  static Future<void> sendDataChangeAceptedOrdersUser(
      String orderId, String newState, user) async {
    FirebaseFirestore.instance
        .collection("orders")
        .doc(user)
        .update({"$orderId.state": newState});
  }

  static Future<void> deleteCartData(String orderId, user) async {
    DocumentReference<Map<String, dynamic>> docDataDelete =
        FirebaseFirestore.instance.collection('orders').doc(user);

    await docDataDelete.update(
      {
        orderId: FieldValue.delete(),
      },
    );
  }
}
