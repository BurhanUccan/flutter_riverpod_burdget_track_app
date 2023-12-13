import 'package:flutter/material.dart';
import 'package:flutter_budget_track/general_widgets/custom_text.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryElementWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final double iconSize;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryElementWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.iconSize,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: 170.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),

              //eğer seçilmiş ise renkli değil ise transparan
              color: isSelected ? color : Colors.transparent,
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: color,
                  ),
                  child: Icon(
                    icon,
                    color: Theme.of(context).colorScheme.background,
                    size: iconSize,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: CustomTextWidget(
                    //seçilmiş ise background değil ise onbackground
                    color: isSelected
                        ? Theme.of(context).colorScheme.background
                        : Theme.of(context).colorScheme.onBackground,
                    text: title,
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 30.w,
        )
      ],
    );
  }
}
