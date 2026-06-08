# starcitizen_wiki_api.model.GameVehiclePart

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | Raw part name from scunpacked data (e.g. LEFT_WING). | [optional] 
**displayName** | **String** | Human-readable name with positional suffix (e.g. \"Wing (left)\"). | [optional] 
**damageMax** | **num** | Maximum damage this structural part can absorb. | [optional] 
**destructionDamage** | **num** | Total damage needed to destroy this part (only set when part appears in DamageBeforeDestruction). | [optional] 
**detachDamage** | **num** | Total damage needed to detach this part (only set when part appears in DamageBeforeDetach). | [optional] 
**children** | [**List&lt;GameVehiclePart&gt;**](GameVehiclePart.md) | Nested child structural parts. | [optional] 
**version** | **String** | Game version code for this data. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


