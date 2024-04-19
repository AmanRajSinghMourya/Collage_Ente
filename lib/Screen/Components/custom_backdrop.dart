import 'dart:ui';

import 'package:ente/Constants/modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class BackDrop extends StatelessWidget {
  const BackDrop({
    required this.index,
    super.key,
    required this.collages,
    required this.children,
  });
  final List<Widget> children;
  final RxList<Collage123> collages;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: FileImage(
                collages[index].images[0],
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        ...children,
      ],
    );
  }
}
