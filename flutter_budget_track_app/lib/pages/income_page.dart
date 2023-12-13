import 'package:flutter/material.dart';
import 'package:flutter_budget_track/general_widgets/catagory_list_element.dart';
import 'package:flutter_budget_track/providers/all_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../general_widgets/piechart_widget.dart';

class IncomePage extends ConsumerWidget {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allBudgets = ref.watch(filteredBudgetList);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            width: 20,
          ),
          const SizedBox(
            child: PieChartWidget(),
          ),
          SizedBox(
            height: 100.h,
          ),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: allBudgets.length,
                itemBuilder: (context, index) {
                  return CategoryListElement(
                    balance: allBudgets[index].tutar.toString(),
                    color: allBudgets[index].category.color,
                    icon: allBudgets[index].category.icon,
                    title: allBudgets[index].category.title,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
