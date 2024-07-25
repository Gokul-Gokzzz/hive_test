import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'model.dart';

ValueNotifier<List<VehicleModel>> vehicleModelListNotifier = ValueNotifier([]);

Future<void> add(VehicleModel value) async {
  final modelDB = await Hive.openBox<VehicleModel>('model_db');
  await modelDB.add(value);
  vehicleModelListNotifier.value.add(value);
  vehicleModelListNotifier.notifyListeners();
}

Future<void> getAll() async {
  final modelDB = await Hive.openBox<VehicleModel>('model_db');
  vehicleModelListNotifier.value.clear();
  vehicleModelListNotifier.value.addAll(modelDB.values.toList());
  vehicleModelListNotifier.notifyListeners();
}

Future<void> delete(int index) async {
  final modelDB = await Hive.openBox<VehicleModel>('model_db');
  await modelDB.deleteAt(index);
  vehicleModelListNotifier.notifyListeners();
  getAll();
}
