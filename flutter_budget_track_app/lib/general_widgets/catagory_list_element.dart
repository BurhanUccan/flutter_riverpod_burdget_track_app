import 'package:flutter/material.dart';
import 'package:flutter_budget_track/general_widgets/Icon_widget.dart';
import 'package:flutter_budget_track/general_widgets/general_text.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryListElement extends StatelessWidget {
  final Color color;
  final String title;
  final String balance;
  final IconData icon;

  const CategoryListElement(
      {super.key,
      required this.color,
      required this.title,
      required this.balance,
      required this.icon});
// kategori,icon ,renk, tutar
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconWidget(
                  icon: icon,
                  color: color,
                  iconSize: 40,
                ),
                SizedBox(
                  width: 40.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GeneralCustomTextWidget(
                      text: title,
                      fontSize: 25,
                      isBold: true,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    GeneralCustomTextWidget(
                      text: balance,
                      fontSize: 15,
                      isBold: true,
                    ),
                  ],
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: Colors.black),
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.background,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
