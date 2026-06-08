// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

enum BlueprintModifierBetterWhen {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('higher')
  higher('higher'),
  @JsonValue('lower')
  lower('lower'),
  @JsonValue('neutral')
  neutral('neutral');

  final String? value;

  const BlueprintModifierBetterWhen(this.value);
}

enum BlueprintModifierValueRangeType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('linear')
  linear('linear');

  final String? value;

  const BlueprintModifierValueRangeType(this.value);
}

enum BlueprintSummaryPropertyBetterWhen {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('higher')
  higher('higher'),
  @JsonValue('lower')
  lower('lower'),
  @JsonValue('neutral')
  neutral('neutral');

  final String? value;

  const BlueprintSummaryPropertyBetterWhen(this.value);
}

enum BlueprintRequirementChildKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('group')
  group('group'),
  @JsonValue('resource')
  resource('resource'),
  @JsonValue('item')
  item('item');

  final String? value;

  const BlueprintRequirementChildKind(this.value);
}

enum BlueprintRequirementGroupKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('group')
  group('group');

  final String? value;

  const BlueprintRequirementGroupKind(this.value);
}

enum BlueprintRequirementNodeKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('root')
  root('root'),
  @JsonValue('group')
  group('group'),
  @JsonValue('resource')
  resource('resource'),
  @JsonValue('item')
  item('item');

  final String? value;

  const BlueprintRequirementNodeKind(this.value);
}

enum BlueprintIngredientKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('resource')
  resource('resource'),
  @JsonValue('item')
  item('item');

  final String? value;

  const BlueprintIngredientKind(this.value);
}

enum GameItemRarity {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Common')
  common('Common'),
  @JsonValue('Uncommon')
  uncommon('Uncommon'),
  @JsonValue('Rare')
  rare('Rare'),
  @JsonValue('Epic')
  epic('Epic'),
  @JsonValue('Legendary')
  legendary('Legendary');

  final String? value;

  const GameItemRarity(this.value);
}

enum MiningModifierItemType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Gadget')
  gadget('Gadget'),
  @JsonValue('Module')
  module('Module');

  final String? value;

  const MiningModifierItemType(this.value);
}

enum CanonicalResourceMetaType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('blueprint')
  blueprint('blueprint'),
  @JsonValue('commodity')
  commodity('commodity'),
  @JsonValue('item')
  item('item'),
  @JsonValue('location')
  location('location'),
  @JsonValue('mission')
  mission('mission'),
  @JsonValue('vehicle')
  vehicle('vehicle');

  final String? value;

  const CanonicalResourceMetaType(this.value);
}

enum ApiLocationsPositionsGet$Response$Connections$ItemSizeClass {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('small')
  small('small'),
  @JsonValue('large')
  large('large'),
  @JsonValue('unknown')
  unknown('unknown');

  final String? value;

  const ApiLocationsPositionsGet$Response$Connections$ItemSizeClass(this.value);
}
