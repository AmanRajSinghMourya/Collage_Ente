import 'package:ente/Constants/consts.dart';
import 'package:ente/Constants/modal.dart';
import 'package:ente/Screen/Components/custom_backdrop.dart';
import 'package:ente/Screen/Components/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CollageGrid extends StatelessWidget {
  const CollageGrid({
    super.key,
    required this.collages,
  });

  final RxList<Collage123> collages;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        collages.length,
        (index) {
          int length = collages[index].images.length;

          if (length == 1) {
            return Container(
              margin: margin,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: BackDrop(
                collages: collages,
                index: index,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(
                            collages[index].images[0],
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else if (length == 2) {
            return Container(
              margin: margin,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: BackDrop(
                collages: collages,
                index: index,
                children: [
                  Positioned(
                    top: 65,
                    left: 90,
                    child: CustomImage(
                      height: 100,
                      width: 100,
                      collageIndex: index,
                      collages: collages,
                      indexImage: 1,
                      zIndex: 0.2,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 0,
                    child: CustomImage(
                      height: 100,
                      width: 100,
                      collageIndex: index,
                      collages: collages,
                      indexImage: 0,
                      zIndex: -0.2,
                    ),
                  ),
                ],
              ),
            );
          } else if (length == 3) {
            return Container(
              margin: margin,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: collages[index].backgroundColor,
              ),
              child: BackDrop(
                collages: collages,
                index: index,
                children: [
                  Positioned(
                    top: 30,
                    left: 0,
                    child: CustomImage(
                      height: 80,
                      width: 80,
                      collageIndex: index,
                      collages: collages,
                      indexImage: 1,
                      zIndex: -0.4,
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 110,
                    child: CustomImage(
                      height: 80,
                      width: 80,
                      collageIndex: index,
                      collages: collages,
                      indexImage: 2,
                      zIndex: 0.4,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 40,
                    child: CustomImage(
                      height: 100,
                      width: 100,
                      collageIndex: index,
                      collages: collages,
                      indexImage: 0,
                      zIndex: 0.0,
                    ),
                  ),
                ],
              ),
            );
          } else if (length > 3) {
            return Container(
              margin: margin,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: collages[index].backgroundColor,
              ),
              child: BackDrop(
                index: index,
                collages: collages,
                children: [
                  Positioned(
                    top: 10,
                    left: 10,
                    child: CustomImage(
                      height: 80,
                      width: 80,
                      collageIndex: index,
                      collages: collages,
                      indexImage: 1,
                      zIndex: 0,
                    ),
                  ),
                  Positioned(
                    top: 95,
                    left: 30,
                    child: CustomImage(
                      height: 80,
                      width: 80,
                      collageIndex: index,
                      collages: collages,
                      indexImage: 2,
                      zIndex: 0,
                    ),
                  ),
                  Positioned(
                    top: 35,
                    left: 60,
                    child: CustomImage(
                      height: 100,
                      width: 100,
                      collageIndex: index,
                      collages: collages,
                      indexImage: 0,
                      zIndex: 0.0,
                    ),
                  ),
                  Positioned(
                    top: 135,
                    left: 140,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        '+${collages[index].images.length}',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
