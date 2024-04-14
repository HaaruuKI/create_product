import 'package:create_product/domain/entities/close_sesion.dart';
import 'package:create_product/domain/entities/isLogged.dart';
import 'package:create_product/ui/colors.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Map<String, Map<String, dynamic>> gridItems = {
    'Ver ordenes': {
      'icon': Icons.view_list,
      'navigatorTo': 'verOrders',
    },
    'Crear productos': {
      'icon': Icons.create,
      'navigatorTo': 'crearProductos',
    },
    'Ver productos': {
      'icon': Icons.view_quilt_rounded,
      'navigatorTo': 'verProductos',
    },
    'Editar producto': {
      'icon': Icons.edit,
      'navigatorTo': 'editarProducto',
    },
    'Eliminar producto': {
      'icon': Icons.delete,
      'navigatorTo': 'eliminarProducto',
    },
  };

  @override
  void initState() {
    super.initState();
    FunctionIsLogged.isLoggedFunction(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Administración de productos'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                FunctionIsLogged.isLoggedFunction(context);
              },
            ),
            ListTile(
              title: const Text('Cerrar sesión'),
              onTap: () async {
                FuntionClosedSesion.closedSesion(context);
              },
            ),
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.5,
        ),
        padding: const EdgeInsets.all(16.0),
        itemCount: gridItems.length,
        itemBuilder: (BuildContext context, int index) {
          final gridMaps = gridItems.values.elementAt(index);
          final title = gridItems.keys.elementAt(index);

          final navigatorTo = gridMaps['navigatorTo'] as String;
          final icon = gridMaps['icon'] as IconData;
          return _buildGridItem(
            context: context,
            color: amarillo,
            icon: icon,
            title: title,
            navigatorTo: navigatorTo,
          );
        },
      ),
    );
  }

  Widget _buildGridItem({
    required BuildContext context,
    required Color color,
    required IconData icon,
    required String title,
    required String navigatorTo,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, navigatorTo);
        },
        child: Container(
          width: double.infinity,
          height: 170,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: Colors.white,
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
