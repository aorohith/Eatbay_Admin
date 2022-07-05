import 'package:eatbay_admin/views/delivery_locations/widgets/admin_tile_without_icon.dart';
import 'package:flutter/material.dart';

class DeliveryLocationPage extends StatelessWidget {
  const DeliveryLocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avalilable Locations"),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return AdminTileWithoutIcon(text: "Place $index");
          },
        ),
      ),
    );
  }
}
