import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:woocommerce/models/products.dart';
import 'package:woocommerce/woocommerce.dart';

import '../../../size_config.dart';
import 'section_title.dart';

String baseUrl = "https://magnolabs.in/woocommerce/";

String consumerKey = "ck_1fb55effae22c47aff2f44d238de4f0d05348f53";

String consumerSecret = "cs_723d9f21012563e834e63abdd3b13d999438740a";

class PopularProducts extends StatefulWidget {
  @override
  _PopularProductsState createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  // List<WooProduct> featuredProducts = [];

  WooCommerce wooCommerce = WooCommerce(
    baseUrl: baseUrl,
    consumerKey: consumerKey,
    consumerSecret: consumerSecret,
    isDebug: true,
  );

  Future<List<WooProduct>> getProducts() async {
    debugPrint("get pdcts : started");
    final p = await wooCommerce.getProducts();
    //setState(() {});
    //print(p.toString());
    return p;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getProducts(),
        builder: (context, snapshot) {
          debugPrint(snapshot.data.toString());
          if (snapshot.hasData) {
            List<WooProduct> products = snapshot.data;
            //return Text('Hey');
            return GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              children: [
                ...List.generate(products.length, (index) {
                  // return Text(products[index].name);
                  // SizedBox.shrink();
                  // if (demoProducts[index].isPopular)
                  return Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                          child: ProductCard(product: products[index])));

                  SizedBox.shrink();
                  SizedBox.shrink(); // here by default width and height is 0
                }),
                SizedBox(width: getProportionateScreenWidth(20)),
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else
            return Center(child: CircularProgressIndicator());
        });
  }
}
