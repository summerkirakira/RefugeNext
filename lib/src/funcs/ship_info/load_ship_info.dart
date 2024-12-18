import 'package:refuge_next/src/datasource/models/ship_info/ship.dart';

IfcsParamsType? getFlightParams(Ship ship) {

  for (var controller in ship.controllers) {
    if (controller.type == "FlightController") {
      return controller.data as IfcsParamsType;
    }
  }

  return null;
}

int calculateFuelTanks(List<FuelTank> fuelTanks) {
  int total = 0;
  for (var tank in fuelTanks) {
    if (tank.type == "FuelTank") {
      total += tank.data.capacity.floor();
    }
  }
  return total;
}

int calculateQtFuelTanks(List<FuelTank> fuelTanks) {
  int total = 0;
  for (var tank in fuelTanks) {
    if (tank.type == "QuantumFuelTank") {
      total += tank.data.capacity.floor();
    }
  }
  return total;
}

int caculateFuelIntake(List<FuelIntake> fuelIntakes) {
  int total = 0;
  for (var intake in fuelIntakes) {
    total += intake.data!.fuelPushRate.floor();
  }
  return total;
}