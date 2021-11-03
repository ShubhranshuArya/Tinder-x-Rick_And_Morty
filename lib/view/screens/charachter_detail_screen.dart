import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:grroom_tinder_lite/model/apiModel.dart';
import 'package:grroom_tinder_lite/view/widgets/custom_text.dart';

class CharachterDetailScreen extends StatelessWidget {
  final Result result;
  const CharachterDetailScreen({
    @required this.result,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 420,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        result.image,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white60,
                    child: Center(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () => Get.back(),
                        icon: Icon(
                          Icons.chevron_left_rounded,
                          size: 48,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                    text: "Name - ${result.name}",
                    color: Colors.black54,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  customText(
                    text: "Species -${result.species}",
                    color: Colors.black54,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  customText(
                    text: "Status - ${result.status}",
                    color: Colors.black54,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  customText(
                    text: "Gender -	${result.gender}",
                    color: Colors.black54,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  customText(
                    text: "Origin - ${result.location.name.split(' ')[0]}",
                    color: Colors.black54,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
