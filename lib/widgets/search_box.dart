import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recepie_app/controller/category_controller.dart';
import 'package:searchfield/searchfield.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({super.key});

  var categoryController = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => SearchField(
          onSuggestionTap: (value) {
            categoryController.getMealsByCategory(value.searchKey);
          },
          suggestions: categoryController.categoryBasket.value.categories
              .map(
                (e) => SearchFieldListItem(
                  e.strCategory.toString(),
                  item: e,
                  // Use child to show Custom Widgets in the suggestions
                  // defaults to Text widget
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(e.strCategoryThumb.toString()),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(e.strCategory.toString()),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ));
  }
}
