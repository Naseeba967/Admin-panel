import 'package:admin_panel/controller/get_all_user_length.dart';
import 'package:admin_panel/models/user_model.dart';
import 'package:admin_panel/screens/add_product_screen.dart';
import 'package:admin_panel/screens/single_product_screen.dart';
import 'package:admin_panel/utils/app_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../models/product_model.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllUserScreenState();
}

class _AllUserScreenState extends State<AllProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Product "),
        backgroundColor: AppConstant.appMainColor,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => const AddProductScreen());
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('Product').get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Container(
                child: const Center(
                  child: Text("Error occur while featching category"),
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                  child: const Center(child: CupertinoActivityIndicator()));
            }
            if (snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No Product  Found'));
            }
            if (snapshot.data != null) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final data = snapshot.data!.docs[index];
                    ProductModel productModel = ProductModel(
                      // productId: data[''],
                      productName: data['name'],
                      //  categoryId: data[''],
                      categoryName: data['category'],
                      //  salePrice:data[''],
                      fullPrice: data['price'],
                      productImages: data['img'],
                      //  deliveryTime: data[''],
                      isSale: data['status'],
                      productDescription: data['description'],
                      createdAt: data['duration'],
                      // updatedAt: data[''],
                    );
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        onTap: () {
                          Get.to(() => AllSingleDetailScreen(
                              productModel: productModel));
                        },
                        leading: CircleAvatar(
                          backgroundColor: AppConstant.appScendoryColor,
                          backgroundImage: CachedNetworkImageProvider(
                              productModel.productImages, errorListener: (err) {
                            print(err);
                            print("Error loading image");
                            const Icon(Icons.error);
                          }),
                        ),
                        title: Text(productModel.categoryName),
                        subtitle: Text(productModel.productName),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    );
                  });
            }
            return Container();
          }),
    );
  }
}
