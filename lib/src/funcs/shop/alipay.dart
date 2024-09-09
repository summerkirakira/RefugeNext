import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'cart.dart';
import 'package:refuge_next/src/datasource/models/shop/get_stripe_payment_method_property.dart';
import 'package:refuge_next/src/datasource/models/shop/stripe_payment_property.dart';

Future<void> performAliPay(BuildContext context, String validateId) async {
  await setPaymentMethod('alipay', validateId);
  try {
    final paymentData = await getStripePaymentMethod(validateId);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("支付信息已确认，尝试拉起支付宝")),
    );
    try {
      final urlData = await getAlipayUrl(paymentData);
      // final qrcodeUrl = await getAliPayQrCodeUrl(urlData.next_action.alipay_handle_redirect.url);

      // final topic = "alipays://platformapi/startapp?saId=10000007&qrcode=";
      // final jumpUrl = topic + qrcodeUrl;

      final jumpUrl = Uri.parse(urlData.next_action.alipay_handle_redirect.url);

      await launchUrl(jumpUrl);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("购买失败")),
      );
    }
    // print("PaymentData: $paymentData");
  } catch (e) {
    print("PaymentData Error: $e");
  }
}

Future<StripePaymentProperty> getAlipayUrl(GetStripePaymentMethodProperty data) async {
  final url = Uri.parse("https://api.stripe.com/v1/payment_intents/${data.order.order.paymentMethod.clientSecret.split('_secret').first}/confirm");

  final response = await http.post(
    url,
    body: {
      'return_url': "https://robertsspaceindustries.com/store/pledge/cart/capture/${data.order.order.slug}/alipay",
      'key': data.order.payment.apiKey.value,
      'client_secret': data.order.order.paymentMethod.clientSecret,
      'expected_payment_method_type': 'alipay',
    },
  );

  if (response.statusCode == 200) {
    return StripePaymentProperty.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Alipay URL');
  }
}

Future<String> getAliPayQrCodeUrl(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final pattern = RegExp(r'value="(https://qr.alipay.com[^"]+)"');
    final match = pattern.firstMatch(response.body);
    if (match != null && match.groupCount >= 1) {
      return match.group(1)!;
    } else {
      throw Exception('QR code URL not found in response');
    }
  } else {
    throw Exception('Failed to load QR code URL');
  }
}

class CartActivity extends StatelessWidget {
  final String url;

  const CartActivity({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Implement this widget
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Center(child: Text('Cart URL: $url')),
    );
  }
}