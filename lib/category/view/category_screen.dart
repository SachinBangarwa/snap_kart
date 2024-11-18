import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_kart/category/model/category_model.dart';
import 'package:snap_kart/category/provider/category_provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    fetchCategory();
    super.initState();
  }

  void fetchCategory() async {
    CategoryProvider provider =
        Provider.of<CategoryProvider>(context, listen: false);
    await provider.fetchCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFC9C5BF),
        title: const Center(
            child: Text(
          'category',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Consumer<CategoryProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
              itemCount: provider.category.length,
              itemBuilder: (context, index) {
                CategoryResponse value = provider.category[index];
                return Card(
                  child: ListTile(
                    title: Text(
                      value.name.toString(),
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
