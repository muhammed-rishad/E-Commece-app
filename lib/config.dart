import 'package:woocommerce/woocommerce.dart';

String baseUrl = "https://magnolabs.in/woocommerce/";

String consumerKey = "ck_1fb55effae22c47aff2f44d238de4f0d05348f53";

String consumerSecret = "cs_723d9f21012563e834e63abdd3b13d999438740a";

class woocommerce {
  WooCommerce wooCommerce = WooCommerce(
    baseUrl: baseUrl,
    consumerKey: consumerKey,
    consumerSecret: consumerSecret,
    isDebug: true,
  );
}
