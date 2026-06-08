# starcitizen_wiki_api.model.CommodityDepositGroup

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**key** | **String** | Internal commodity key (e.g. \"Quartz\"). | [optional] 
**label** | **String** | Human-readable deposit name derived from the key. | [optional] 
**signature** | **int** | Electromagnetic signature strength, used for scanner detection. | [optional] 
**areaExceptions** | [**List&lt;AreaException&gt;**](AreaException.md) | Area-specific probability modifiers that override the default for this deposit. | [optional] 
**clustering** | [**Clustering**](Clustering.md) | Clustering configuration for deposit groupings, if applicable. | [optional] 
**harvestableSetup** | [**HarvestableSetup**](HarvestableSetup.md) | Respawn and despawn timing data for harvestable deposits. | [optional] 
**providerNames** | **List&lt;String&gt;** | List of unique provider names that generate this deposit. | [optional] 
**materials** | [**List&lt;MaterialEntry&gt;**](MaterialEntry.md) | List of materials (commodities) found in this deposit with their quality and probability data. | [optional] 
**qualityMin** | **int** | Minimum quality across all instances of this deposit. | [optional] 
**qualityMax** | **int** | Maximum quality across all instances of this deposit. | [optional] 
**relativeProbabilityMin** | **num** | Lowest relative probability among deposit instances (0-1). | [optional] 
**relativeProbabilityMax** | **num** | Highest relative probability among deposit instances (0-1). | [optional] 
**relativeProbabilityMinPercent** | **num** | Lowest relative probability as a percentage (0-100). | [optional] 
**relativeProbabilityMaxPercent** | **num** | Highest relative probability as a percentage (0-100). | [optional] 
**uuid** | **String** | Unique commodity identifier. | [optional] 
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
**kind** | **String** | Resource kind classification (e.g. \"Mineable\", \"Harvestable\"). | [optional] 
**commodityGroups** | **List&lt;String&gt;** | Ordered commodity groups from root to leaf (e.g. [\"ProcessedGoods\", \"Vice\"]). | [optional] 
**methods** | **List&lt;String&gt;** | Available extraction methods (e.g. [\"Ship\", \"Ground Vehicle\", \"FPS\"]). | [optional] 
**systems** | **List&lt;String&gt;** | Star systems where this commodity can be found. | [optional] 
**locations** | [**List&lt;CommodityIndexLocation&gt;**](CommodityIndexLocation.md) | Named locations where this commodity appears. | [optional] 
**link** | **String** | API link to this commodity's full details. | [optional] 
**webUrl** | **String** | Frontend URL for this commodity's page. | [optional] 
**images** | [**List&lt;CommodityLinkImagesInner&gt;**](CommodityLinkImagesInner.md) | Images from external sources for this commodity. | [optional] 
**resourceUuid** | **String** | UUID of the resource (commodity) this deposit yields. | [optional] 
**groupName** | **String** | Internal group name for the mining category (e.g. \"SpaceShip_Mineables\"). | [optional] 
**resourceKind** | **String** | Resource extraction kind (e.g. \"Mineable\", \"Harvestable\"). | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


