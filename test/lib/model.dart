import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class VehicleModel {
  @HiveField(0)
  int? index;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String phoneNumber;

  @HiveField(3)
  final String vehicleModel;

  @HiveField(4)
  final String vehicleNumber;

  VehicleModel(
      {required this.name,
      required this.phoneNumber,
      required this.vehicleModel,
      required this.vehicleNumber});
}
