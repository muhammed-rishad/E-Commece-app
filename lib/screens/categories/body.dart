import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/config.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/categories/cat_pro_discription.dart';
import 'package:shop_app/screens/categories/cat_product_images.dart';
import 'package:shop_app/size_config.dart';
import 'package:woocommerce/models/products.dart';
import 'package:shop_app/screens/details/components/color_dots.dart';

import 'package:shop_app/screens/details/components/top_rounded_container.dart';

//import 'color_dots.dart';
// import 'product_description.dart';
// import 'top_rounded_container.dart';
// import 'product_images.dart';

class Body extends StatefulWidget {
  final WooProduct product;
  const Body({Key key, @required this.product}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final config = woocommerce();

  addCart() async {
    final myCart = await config.wooCommerce
        .addToMyCart(
            itemId: widget.product.id.toString(), quantity: 1.toString())
        .catchError((e) {
      debugPrint('rishad' + e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductImages(product: widget.product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: widget.product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(product: widget.product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () {
                            addCart();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
