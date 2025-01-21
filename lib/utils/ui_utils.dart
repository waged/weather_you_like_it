import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lottie/lottie.dart';

void scrollToFirst(ScrollController scrollController) {
  scrollController.animateTo(
    scrollController.position.minScrollExtent,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeOut,
  );
}

void scrollToEnd(ScrollController scrollController) {
  scrollController.animateTo(
    scrollController.position.maxScrollExtent,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeOut,
  );
}

Widget getAnimatedImage(String animationName, bool isLoop) {
  return SizedBox(
    height: 100.0,
    width: 100.0,
    child: Lottie.asset(animationName, repeat: isLoop),
  );
}

Widget loadingEffect(BuildContext context) {
  return Expanded(
    child: SingleChildScrollView(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[500]!,
        highlightColor: Colors.grey[700]!,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity, height: 80.0, color: Colors.grey),
              const SizedBox(height: 8.0),
              Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 80.0,
                  color: Colors.grey),
              const SizedBox(height: 8.0),
              Container(
                  width: double.infinity, height: 80.0, color: Colors.grey),
              const SizedBox(height: 8.0),
              Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 80.0,
                  color: Colors.grey),
            ],
          ),
        ),
      ),
    ),
  );
}
