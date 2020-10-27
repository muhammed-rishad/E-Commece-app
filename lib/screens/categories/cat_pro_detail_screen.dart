import 'package:flutter/material.dart';
import 'package:shop_app/screens/categories/body.dart';
import 'package:woocommerce/models/products.dart';

import '../../models/Product.dart';
//import 'components/custom_app_bar.dart';

class CatProDetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final CatProductDetailsArguments agrs =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      // appBar: CustomAppBar(rating: agrs.product.averageRating.),
      body: Body(product: agrs.product),
    );
  }
}

class CatProductDetailsArguments {
  final WooProduct product;

  CatProductDetailsArguments({@required this.product});
}
