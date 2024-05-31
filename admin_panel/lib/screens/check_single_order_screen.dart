import 'package:admin_panel/models/oder_model.dart';
import 'package:admin_panel/utils/app_constant.dart';
import 'package:flutter/material.dart';

class SingleOrderScreen extends StatelessWidget {
  String docId;
  OrderModel orderModel;
  SingleOrderScreen({super.key, required this.docId, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        backgroundColor: AppConstant.appMainColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(orderModel.productName),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(orderModel.productTotalPrice.toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(orderModel.productTotalPrice.toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(orderModel.customerPhone),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(orderModel.productDescription),
          ),
          CircleAvatar(foregroundImage: NetworkImage(orderModel.productImages[0]),
          )
        ],
      ),
    );
  }
}
