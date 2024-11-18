import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap_kart/product/model/product_model.dart';
import 'package:snap_kart/product/provider/product_provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  @override
  void initState() {
    super.initState();
    fetchProduct();
  }
  void fetchProduct(){
    ProductProvider provider=Provider.of(context,listen: false);
    provider.fetchProduct();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      body: getBody(),
    );
  }
  Widget getBody(){

    return Consumer<ProductProvider>(
      builder: (context,provider,child){
        return  ListView.builder(
            itemCount: provider.product.length,
            itemBuilder: (context,index){
              Product product=provider.product[index];
              return Card(
                child: ListTile(
                  title: Text(product.name.toString(),),
                  subtitle: Text('\$${product.price}'),
                  trailing: Text(product.description.toString()),
                ),
              );
            });
      },
    );
  }
}
