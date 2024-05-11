import 'package:flutter/material.dart';
import 'package:recepie_app/widgets/area.dart';
import 'package:recepie_app/widgets/meals.dart';
import 'package:recepie_app/widgets/search_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        drawer:const Drawer(),
      appBar: AppBar(title: Text("Food Recepie"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            SearchWidget(),
            MealWidget(),
            AreaWidget(),
          ],
        ),
      ),
    ));
  }
}
