import 'package:flutter/material.dart';
import 'package:intellijinteriors/core/app_export.dart';
import 'package:intellijinteriors/widgets/custom_button.dart';

// ignore: must_be_immutable
class KanbanboardItemWidget extends StatelessWidget {
  KanbanboardItemWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Container(
        padding: getPadding(
          left: 19,
          top: 20,
          right: 19,
          bottom: 20,
        ),
        decoration: AppDecoration.outlineGray70011.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: getPadding(
                left: 1,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    height: getVerticalSize(
                      23,
                    ),
                    width: getHorizontalSize(
                      81,
                    ),
                    text: "Low Priority",
                    variant: ButtonVariant.FillDeeporangeA10033,
                    padding: ButtonPadding.PaddingAll3,
                    fontStyle: ButtonFontStyle.GilroyMedium12Deeporange400,
                  ),
                  Padding(
                    padding: getPadding(
                      top: 2,
                    ),
                    child: Text(
                      ". . .",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterExtraBold16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                left: 1,
                top: 9,
              ),
              child: Text(
                "",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtGilroySemiBold18Gray90002,
              ),
            ),
            Container(
              width: getHorizontalSize(
                307,
              ),
              margin: getMargin(
                left: 1,
                top: 2,
                right: 49,
              ),
              child: Text(
                "",
                maxLines: null,
                textAlign: TextAlign.left,
                style: AppStyle.txtGilroyMedium12,
              ),
            ),
            Padding(
              padding: getPadding(
                left: 1,
                top: 18,
                right: 3,
              ),
              child: Row(
                children: [
                  Container(
                    height: getVerticalSize(
                      24,
                    ),
                    width: getHorizontalSize(
                      63,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgEllipse1524x24,
                          height: getSize(
                            24,
                          ),
                          width: getSize(
                            24,
                          ),
                          radius: BorderRadius.circular(
                            getHorizontalSize(
                              12,
                            ),
                          ),
                          alignment: Alignment.centerRight,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgEllipse1324x251,
                          height: getVerticalSize(
                            24,
                          ),
                          width: getHorizontalSize(
                            25,
                          ),
                          radius: BorderRadius.circular(
                            getHorizontalSize(
                              12,
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgEllipse1224x241,
                          height: getSize(
                            24,
                          ),
                          width: getSize(
                            24,
                          ),
                          radius: BorderRadius.circular(
                            getHorizontalSize(
                              12,
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  CustomImageView(
                    svgPath: ImageConstant.imgCar,
                    height: getSize(
                      16,
                    ),
                    width: getSize(
                      16,
                    ),
                    margin: getMargin(
                      top: 4,
                      bottom: 4,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 5,
                      top: 3,
                      bottom: 5,
                    ),
                    child: Text(
                      "2 comments",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtGilroyMedium12,
                    ),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgFile16x16,
                    height: getSize(
                      16,
                    ),
                    width: getSize(
                      16,
                    ),
                    margin: getMargin(
                      left: 19,
                      top: 4,
                      bottom: 4,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 5,
                      top: 4,
                      bottom: 4,
                    ),
                    child: Text(
                      "0 files",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtGilroyMedium12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
