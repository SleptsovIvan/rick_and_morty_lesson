import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty_lesson/config/app_colors.dart';
import 'package:rick_and_morty_lesson/config/helpers.dart';
import 'package:rick_and_morty_lesson/gen/assets.gen.dart' show Assets;
import 'package:rick_and_morty_lesson/models/character/character.dart';

class CharacterCard extends StatelessWidget {
  static const double _borderRadius = 20;
  static const double _likeContainerSize = 30;
  static const double _loaderSize = 40;
  static const double _iconSize = 20;

  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      elevation: 0,
      child: SizedBox(
        width: 160,
        height: 215,
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  character.image,
                  frameBuilder:
                      (
                        BuildContext context,
                        Widget child,
                        int? frame,
                        bool wasSynchronouslyLoaded,
                      ) {
                        if (wasSynchronouslyLoaded || frame != null) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                _borderRadius,
                              ),
                            ),
                            child: child,
                          );
                        } else {
                          return SizedBox(
                            width: 160,
                            height: 160,
                            child: SizedBox(
                              height: _loaderSize,
                              width: _loaderSize,
                              child: Center(child: CircularProgressIndicator()),
                            ),
                          );
                        }
                      },
                  loadingBuilder:
                      (
                        BuildContext context,
                        Widget child,
                        ImageChunkEvent? loadingProgress,
                      ) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return SizedBox(
                            width: 160,
                            height: 160,
                            child: SizedBox(
                              height: _loaderSize,
                              width: _loaderSize,
                              child: Center(
                                child: CircularProgressIndicator(
                                  value:
                                      loadingProgress.expectedTotalBytes != null
                                      ? getImageLoadingProgress(loadingProgress)
                                      : 0,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                ),
                Positioned(
                  child: Container(
                    width: _likeContainerSize,
                    height: _likeContainerSize,
                    decoration: BoxDecoration(
                      color: AppColors.whiteSmoke,
                      borderRadius: BorderRadius.circular(_likeContainerSize),
                    ),
                    child: Center(
                      child: SvgPicture.asset(Assets.images.unliked.path),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
