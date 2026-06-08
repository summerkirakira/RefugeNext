# starcitizen_wiki_api.model.QuantumDriveJumpProfile

## Load the model package
```dart
import 'package:starcitizen_wiki_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**driveSpeed** | **double** | Max cruise velocity for the jump profile (m/s). Standard jumps range ~138,000,000-876,000,000; spline jumps ~400,000-500,000. | [optional] 
**cooldownTime** | **double** | Cooldown after exit in seconds; dataset ranges 0-92.07. | [optional] 
**stageOneAccelRate** | **double** | Initial acceleration phase (m/s²). Standard ~1.75M; spline as low as 250. | [optional] 
**stageTwoAccelRate** | **double** | Secondary acceleration phase (m/s²). Standard up to 11,000,000; spline around 50,000. | [optional] 
**engageSpeed** | **double** | Minimum ship speed to engage QT (m/s). | [optional] 
**interdictionEffectTime** | **double** | Duration of interdiction effect (seconds). | [optional] 
**calibrationRate** | **double** | Calibration progress per second. | [optional] 
**minCalibrationRequirement** | **double** | Minimum calibration distance gate. | [optional] 
**maxCalibrationRequirement** | **double** | Maximum calibration distance gate. | [optional] 
**calibrationProcessAngleLimit** | **double** | Angular tolerance during calibration (degrees). | [optional] 
**calibrationWarningAngleLimit** | **double** | Warning threshold for calibration cone (degrees). | [optional] 
**calibrationDelayInSeconds** | **double** | Delay applied before calibration proceeds (seconds). | [optional] 
**spoolUpTime** | **double** | Time to spool from idle to ready (seconds). | [optional] 
**driveSpeedFormatted** | **String** | Drive speed formatted for display (e.g. \"165 Mm/s\", \"400 km/s\"). Null when drive_speed is null. | [optional] 
**stageOneAccelRateFormatted** | **String** | Stage one acceleration formatted for display (e.g. \"5.0 Mm/s²\"). Null when stage_one_accel_rate is null. | [optional] 
**stageTwoAccelRateFormatted** | **String** | Stage two acceleration formatted for display (e.g. \"15 Mm/s²\"). Null when stage_two_accel_rate is null. | [optional] 
**engageSpeedFormatted** | **String** | Engage speed formatted for display (e.g. \"1.5 km/s\"). Null when engage_speed is null. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


