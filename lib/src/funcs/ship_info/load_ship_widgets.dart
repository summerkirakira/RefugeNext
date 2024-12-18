import 'package:refuge_next/src/widgets/ship_info/ship_components/cooler.dart';

import '../../datasource/models/ship_info/ship.dart';
import '../../repo/ship_info.dart';

CoolerListItem getCoolerWidget(Cooler cooler) {

  final shipInfoRepo = ShipInfoRepo();

  final name = cooler.chineseName ?? cooler.name;
  final coolingMass = cooler.heat.mass;
  final manufacturer = shipInfoRepo.getManufacturerByReferenceSync(cooler.manufacturer!)!;
  final size = cooler.size;
  final manufacturerName = manufacturer.chineseName ?? manufacturer.name;


  return CoolerListItem(
    name: name,
    coolingValue: coolingMass,
    manufacturer: manufacturerName,
    size: size,
    energyCount: 3,
  );
}