import 'package:admin_panel/utils/app_constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'specific_order_screen.dart';

class AllOrderScreen extends StatelessWidget {
  const AllOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All order screen',
        ),
        backgroundColor: AppConstant.appMainColor,
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('orders').get(),
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

                    return Card(
                      elevation: 5,
                      child: ListTile(
                        onTap: () {
                          Get.to(() => SpecificOrderScreen(
                              docId: snapshot.data!.docs[index]['uid'],
                              customerName: snapshot.data!.docs[index]
                                  ['customerName']));
                        },
                        leading: CircleAvatar(
                          backgroundColor: AppConstant.appScendoryColor,
                          child: Text(data['customerName'][0]),

                          // }
                          // ),
                        ),
                        title: Text(data['customerName']),
                        subtitle: Text(data['customerPhone']),
                        trailing: const Icon(Icons.edit),
                      ),
                    );
                  });
            }
            return Container();
          }),
    );
  }
}
