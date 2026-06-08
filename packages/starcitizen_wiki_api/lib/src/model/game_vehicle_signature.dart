//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'game_vehicle_signature.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GameVehicleSignature {
  /// Returns a new [GameVehicleSignature] instance.
  GameVehicleSignature({

     this.irQuantum,

     this.irShields,

     this.emQuantum,

     this.emShields,

     this.emGroupsQuantum,

     this.emGroupsShields,

     this.emSegmentGroupsQuantum,

     this.emSegmentGroupsShields,

     this.emPerSegment,
  });

      /// Infrared signature with quantum drive active.
  @JsonKey(
    
    name: r'ir_quantum',
    required: false,
    includeIfNull: false,
  )


  final num? irQuantum;



      /// Infrared signature with shields active.
  @JsonKey(
    
    name: r'ir_shields',
    required: false,
    includeIfNull: false,
  )


  final num? irShields;



      /// Electromagnetic signature with quantum drive active.
  @JsonKey(
    
    name: r'em_quantum',
    required: false,
    includeIfNull: false,
  )


  final num? emQuantum;



      /// Electromagnetic signature with shields active.
  @JsonKey(
    
    name: r'em_shields',
    required: false,
    includeIfNull: false,
  )


  final num? emShields;



      /// EM signature groups with quantum drive active.
  @JsonKey(
    
    name: r'em_groups_quantum',
    required: false,
    includeIfNull: false,
  )


  final List<num>? emGroupsQuantum;



      /// EM signature groups with shields active.
  @JsonKey(
    
    name: r'em_groups_shields',
    required: false,
    includeIfNull: false,
  )


  final List<num>? emGroupsShields;



      /// EM segment groups with quantum drive active.
  @JsonKey(
    
    name: r'em_segment_groups_quantum',
    required: false,
    includeIfNull: false,
  )


  final List<num>? emSegmentGroupsQuantum;



      /// EM segment groups with shields active.
  @JsonKey(
    
    name: r'em_segment_groups_shields',
    required: false,
    includeIfNull: false,
  )


  final List<num>? emSegmentGroupsShields;



      /// EM signature per segment.
  @JsonKey(
    
    name: r'em_per_segment',
    required: false,
    includeIfNull: false,
  )


  final num? emPerSegment;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GameVehicleSignature &&
      other.irQuantum == irQuantum &&
      other.irShields == irShields &&
      other.emQuantum == emQuantum &&
      other.emShields == emShields &&
      other.emGroupsQuantum == emGroupsQuantum &&
      other.emGroupsShields == emGroupsShields &&
      other.emSegmentGroupsQuantum == emSegmentGroupsQuantum &&
      other.emSegmentGroupsShields == emSegmentGroupsShields &&
      other.emPerSegment == emPerSegment;

    @override
    int get hashCode =>
        (irQuantum == null ? 0 : irQuantum.hashCode) +
        (irShields == null ? 0 : irShields.hashCode) +
        (emQuantum == null ? 0 : emQuantum.hashCode) +
        (emShields == null ? 0 : emShields.hashCode) +
        (emGroupsQuantum == null ? 0 : emGroupsQuantum.hashCode) +
        (emGroupsShields == null ? 0 : emGroupsShields.hashCode) +
        (emSegmentGroupsQuantum == null ? 0 : emSegmentGroupsQuantum.hashCode) +
        (emSegmentGroupsShields == null ? 0 : emSegmentGroupsShields.hashCode) +
        (emPerSegment == null ? 0 : emPerSegment.hashCode);

  factory GameVehicleSignature.fromJson(Map<String, dynamic> json) => _$GameVehicleSignatureFromJson(json);

  Map<String, dynamic> toJson() => _$GameVehicleSignatureToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

