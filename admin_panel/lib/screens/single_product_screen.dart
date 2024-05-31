import 'package:admin_panel/models/product_model.dart';
import 'package:admin_panel/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllSingleDetailScreen extends StatelessWidget {
  ProductModel productModel;
  AllSingleDetailScreen({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: Text(productModel.productName),
         
      ),
      body: Column(
        children: [
          Card(
            elevation: 10,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Product Name'),
                      SizedBox(
                        width: Get.width / 2,
                        child: Text(
                          productModel.productName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Product Price'),
                      SizedBox(
                        width: Get.width / 2,
                        child: Text(
                          productModel.fullPrice.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Product Description'),
                      SizedBox(
                        width: Get.width / 2,
                        child: Text(
                          productModel.productDescription,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
