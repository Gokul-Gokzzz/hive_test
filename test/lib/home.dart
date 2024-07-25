import 'package:flutter/material.dart';
import 'package:test/add.dart';
import 'package:test/function.dart';
import 'package:test/model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    getAll();
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: vehicleModelListNotifier,
        builder: (context, List<VehicleModel> vehicleList, _) {
          if (vehicleList.isEmpty) {
            return Center(
              child: Text('No Data'),
            );
          }
          return ListView.builder(
            itemCount: vehicleList.length,
            itemBuilder: (context, index) {
              final model = vehicleList[index];
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Name:${model.name}'),
                    Text('PhoneNumber:${model.phoneNumber}'),
                    IconButton(
                      onPressed: () {
                        delete(index);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
