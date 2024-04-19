import 'package:ente/Constants/modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    required this.collageIndex,
    required this.width,
    required this.height,
    super.key,
    required this.indexImage,
    required this.collages,
    required this.zIndex,
  });
  final int indexImage;
  final RxList<Collage123> collages;
  final double zIndex;
  final int collageIndex;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.rotationZ(zIndex),
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.file(
          collages[collageIndex].images[indexImage],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
