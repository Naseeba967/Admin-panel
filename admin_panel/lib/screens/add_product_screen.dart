import 'package:admin_panel/utils/app_constant.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: const Text(
          'Add Product',
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Text('Select Images'),
              ElevatedButton(
                  onPressed: () {}, child: const Text('Select Image'))
            ],
          )
        ],
      ),
    );
  }
}
