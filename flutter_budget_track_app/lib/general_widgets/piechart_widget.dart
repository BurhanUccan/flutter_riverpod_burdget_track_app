import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_budget_track/general_widgets/general_text.dart';
import 'package:flutter_budget_track/general_widgets/piechart_filter.dart';

import 'package:flutter_budget_track/providers/all_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../pages/add_budget_page.dart';

class PieChartWidget extends ConsumerWidget {
  const PieChartWidget({super.key});
// gelir mi gider mi kontrol
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalBudget = ref.watch(getTotalBudgetProvider);

    var piefromProvider = ref.watch(getPieDataProvider);

    return Column(
      children: [
        Row(
          children: [
            //burası değiştiğinde heryer değişecek
            PieChartFilter(),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              height: 420.h,
              width: 420.w,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  GeneralCustomTextWidget(
                    text: totalBudget.toString() + " TL",
                    fontSize: 25,
                    isBold: true,
                  ),
                  // Buraya liste gelecek

                  PieChart(
                    swapAnimationDuration: Duration(milliseconds: 300),
                    PieChartData(
                      sections: piefromProvider.length > 0
                          ? piefromProvider
                          : [
                              PieChartSectionData(
                                showTitle: false,
                                value: 200,
                                color: Colors.grey.shade500,
                              ),
                            ],

                      // PieChartSectionData(
                      //   showTitle: false,
                      //   value: 50,
                      //   color: const Color.fromARGB(255, 255, 126, 117),
                      // ),
                      // PieChartSectionData(
                      //   showTitle: false,
                      //   value: 20,
                      //   color: const Color.fromARGB(255, 116, 192, 255),
                      // ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: Colors.green),
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  size: 30,
                  color: Theme.of(context).colorScheme.background,
                ),
                onPressed: () {
                  //para ekleme ekranı
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AddBudgetPage();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
