import 'package:flutter/material.dart';
import 'package:flutter_budget_track/general_widgets/tab_item.dart';

import 'package:flutter_budget_track/pages/add_income_page.dart';
import 'package:flutter_budget_track/providers/all_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddBudgetPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var page = ref.watch(budgetFilterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Işlem Ekle'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    ref.read(budgetFilterProvider.notifier).state =
                        BudgetFilter.gelir;
                  },
                  child: TabItem(
                      text: 'GELIR', isSelected: page == BudgetFilter.gelir),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    ref.read(budgetFilterProvider.notifier).state =
                        BudgetFilter.gider;
                  },
                  child: TabItem(
                      text: 'GIDERLER', isSelected: page == BudgetFilter.gider),
                ),
              ),
            ],
          ),
          Expanded(
            child: page == BudgetFilter.gelir
                ? AddIncomeWidget()
                : AddIncomeWidget(),
          ),
        ],
      ),
    );
  }
}
