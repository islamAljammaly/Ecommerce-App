import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../data/model/catagories_model.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Debugging print
    print("Categories: ${controller.categories}");

    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final categoryData = controller.categories[index];
          final categoryModel = CategoriesModel.fromJson(categoryData);
          // Debugging print
          print("Category Name: ${categoryModel.categoriesName}");
          return Categories(categoriesModel: categoryModel);
        },
      ),
    );
  }
}


class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  const Categories({Key? key, required this.categoriesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goItemsPage(categoriesModel);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child: const Icon(Icons.phone,color: Color.fromARGB(255, 5, 56, 98),)
          ),
          Text(
            "${categoriesModel.categoriesName}",
            style: const TextStyle(fontSize: 13, color: Colors.black),
          )
        ],
      ),
    );
  }
}