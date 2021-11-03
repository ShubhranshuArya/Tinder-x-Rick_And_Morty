import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grroom_tinder_lite/core/controller/list_data_controller.dart';
import 'package:grroom_tinder_lite/view/screens/charachter_detail_screen.dart';
import 'package:grroom_tinder_lite/view/screens/disliked_screen.dart';
import 'package:grroom_tinder_lite/view/screens/liked_screen.dart';
import 'package:grroom_tinder_lite/view/widgets/custom_text.dart';
import 'package:grroom_tinder_lite/view/widgets/user_avatar.dart';
import 'package:tcard/tcard.dart';
import 'package:websafe_svg/websafe_svg.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TCardController _swipeController = TCardController();

    return GetBuilder<ListDataController>(
      init: ListDataController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffFD297B).withOpacity(0.8),
                  Color(0xffFF655B).withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 32,
                left: 24,
                right: 24,
                bottom: 44,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(
                          text: "Mike's Feed",
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        userAvatar(),
                      ],
                    ),
                  ),
                  (controller.isLoading)
                      ? Center(
                          child: CircularProgressIndicator(
                          color: Colors.white,
                        ))
                      : GestureDetector(
                          onTap: () => Get.to(
                            () => CharachterDetailScreen(
                              result: controller
                                  .staticData.results[controller.itemIndex],
                            ),
                            transition: Transition.fadeIn,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.decelerate,
                          ),
                          child: TCard(
                            lockYAxis: true,
                            controller: _swipeController,
                            size: Size(double.infinity, 460),
                            cards: controller.cards(),
                            onForward: (idx, info) {
                              /// Pagination Not working.
                              // if (idx == 18) {
                              //   controller.paginateData(controller.nextBatch);
                              // }
                              if (info.direction == SwipDirection.Right) {
                                controller.addToLikedList();
                                Get.snackbar(
                                    controller.staticData.results[idx - 1].name,
                                    "Added to Liked Cast",
                                    snackPosition: SnackPosition.BOTTOM,
                                    colorText: Colors.white,
                                    borderRadius: 0,
                                    margin: EdgeInsets.zero,
                                    duration: Duration(seconds: 1),
                                    backgroundColor: Colors.black);
                              } else {
                                controller.addToDislikedList();
                              }
                            },
                          ),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _customCircleAvatar(
                        iconLocation: "assets/x_icon.svg",
                        goToScreen: () => Get.to(
                          DislikedScreen(),
                          transition: Transition.leftToRightWithFade,
                          duration: Duration(milliseconds: 600),
                          curve: Curves.decelerate,
                        ),
                        bgColor: Colors.greenAccent.withOpacity(0.8),
                        iconColor: Colors.white,
                        iconHeight: 40,
                      ),
                      SizedBox(
                        width: 48,
                      ),
                      _customCircleAvatar(
                        iconLocation: "assets/heart_icon.svg",
                        goToScreen: () => Get.to(LikedScreen(),
                            transition: Transition.rightToLeftWithFade,
                            duration: Duration(milliseconds: 600),
                            curve: Curves.decelerate),
                        bgColor: Colors.white60,
                        iconColor: Color(0xffFF5864),
                        iconHeight: 32,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _customCircleAvatar({
    @required String iconLocation,
    @required Function goToScreen,
    Color bgColor,
    Color iconColor,
    double iconHeight,
  }) {
    return GestureDetector(
      onTap: goToScreen,
      child: CircleAvatar(
        radius: 32,
        backgroundColor: bgColor,
        child: WebsafeSvg.asset(
          iconLocation,
          height: iconHeight,
          color: iconColor,
        ),
      ),
    );
  }
}
