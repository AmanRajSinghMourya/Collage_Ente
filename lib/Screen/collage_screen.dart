import 'package:ente/Constants/consts.dart';
import 'package:ente/Screen/Components/collage_grid.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ente/Controller/image_picker.dart';

class CollageScreen extends StatelessWidget {
  final PhotoController photoController = Get.put(PhotoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: const Text(appName,
            style:
                TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
      ),
      backgroundColor: backgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade900,
        onPressed: () async {
          await photoController.selectPhotos();
        },
        child: Obx(() {
          if (photoController.isCollageCreated.value == true) {
            return const CircularProgressIndicator();
          } else {
            return const Icon(
              size: 30,
              Icons.add_a_photo_rounded,
              color: Colors.white,
            );
          }
        }),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    welcome,
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white70,
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(
                height: 12,
                thickness: 2,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                // final selectedPhotos = photoController.selectedPhotos;
                // final selectedColors = photoController.selectedColors;
                final isCollageCreated = photoController.isCollageCreated;
                final collages = photoController.collages;

                if (isCollageCreated.value == true) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return CollageGrid(collages: collages);
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
