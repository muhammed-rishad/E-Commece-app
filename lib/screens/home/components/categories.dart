import 'package:flutter/material.dart';
import 'package:shop_app/config.dart';
import 'package:shop_app/screens/categories/category_page.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:woocommerce/models/product_category.dart';
import 'package:woocommerce/woocommerce.dart';

import '../../../size_config.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<WooProductCategory> categories = [];
  List<WooProductCategory> featuredProducts = [];
  final config = new woocommerce();

  getProducts() async {
    categories = await config.wooCommerce.getProductCategories();
    setState(() {});
    print(categories.toString());
  }

  @override
  void initState() {
    super.initState();
    //You would want to use a feature builder instead.
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    // List<Map<String, dynamic>> categories = [
    //   {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
    //   {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
    //   {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
    //   {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
    //   {"icon": "assets/icons/Discover.svg", "text": "More"},
    // ];

    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index].image.src,
            text: categories[index].name,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CategoryPage(categories[index].id)),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(icon),
            ),
            SizedBox(height: 5),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
