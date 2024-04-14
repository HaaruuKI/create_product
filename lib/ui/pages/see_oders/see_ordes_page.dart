import 'package:create_product/ui/colors.dart';
import 'package:create_product/ui/pages/see_oders/widget/accepted_orders.dart';
import 'package:create_product/ui/pages/see_oders/widget/pending_orders.dart';
import 'package:flutter/material.dart';

class SeeOrdersPage extends StatefulWidget {
  @override
  State<SeeOrdersPage> createState() => _SeeOrdersPageState();
}

class _SeeOrdersPageState extends State<SeeOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ordenes',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 50.0,
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'menu');
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Container(
                    // width: double.infinity,

                    color: amarillo, // Tab Bar color change
                    child: const TabBar(
                      unselectedLabelColor: blanco,
                      labelColor: negro,
                      indicatorWeight: 2,
                      // indicator: BoxDecoration(
                      //   color: blanco,
                      //   borderRadius: BorderRadius.all(
                      //     Radius.circular(20),
                      //   ),
                      // ),
                      tabs: [
                        Tab(text: 'Pendientes'),
                        Tab(text: 'Aceptados'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        buildPendingOrders(context),
                        buildAcceptedOrders(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
