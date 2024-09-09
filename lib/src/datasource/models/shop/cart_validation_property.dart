import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_validation_property.freezed.dart';
part 'cart_validation_property.g.dart';

@freezed
class CartValidationProperty with _$CartValidationProperty {
  factory CartValidationProperty({
    required Cart cart,
    required Order order,
    @Default('TyStore') String typeName,
  }) = _CartValidationProperty;

  factory CartValidationProperty.fromJson(Map<String, dynamic> json) => _$CartValidationPropertyFromJson(json);
}

@freezed
class Cart with _$Cart {
  factory Cart({
    required CartMutations mutations,
    required CheckoutFlow flow,
    @Default('TyShoppingCart') String typeName,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@freezed
class CartMutations with _$CartMutations {
  factory CartMutations({
    required String validate,
    @Default('CartMutations') String typeName,
  }) = _CartMutations;

  factory CartMutations.fromJson(Map<String, dynamic> json) => _$CartMutationsFromJson(json);
}

@freezed
class CheckoutFlow with _$CheckoutFlow {
  factory CheckoutFlow({
    required List<CartStep> steps,
    required Current current,
    @Default('TyCheckoutFlow') String typeName,
  }) = _CheckoutFlow;

  factory CheckoutFlow.fromJson(Map<String, dynamic> json) => _$CheckoutFlowFromJson(json);
}


@freezed
class Current with _$Current {
  factory Current({
    required bool orderCreated
  }) = _Current;

  factory Current.fromJson(Map<String, dynamic> json) => _$CurrentFromJson(json);
}


@freezed
class CartStep with _$CartStep {
  factory CartStep({
    required String step,
    String? action,
    @Default(false) bool finalStep,
    @Default(false) bool active,
    bool? orderCreated,
    @Default('TyCartStep') String typeName,
  }) = _CartStep;

  factory CartStep.fromJson(Map<String, dynamic> json) => _$CartStepFromJson(json);
}

@freezed
class Order with _$Order {
  factory Order({
    required String slug,
    @Default('TyOrder') String typeName,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}