import 'package:admin_panel/screens/all_order_screen.dart';
import 'package:admin_panel/screens/all_product_screen.dart';
import 'package:admin_panel/screens/all_user_screen.dart';
import 'package:admin_panel/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidgets extends StatefulWidget {
  const DrawerWidgets({super.key});

  @override
  State<DrawerWidgets> createState() => _DrawerWidgetsState();
}

class _DrawerWidgetsState extends State<DrawerWidgets> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 25),
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        backgroundColor: AppConstant.appScendoryColor,
        child: Wrap(
          runSpacing: 10,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "EasyCare",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                subtitle: Text(
                  "Version 1.0.1",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                leading: CircleAvatar(
                  radius: 22.0,
                  backgroundColor: AppConstant.appMainColor,
                  child: Text(
                    "W",
                    style: TextStyle(color: AppConstant.appTextColor),
                  ),
                ),
              ),
            ),
            const Divider(
              indent: 10.0,
              endIndent: 10.0,
              thickness: 1.5,
              color: Colors.grey,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Home",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                leading: Icon(
                  Icons.home,
                  color: AppConstant.appTextColor,
                ),
                // trailing: Icon(
                //   Icons.arrow_forward,
                //   color: AppConstant.appTextColor,
                // ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                onTap: () {
                  Get.to(() => const AllUserScreen());
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: const Text(
                  "Users",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                leading: const Icon(
                  Icons.person,
                  color: AppConstant.appTextColor,
                ),

                // trailing: Icon(
                //   Icons.arrow_forward,
                //   color: AppConstant.appTextColor,
                // ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                onTap: () {
                  Get.to(() => const AllOrderScreen());
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: const Text(
                  "Orders",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                leading: const Icon(
                  Icons.shopping_bag,
                  color: AppConstant.appTextColor,
                ),
                // trailing: Icon(
                //   Icons.arrow_forward,
                //   color: AppConstant.appTextColor,
                // ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                onTap: () {
                  Get.to(() => const AllProductScreen());
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: const Text(
                  "Products",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                leading: const Icon(
                  Icons.production_quantity_limits,
                  color: AppConstant.appTextColor,
                ),
                // trailing: Icon(
                //   Icons.arrow_forward,
                //   color: AppConstant.appTextColor,
                // ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: const Text(
                  "Categories",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                leading: const Icon(
                  Icons.shopping_bag,
                  color: AppConstant.appTextColor,
                ),
                // trailing: const Icon(
                //   Icons.arrow_forward,
                //   color: AppConstant.appTextColor,
                // ),
                onTap: () {
                  Get.back();
                  // Get.to(() => AllOrdersScreen());
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Category",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                leading: Icon(
                  Icons.help,
                  color: AppConstant.appTextColor,
                ),
                // trailing: Icon(
                //   Icons.arrow_forward,
                //   color: AppConstant.appTextColor,
                // ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Review",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                leading: Icon(
                  Icons.reviews,
                  color: AppConstant.appTextColor,
                ),
                // trailing: Icon(
                //   Icons.arrow_forward,
                //   color: AppConstant.appTextColor,
                // ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                onTap: () {
                  // GoogleSignIn googleSignIn = GoogleSignIn();
                  // FirebaseAuth _auth = FirebaseAuth.instance;
                  // await _auth.signOut();
                  // await googleSignIn.signOut();
                  // Get.offAll(() => WelcomeScreen());
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: const Text(
                  "Logout",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
                leading: const Icon(
                  Icons.logout,
                  color: AppConstant.appTextColor,
                ),
                // trailing: const Icon(
                //   Icons.arrow_forward,
                //   color: AppConstant.appTextColor,
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
