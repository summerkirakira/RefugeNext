# starcitizen_wiki_api.model.CommodityShow

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**uuid** | **String** | Unique commodity identifier. | [optional] 
**key** | **String** | Internal commodity key (e.g. \"Quartz\"). | [optional] 
**name** | **String** | Display name of the commodity. | [optional] 
**displayName** | **String** | Name with leaf commodity group in parentheses, e.g. \"WiDoW (Vice)\". | [optional] 
**slug** | **String** | URL-friendly slug for the commodity. | [optional] 
**description** | **String** | In-game lore description. | [optional] 
**tier** | **String** | Refinement tier (e.g. \"Raw\", \"Refined\"). | [optional] 
**refinedVersion** | [**CommodityLinkRefinedVersion**](CommodityLinkRefinedVersion.md) |  | [optional] 
**densityGPerCc** | **num** | Density in grams per cubic centimeter. | [optional] 
**instability** | **num** | Instability rating affecting mining behavior. | [optional] 
**resistance** | **num** | Resistance rating affecting mining difficulty. | [optional] 
**boxSizesScu** | **List&lt;num&gt;** | Standard cargo box sizes in SCU that this commodity fits into. | [optional] 
**validateDefaultCargoBox** | **bool** | Whether the default cargo box validation applies. | [optional] 
**hasDefaultCargoContainers** | **bool** | Whether default cargo containers are available for this commodity. | [optional] 
**isMineable** | **bool** | Whether this commodity can be obtained through mining or harvesting. | [optional] 
**hasShipMineables** | **bool** | Whether ship mining deposits exist for this commodity. | [optional] 
**hasGroundVehicleMineables** | **bool** | Whether ground vehicle mining deposits exist for this commodity. | [optional] 
**hasFpsMineables** | **bool** | Whether FPS mining deposits exist for this commodity. | [optional] 
**hasHarvestables** | **bool** | Whether harvestable deposits exist for this commodity. | [optional] 
**hasSalvage** | **bool** | Whether salvage deposits exist for this commodity. | [optional] 
**signature** | **int** | Electromagnetic signature strength, used for scanner detection. | [optional] 
**kind** | **String** | Resource kind classification (e.g. \"Mineable\", \"Harvestable\"). | [optional] 
**commodityGroups** | **List&lt;String&gt;** | Ordered commodity groups from root to leaf (e.g. [\"ProcessedGoods\", \"Vice\"]). | [optional] 
**methods** | **List&lt;String&gt;** | Available extraction methods (e.g. [\"Ship\", \"Ground Vehicle\", \"FPS\"]). | [optional] 
**systems** | **List&lt;String&gt;** | Star systems where this commodity can be found. | [optional] 
**locations** | [**List&lt;CommodityShowLocation&gt;**](CommodityShowLocation.md) | Flat list of all locations with deposit details. | [optional] 
**link** | **String** | API link to this commodity's full details. | [optional] 
**webUrl** | **String** | Frontend URL for this commodity's page. | [optional] 
**images** | [**List&lt;CommodityLinkImagesInner&gt;**](CommodityLinkImagesInner.md) | Images from external sources for this commodity. | [optional] 
**systemsGrouped** | [**List&lt;CommoditySystemGroup&gt;**](CommoditySystemGroup.md) | Locations organized by star system for hierarchical display. | [optional] 
**rawVersions** | [**List&lt;CommodityVersionEntry&gt;**](CommodityVersionEntry.md) | Raw (unrefined) versions of this commodity, if this is a refined commodity. | [optional] 
**blueprints** | [**List&lt;CommodityShowAllOfBlueprints&gt;**](CommodityShowAllOfBlueprints.md) | Crafting blueprints that use or produce this commodity. | [optional] 
**items** | [**List&lt;CommodityShowAllOfItems&gt;**](CommodityShowAllOfItems.md) | Physical items associated with this commodity in the game. | [optional] 
**uexPrices** | [**CommodityShowAllOfUexPrices**](CommodityShowAllOfUexPrices.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


