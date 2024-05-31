import 'package:admin_panel/models/oder_model.dart';
import 'package:admin_panel/screens/check_single_order_screen.dart';
import 'package:admin_panel/utils/app_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpecificOrderScreen extends StatelessWidget {
  final String customerName;
  final String docId;
  const SpecificOrderScreen(
      {super.key, required this.customerName, required this.docId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(customerName),
        backgroundColor: AppConstant.appMainColor,
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('orders')
              .doc(docId)
              .collection('confirmOrder')
              .get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Container(
                child: const Center(
                  child: Text("Error occur while featching order"),
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                  child: const Center(child: CupertinoActivityIndicator()));
            }
            if (snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No Order Found'));
            }
            if (snapshot.data != null) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final data = snapshot.data!.docs[index];
                    String orderDocId = data.id;
                    OrderModel orderModel = OrderModel(
                      productId: data['productId'],
                      categoryId: data['categoryId'],
                      productName: data['productName'],
                      categoryName: data['categoryName'],
                      salePrice: data['salePrice'],
                      fullPrice: data['fullPrice'],
                      productImages: data['productImages'],
                      deliveryTime: data['deliveryTime'],
                      isSale: data['isSale'],
                      productDescription: data['productDescription'],
                      productTotalPrice: data['productTotalPrice'],
                      customerId: data['customerId'],
                      status: data['status'],
                      customerName: data['customerName'],
                      customerPhone: data['customerPhone'],
                      customerAddress: data['customerAddress'],
                      productQuantity: data['productQuantity'],

                      // customerDeviceToken: customerDeviceToken
                    );
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        onTap: () {
                          Get.to(() => SingleOrderScreen(
                              docId: snapshot.data!.docs[index].id,
                              orderModel: orderModel));
                        },
                        leading: CircleAvatar(
                          backgroundColor: AppConstant.appScendoryColor,
                          child: Text(orderModel.customerName[0]),
                          // }
                          // ),
                        ),
                        title: Text(orderModel.customerName),
                        subtitle: Text(orderModel.customerPhone),
                        trailing: InkWell(
                            onTap: () {
                              showBottomSheet(
                                  userDocId: docId,
                                  orderModel: orderModel,
                                  orderDocId: orderDocId);
                            },
                            child: const Icon(Icons.more_vert)),
                      ),
                    );
                  });
            }
            return Container();
          }),
    );
  }

  void showBottomSheet(
      {required String userDocId,
      required OrderModel orderModel,
      required String orderDocId}) {
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection('orders')
                          .doc(userDocId)
                          .collection('confirmOrder')
                          .doc(orderDocId)
                          .update({'status': false});
                    },
                    child: Text('pending')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection('orders')
                          .doc(userDocId)
                          .collection('confirmOrder')
                          .doc(orderDocId)
                          .update({'status': true});
                    },
                    child: Text('Delivered')),
              )
            ],
          )
        ],
      ),
    ));
  }
}
