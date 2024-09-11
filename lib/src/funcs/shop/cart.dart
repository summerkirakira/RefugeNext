import 'package:refuge_next/src/datasource/models/shop/catalog_property.dart';
import 'package:refuge_next/src/funcs/toast.dart';
import 'package:refuge_next/src/network/graphql/shop/add_cart_item.dart';
import 'package:refuge_next/src/network/graphql/shop/update_cart_number.dart';
import 'package:refuge_next/src/network/graphql/shop/remove_cart_item.dart';
import 'package:refuge_next/src/network/graphql/shop/add_credit.dart';
import 'package:refuge_next/src/network/graphql/shop/set_currency.dart';
import 'package:refuge_next/src/network/graphql/shop/address_book_query.dart';
import 'package:refuge_next/src/network/graphql/shop/next_step.dart';
import 'package:refuge_next/src/network/graphql/shop/assign_cart_address.dart';
import 'package:refuge_next/src/network/graphql/shop/cart_validate.dart';
import 'package:refuge_next/src/network/graphql/shop/stepper_query.dart';
import 'package:refuge_next/src/network/graphql/shop/set_payment_method.dart';
import 'package:refuge_next/src/network/graphql/shop/get_stripe_payment_method.dart';
import 'package:refuge_next/src/network/graphql/shop/set_step.dart';


import 'package:refuge_next/src/datasource/models/shop/stepper_query_property.dart';
import 'package:refuge_next/src/datasource/models/shop/get_stripe_payment_method_property.dart';

import 'package:refuge_next/src/datasource/models/shop/billing_address_model.dart';
import 'package:refuge_next/src/datasource/models/shop/cart_validation_property.dart';

import 'package:refuge_next/src/datasource/models/shop/store_model.dart'
    show LineItem, StoreData;

import 'recaptcha.dart';
import 'utils.dart';



Future<void> addCatalogToCart(CatalogProperty catalogProperty, int quantity) async {
  final response = await AddCartItem(skuId: catalogProperty.id.toString(), qty: quantity, identifier: null).execute();
}

Future<void> updateCartNumber(LineItem item, int quantity) async {
  final response = await UpdateCartNumber(skuId: item.skuId, qty: quantity, identifier: item.identifier).execute();
}

Future<void> removeCartItem(LineItem item) async {
  final response = await RemoveCartItem(skuId: item.skuId, identifier: item.identifier).execute();
}

Future<void> updateCredit(double amount) async {
  final response = await AddCredit(amount).execute();
}

Future<void> setCurrency() async {
  final response = await SetCurrency().execute();
}

Future<BillingAddress> getAddressBook() async {
  final response = await AddressBookQuery().execute();
  return response;
}

Future<void> gotoNextStep() async {
  await NextStep().execute();
}

Future<void> assignCartAddress(String addressId) async {
  final response = await AssignCartAddress(billing: addressId).execute();
}

Future<void> assignFirstAddress() async {
  final addresses = (await getAddressBook()).store.addressBook;
  if (addresses.isEmpty) {
    throw Exception('请至少在官网添加一个账单地址');
    return;
  }
  final response = await assignCartAddress(addresses[0].id);
}

Future<CartValidationProperty> validateCart() async {
  final token = await RecaptchaV3.getRecaptchaToken();
  final mark = generateRandomString(22);
  final response = await CartValidate(token: token, mark: mark).execute();
  return response;
}


Future<StepperQueryProperty> getStepperQuery() async {
  final response = await StepperQuery().execute();
  return response;
}

Future<GetStripePaymentMethodProperty> getStripePaymentMethod(String orderSlug) async {
  final response = await GetStripePaymentMethod(orderSlug: orderSlug).execute();
  return response;
}

Future<void> setPaymentMethod(String paymentMethod, String orderSlug) async {
  final response = await SetPaymentMethod(paymentMethod: paymentMethod, orderSlug: orderSlug).execute();
}

Future<void> setStep(String step) async {
  final response = await SetStep(step: step).execute();
}