import 'package:refuge_next/src/datasource/models/shop/catalog_property.dart';
import 'package:refuge_next/src/funcs/toast.dart';
import 'package:refuge_next/src/network/graphql/shop/add_cart_item.dart';
import 'package:refuge_next/src/network/graphql/shop/update_cart_number.dart';
import 'package:refuge_next/src/network/graphql/shop/remove_cart_item.dart';
import 'package:refuge_next/src/network/graphql/shop/add_credit.dart';
import 'package:refuge_next/src/datasource/models/shop/store_model.dart'
    show LineItem, StoreData;


Future<void> addCatalogToCart(CatalogProperty catalogProperty, int quantity) async {
  final response = await AddCartItem(skuId: catalogProperty.id.toString(), qty: quantity, identifier: null).execute();
}

Future<void> updateCartNumber(LineItem item, int quantity) async {
  final response = await UpdateCartNumber(skuId: item.skuId, qty: quantity, identifier: item.identifier).execute();
}

Future<void> removeCartItem(LineItem item) async {
  final response = await RemoveCartItem(skuId: item.skuId, identifier: item.identifier).execute();
}

Future<void> updateCredit(int amount) async {
  final response = await AddCredit(amount).execute();
}