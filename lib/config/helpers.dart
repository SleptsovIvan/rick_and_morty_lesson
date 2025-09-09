import 'package:flutter/material.dart';

double getImageLoadingProgress(ImageChunkEvent loadingProgress) {
  return loadingProgress.cumulativeBytesLoaded /
      (loadingProgress.expectedTotalBytes ?? 1);
}
