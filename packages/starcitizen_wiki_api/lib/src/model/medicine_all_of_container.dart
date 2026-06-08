//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'medicine_all_of_container.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MedicineAllOfContainer {
  /// Returns a new [MedicineAllOfContainer] instance.
  MedicineAllOfContainer({

     this.type,

     this.closed,

     this.canBeReclosed,

     this.discardWhenConsumed,
  });

      /// Container type identifier.
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Whether the container starts closed (if provided).
  @JsonKey(
    
    name: r'closed',
    required: false,
    includeIfNull: false,
  )


  final bool? closed;



      /// Whether the container can be reclosed after opening.
  @JsonKey(
    
    name: r'can_be_reclosed',
    required: false,
    includeIfNull: false,
  )


  final bool? canBeReclosed;



      /// Whether the container is discarded when fully consumed.
  @JsonKey(
    
    name: r'discard_when_consumed',
    required: false,
    includeIfNull: false,
  )


  final bool? discardWhenConsumed;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MedicineAllOfContainer &&
      other.type == type &&
      other.closed == closed &&
      other.canBeReclosed == canBeReclosed &&
      other.discardWhenConsumed == discardWhenConsumed;

    @override
    int get hashCode =>
        (type == null ? 0 : type.hashCode) +
        (closed == null ? 0 : closed.hashCode) +
        (canBeReclosed == null ? 0 : canBeReclosed.hashCode) +
        (discardWhenConsumed == null ? 0 : discardWhenConsumed.hashCode);

  factory MedicineAllOfContainer.fromJson(Map<String, dynamic> json) => _$MedicineAllOfContainerFromJson(json);

  Map<String, dynamic> toJson() => _$MedicineAllOfContainerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

