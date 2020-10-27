import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/config.dart';
import 'package:shop_app/screens/categories/CtegoriesCard.dart';
import 'package:shop_app/screens/home/components/categories.dart';
import 'package:woocommerce/models/products.dart';
import 'package:woocommerce/woocommerce.dart';

// import '../../../size_config.dart';
// import 'section_title.dart';

class CategoryPage extends StatefulWidget {
  int catid;
  CategoryPage(this.catid);
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  // List<WooProduct> featuredProducts = [];
  final config = woocommerce();

  Future<List<WooProduct>> getProducts(int id) async {
    debugPrint("get pdcts : started $id");
    final p =
        await woocommerce().wooCommerce.getProducts(category: id.toString());
    //setState(() {});
    print(p.toString());
    return p;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(),
          ),
      body: FutureBuilder(
          future: getProducts(widget.catid),
          builder: (context, snapshot) {
            debugPrint('snpsht' + snapshot.data.toString());
            if (snapshot.hasData) {
              debugPrint(snapshot.data.toString());
              List<WooProduct> products = snapshot.data;

              //return Text('Hey');
              return GridView.count(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
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
                            child: CategoriesCard(product: products[index])));

                    SizedBox.shrink();
                    SizedBox.shrink(); // here by default width and height is 0
                  }),
                  //SizedBox(width: getProportionateScreenWidth(20)),
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
