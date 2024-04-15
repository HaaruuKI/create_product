import 'package:cached_network_image/cached_network_image.dart';
import 'package:create_product/domain/entities/update_product/function_update_product.dart';
import 'package:create_product/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class UpdatePage extends StatefulWidget {
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  // final TextEditingController _imgController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchProductDetails();
  }

  String? name;
  int? price;
  String? img;
  String? des;

  bool _isDescriptionEnabled = true;

  void setStateImage() {
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    name = args['name'] ?? 'Error al obtener el nombre';
    price = args['price'] ?? 0;
    img = args['img'] ?? url;
    des = args['description'] ?? 'Error al obtener la descripción';
  }

  Future<void> _fetchProductDetails() async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('products').doc().get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      _nameController.text = data['name'];
      _priceController.text = data['price'].toString();
    }
  }

  Future<void> _updateProduct() async {
    String name = _nameController.text;
    double price = double.parse(_priceController.text);

    await FirebaseFirestore.instance.collection('products').doc().update({
      'name': name,
      'price': price,
    });

    // Show a success message or navigate to another screen
    // after the update is complete.
  }

  final String url =
      'data:image/jpeg;base64,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';
  final String urlAddImage =
      'https://firebasestorage.googleapis.com/v0/b/foodie-960f5.appspot.com/o/uploads%2FaddImagen(1).jpg?alt=media&token=c72ae92c-6223-42c4-bd25-4c28ee170816';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actualizar producto $name'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'Producto anterior',
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.white,
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: img ?? url,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        width: 150,
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            name != null
                                ? name![0].toUpperCase() + name!.substring(1)
                                : 'Error al cargar el nombre',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                des ?? 'Error al cargar la descripción',
                                style:
                                    const TextStyle(fontFamily: 'sans-serif'),
                              ),
                              Text(
                                "\$${price ?? '00.00'} MXN",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: amarillo,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          trailing: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: null,
                                icon:
                                    Icon(Icons.edit, color: amarillo, size: 50),
                                tooltip: 'Estos botones no hacen nada',
                              ),
                              IconButton(
                                onPressed: null,
                                icon: Icon(Icons.delete,
                                    color: amarillo, size: 50),
                                tooltip: 'Estos botones no hacen nada',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(color: Colors.black),
              const Text(
                'Nuevo producto',
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.white,
                  child: Row(
                    children: [
                      // Image.network(
                      //   FunctionUpdateProduct.imageUrl ?? url,
                      //   key: ValueKey(FunctionUpdateProduct.imageUrl),
                      //   width: 300,
                      //   height: 400,
                      //   fit: BoxFit.cover,
                      // ),
                      InkWell(
                        onTap: () {
                          FunctionUpdateProduct().uploadFile(setStateImage);
                        },
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  FunctionUpdateProduct.imageUrl ?? urlAddImage,
                              key: ValueKey(FunctionUpdateProduct.imageUrl),
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: SizedBox(
                            child: TextField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                labelText: 'Nombre del producto',
                              ),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: _descriptionController,
                                decoration: const InputDecoration(
                                  labelText: 'Descripción',
                                ),
                                keyboardType: TextInputType.multiline,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter
                                      .singleLineFormatter
                                ],
                                style:
                                    const TextStyle(fontFamily: 'sans-serif'),
                                enabled: _isDescriptionEnabled,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _isDescriptionEnabled =
                                          !_isDescriptionEnabled;
                                      _descriptionController.text = '';
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: amarillo,
                                  ),
                                  child: Text(
                                    _isDescriptionEnabled
                                        ? 'Deshabilitar'
                                        : 'Habilitar',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      '\$',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: amarillo,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 90,
                                    child: TextField(
                                      controller: _priceController,
                                      decoration: const InputDecoration(
                                        labelText: 'Precio',
                                      ),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: amarillo,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    'MXN',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: amarillo,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: null,
                                icon:
                                    Icon(Icons.edit, color: amarillo, size: 50),
                                tooltip: 'Estos botones no hacen nada',
                              ),
                              IconButton(
                                onPressed: null,
                                icon: Icon(Icons.delete,
                                    color: amarillo, size: 50),
                                tooltip: 'Estos botones no hacen nada',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: amarillo,
                ),
                child: const Text('Actualizar producto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
