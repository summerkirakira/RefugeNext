# starcitizen_wiki_api.model.GameStarmapLocation

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uuid** | **String** | Unique identifier for this starmap location. | [optional] 
**slug** | **String** | URL-friendly slug for this location. | [optional] 
**name** | **String** | Display name of the starmap location. | [optional] 
**description** | **String** | In-universe description of the location. | [optional] 
**size** | **num** | Relative size of the location. | [optional] 
**respawnLocationType** | **String** | Type of respawn facility available (e.g. Hospital, MedicalRoom). | [optional] 
**childCount** | **int** | Number of direct child locations. | [optional] 
**hasResources** | **bool** | Whether this location has harvestable resource deposits. | [optional] 
**missionCount** | **int** | Number of available missions at this location. | [optional] 
**isScannable** | **bool** | Whether this location can be detected by ship scanners. | [optional] 
**hideInStarmap** | **bool** | Whether this location is hidden from the in-game starmap. | [optional] 
**hideInWorld** | **bool** | Whether this location is hidden in the game world. | [optional] 
**blockTravel** | **bool** | Whether quantum travel to this location is blocked. | [optional] 
**quantumTravel** | [**GameStarmapLocationQuantumTravel**](GameStarmapLocationQuantumTravel.md) | Quantum travel parameters for this location. | [optional] 
**asteroidRing** | [**GameStarmapLocationAsteroidRing**](GameStarmapLocationAsteroidRing.md) | Asteroid ring parameters, only present on locations with asteroid rings. | [optional] 
**system** | **String** | Name of the star system this location belongs to (e.g. Stanton System). | [optional] 
**parent** | [**GameStarmapLocationLinkedSummary**](GameStarmapLocationLinkedSummary.md) | Parent location in the hierarchy. | [optional] 
**star** | [**GameStarmapLocationLinkedSummary**](GameStarmapLocationLinkedSummary.md) | Nearest star or celestial body. | [optional] 
**children** | [**List&lt;GameStarmapLocationChildSummary&gt;**](GameStarmapLocationChildSummary.md) | Direct child locations. Only included when requested via `include=children`. | [optional] 
**type** | [**GameStarmapLocationType**](GameStarmapLocationType.md) |  | [optional] 
**jurisdiction** | [**GameStarmapLocationJurisdiction**](GameStarmapLocationJurisdiction.md) | Legal jurisdiction governing this location. | [optional] 
**affiliation** | [**GameStarmapLocationAffiliation**](GameStarmapLocationAffiliation.md) | Faction or organization controlling this location. | [optional] 
**amenities** | [**List&lt;GameStarmapLocationAmenity&gt;**](GameStarmapLocationAmenity.md) | Available amenities at this location. | [optional] 
**tag** | [**GameStarmapLocationTag**](GameStarmapLocationTag.md) | Hierarchy entity tag for grouping and filtering. | [optional] 
**designation** | **String** | Official designation code for this location. | [optional] 
**radarContactType** | [**GameStarmapLocationRadarContactType**](GameStarmapLocationRadarContactType.md) | Radar contact classification for navigation. | [optional] 
**link** | **String** | API URL for this location's detail endpoint. | [optional] 
**webUrl** | **String** | Web frontend URL for this location. | [optional] 
**updatedAt** | [**DateTime**](DateTime.md) | Timestamp of the last data update. | [optional] 
**version** | **String** | Game data version code. | [optional] 
**images** | [**List&lt;GameStarmapLocationImagesInner&gt;**](GameStarmapLocationImagesInner.md) | Images from external sources for this location. | [optional] 
**areaBoosts** | [**List&lt;AreaBoost&gt;**](AreaBoost.md) | Areas with boosted deposit spawn rates. Only included when requested via `include=resources`. | [optional] 
**resources** | [**List&lt;StarmapLocationMiningTypeGroup&gt;**](StarmapLocationMiningTypeGroup.md) | Harvestable resource deposits grouped by extraction method. Only included when requested via `include=resources`. | [optional] 
**missions** | [**List&lt;GameStarmapLocationMissionGroup&gt;**](GameStarmapLocationMissionGroup.md) | Available missions grouped by purpose. Only included when requested via `include=missions`. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


