import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListLoader extends StatelessWidget {
  final int itemCount;

  const ShimmerListLoader({super.key, this.itemCount = 10});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (_, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: double.infinity,
                          height: 16,
                          color: Colors.white),
                      const SizedBox(height: 8),
                      Container(width: 150, height: 14, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
