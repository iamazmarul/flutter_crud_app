import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_crud_app/widgets/product_item.dart'; // Assuming the correct import path
import 'package:flutter_crud_app/functions/product_list.dart'; // Assuming the correct import path

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<product> productList = []; // Assuming 'Product' is the correct class name

  @override
  void initState() {
    getProductList();
    super.initState();
  }

  Future<void> getProductList() async {
    final response = await http.get(Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct"));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData["status"] == "success") {
        final data = responseData["data"] as List<dynamic>;
        setState(() {
          productList = data.map((productJson) => product(
            productJson['_id'],
            productJson['Img'],
            productJson['ProductCode'],
            productJson['ProductName'],
            productJson['Qty'],
            productJson['TotalPrice'],
            productJson['UnitPrice'],
          )).toList();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD"),
        actions:  [
          IconButton(onPressed: (){
            getProductList();
          }, icon: Icon(Icons.refresh)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ProductItem(
            Products: productList[index],
          );
        },
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
