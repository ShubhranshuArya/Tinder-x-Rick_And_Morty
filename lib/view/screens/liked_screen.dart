import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grroom_tinder_lite/core/controller/list_data_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

import 'package:grroom_tinder_lite/view/widgets/custom_text.dart';

class LikedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListDataController>(
      init: ListDataController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.chevron_left_rounded,
                        size: 40,
                      ),
                    ),
                    customText(
                      text: "Liked Cast",
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                (controller.likedList.length == 0)
                    ? Expanded(
                      child: Center(
                          child: customText(
                            text: "List is empty",
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                    )
                    : Expanded(
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (_, idx) {
                            return Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                controller.likedList[idx].image,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        customText(
                                          text:controller.likedList[idx].name.split(" ")[0],
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.deleteFromLiked(idx);
                                      },
                                      child: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.grey[200],
                                        child: WebsafeSvg.asset(
                                          "assets/x_icon.svg",
                                          height: 20,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (_, idx) {
                            return SizedBox(
                              height: 20,
                            );
                          },
                          itemCount: controller.likedList.length,
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
