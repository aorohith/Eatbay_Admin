import 'package:eatbay_admin/views/widgets/core/dimensions.dart';
import 'package:flutter/material.dart';

class DetailImageSection extends StatelessWidget {
  String imagePath;
  DetailImageSection({
    Key? key,
    this.imagePath="https://www.hungryforever.com/wp-content/uploads/2015/11/feature-image-gulab-jamun-1280x720.jpg",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          color: Colors.white,
          height: Dimensions.screenHeight,
          child: Column(
            children: [
              Container(
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        imagePath,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        );
  }
}
