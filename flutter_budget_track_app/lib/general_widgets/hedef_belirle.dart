import 'package:flutter/material.dart';
import 'package:flutter_budget_track/general_widgets/general_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HedefBelirle extends StatelessWidget {
  const HedefBelirle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.loose,
      children: [
        Positioned(
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              height: 200.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 220, 67, 67)),
              child: const GeneralCustomTextWidget(
                text: "Tasarruf hedefi belirle!",
                fontSize: 20,
                isBold: true,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -230.h,
          right: -120.w,
          child: Image(
            image: const AssetImage("lib/assets/target.png"),
            fit: BoxFit.cover,
            height: 500.h,
            width: 500.w,
          ),
        )
      ],
    );
  }
}
