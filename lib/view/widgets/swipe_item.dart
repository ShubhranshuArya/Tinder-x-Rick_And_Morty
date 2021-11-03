import 'package:flutter/material.dart';

import 'package:grroom_tinder_lite/model/apiModel.dart';
import 'package:grroom_tinder_lite/view/widgets/custom_text.dart';

class SwipeItem extends StatelessWidget {
  final Result apiData;
  const SwipeItem({
    @required this.apiData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 20,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.white60,
            spreadRadius: 4,
            offset: Offset(0, 4),
          )
        ],
        image: DecorationImage(
          image: NetworkImage(
            apiData.image,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.center,
          ),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 24,
            bottom: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              customText(
                text: apiData.name,
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
              customText(
                text: "${apiData.status}, ${apiData.species}",
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              customText(
                text: apiData.gender,
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )
            ],
          ),
        ),
      ),
    );
  }
}
