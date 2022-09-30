import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:streamskit_mobile/core/app/colors/app_color.dart';
import 'package:streamskit_mobile/core/util/custom_image/custom_netword_image.dart';
import 'package:streamskit_mobile/core/util/sizer_custom/sizer.dart';
import 'package:streamskit_mobile/core/util/themes/app_icons.dart';
import 'package:streamskit_mobile/features/profile/presentation/screens/profile_screen.dart';

class LiveCardProflie extends StatelessWidget {
  final String imageLive;
  final bool statusLive;
  final Color? categoryColorLive;
  final int viewerLive;
  final Function()? onTap;
  const LiveCardProflie({
    Key? key,
    required this.imageLive,
    required this.statusLive,
    required this.viewerLive,
    this.categoryColorLive,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Stack(
        children: [
          CustomNetworkImage(
            urlToImage: imageLive,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16.sp),
            height: 175.sp,
          ),
          statusLive
              ? Positioned(
                  right: 5.sp,
                  top: 8.sp,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.sp,
                      vertical: 4.sp,
                    ),
                    decoration: BoxDecoration(
                      color: categoryColorLive ?? colorReds400,
                      borderRadius: BorderRadius.circular(
                        9.sp,
                      ),
                    ),
                    child: Text(
                      "Live",
                      style: TextStyle(
                        color: mCL,
                        fontSize: 9.sp,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          statusLive
              ? Positioned(
                  left: 5.sp,
                  top: 8.sp,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.sp),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 4,
                        sigmaY: 4,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.sp,
                          vertical: 4.sp,
                        ),
                        decoration: BoxDecoration(
                          color: mCH.withOpacity(0.45),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              iconEye,
                              height: 13.sp,
                              width: 13.sp,
                              fit: BoxFit.cover,
                              color: Theme.of(context).primaryColorLight,
                            ),
                            SizedBox(width: 5.sp),
                            Text(
                              formatNumberViewer(viewerLive),
                              style: TextStyle(
                                color: Theme.of(context).primaryColorLight,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}