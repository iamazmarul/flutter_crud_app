import 'package:flutter/material.dart';
import 'package:flutter_crud_app/functions/product_list.dart';
import '../screens/add_and_update_product.dart';


class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.Products});

  final product Products;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        showDialog(
            context: context,
            builder: (context) {
              return productActionDialog(context);
            });
      },
      leading: Image.network(Products.Img,width: 80,),
      title: Text(Products.ProductName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Product Code"),
          Text("Total Price \$20"),
        ],
      ),
      trailing: Text("Price \$20"),
    );
  }

AlertDialog productActionDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Select action'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: const Text('Edit'),
          leading: const Icon(Icons.edit),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddNewProductScreen(),
              ),
            );
          },
        ),
        const Divider(
          height: 0,
        ),
        ListTile(
          title: const Text('Delete'),
          leading: const Icon(Icons.delete_outline),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
}