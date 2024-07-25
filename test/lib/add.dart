import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test/function.dart';
import 'package:test/model.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController vehicleModelController = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                child: Lottie.asset('assets/profile.json'),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: 'PhoneNumber'),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: vehicleModelController,
                  decoration: InputDecoration(labelText: 'Vehicle Model'),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: vehicleNumberController,
                  decoration: InputDecoration(labelText: 'Vehicle Number'),
                  keyboardType: TextInputType.number,
                ),
              ),
              TextButton(
                onPressed: onAdd,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onAdd() async {
    final name = nameController.text.trim();
    final phoneNumber = phoneController.text.trim();
    final vehicleModel = vehicleModelController.text.trim();
    final vehicleNumber = vehicleNumberController.text.trim();
    if (name.isEmpty ||
        phoneNumber.isEmpty ||
        vehicleNumber.isEmpty ||
        vehicleModel.isEmpty) {
      return;
    }
    final model = VehicleModel(
      name: name,
      phoneNumber: phoneNumber,
      vehicleModel: vehicleModel,
      vehicleNumber: vehicleNumber,
    );
    await add(model);
    Navigator.pop(context);
  }
}
