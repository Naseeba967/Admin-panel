import 'package:admin_panel/widgets/custome_drawer_widgets.dart';
import 'package:flutter/material.dart';
import 'package:admin_panel/utils/app_constant.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: const Text("E commerce"),
      ),
      drawer: const DrawerWidgets(),
        
    );
  }
}
