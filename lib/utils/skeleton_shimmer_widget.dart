import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonShimmerWidget extends StatelessWidget {
  const SkeletonShimmerWidget({super.key, this.height, this.width});

  final double? height, width;
  

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFC7C7C7),
      highlightColor: const Color(0xFFF9F8F8),
      child: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        
      ),
    );
  }
}