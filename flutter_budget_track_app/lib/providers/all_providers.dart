import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_budget_track/models/budget_model.dart';
import 'package:flutter_budget_track/models/category_model.dart';
import 'package:flutter_budget_track/providers/add_nutton_manager.dart';
import 'package:flutter_budget_track/providers/budget_manager.dart';
import 'package:flutter_budget_track/providers/category_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

enum BudgetFilter { gelir, gider }

final budgetFilterProvider =
    StateProvider<BudgetFilter>((ref) => BudgetFilter.gelir);

enum TimeFilter { today, thisWeek, thisMonth }

final timeFilterProvider = StateProvider<TimeFilter>((ref) => TimeFilter.today);

final BudgetListProvider =
    StateNotifierProvider<BudgetManager, List<BudgetModel>>(
  (ref) => BudgetManager(
    [
      BudgetModel(
        tip: false,
        tutar: 100,
        zaman: DateTime.now().subtract(Duration(days: 5)),
        category: CategoryModel(
            icon: Iconsax.book,
            color: Colors.amber,
            title: "Ders Masrafları",
            tip: false),
      ),
      BudgetModel(
        tip: true,
        tutar: 200,
        zaman: DateTime.now().subtract(Duration(days: 1)),
        category: CategoryModel(
            icon: Iconsax.money_2, color: Colors.red, title: "Maaş", tip: true),
      ),
      BudgetModel(
        tip: false,
        tutar: 80,
        zaman: DateTime.now().subtract(Duration(days: 1)),
        category: CategoryModel(
            icon: Iconsax.bag,
            color: Colors.green,
            title: "Seyehat Gideri",
            tip: false),
      ),
    ],
  ),
);

final filteredBudgetList = Provider<List<BudgetModel>>(
  (ref) {
    final budgetfilter = ref.watch(budgetFilterProvider);
    final timefilter = ref.watch(timeFilterProvider);
    final budgetlist = ref.watch(BudgetListProvider);
    if (budgetfilter == BudgetFilter.gelir) {
      if (timefilter == TimeFilter.today) {
        return budgetlist
            .where((element) =>
                element.tip &&
                element.zaman.isAfter(
                  DateTime.now().subtract(
                    Duration(days: 1),
                  ),
                ))
            .toList();
      } else if (timefilter == TimeFilter.thisWeek) {
        return budgetlist
            .where((element) =>
                element.tip &&
                element.zaman.isAfter(
                  DateTime.now().subtract(
                    Duration(days: 7),
                  ),
                ) &&
                element.zaman.isBefore(DateTime.now()))
            .toList();
      } else if (timefilter == TimeFilter.thisMonth) {
        return budgetlist
            .where((element) =>
                element.tip &&
                element.zaman.isAfter(
                  DateTime.now().subtract(
                    Duration(days: 30),
                  ),
                ) &&
                element.zaman.isBefore(DateTime.now()))
            .toList();
      } else
        return [];
    } else if (budgetfilter == BudgetFilter.gider) {
      if (timefilter == TimeFilter.today) {
        return budgetlist
            .where((element) =>
                !element.tip &&
                element.zaman.isAfter(
                  DateTime.now().subtract(
                    Duration(days: 1),
                  ),
                ))
            .toList();
      } else if (timefilter == TimeFilter.thisWeek) {
        return budgetlist
            .where((element) =>
                !element.tip &&
                element.zaman.isAfter(
                  DateTime.now().subtract(
                    Duration(days: 7),
                  ),
                ) &&
                element.zaman.isBefore(DateTime.now()))
            .toList();
      } else if (timefilter == TimeFilter.thisMonth) {
        return budgetlist
            .where((element) =>
                !element.tip &&
                element.zaman.isAfter(
                  DateTime.now().subtract(
                    Duration(days: 30),
                  ),
                ) &&
                element.zaman.isBefore(DateTime.now()))
            .toList();
      } else
        return [];
    } else
      return [];
  },
);
final getOnlyCategoryList = Provider<List<CategoryModel>>((ref) {
  final budgetlist = ref.watch(BudgetListProvider);
  return budgetlist.map((e) => e.category).toList();
});

final getTotalBudgetProvider = Provider<double>((ref) {
  //filtered ile değiş
  var budgetlist = ref.watch(filteredBudgetList);
  if (budgetlist.length > 0) {
    var onlybudets = budgetlist.map((e) => e.tutar).toList();
    return onlybudets.reduce((value, element) => value + element);
  } else {
    return 0;
  }
});
final getCurrentBalance = Provider<double>((ref) {
  var budgetlist = ref.watch(BudgetListProvider);
  var incomeList =
      budgetlist.where((element) => element.tip).map((e) => e.tutar);
  var expanceList =
      budgetlist.where((element) => !element.tip).map((e) => e.tutar);

  var sumIncome = incomeList.reduce((value, element) => value + element);
  var sumExpens = expanceList.reduce((value, element) => value + element);
  return sumIncome - sumExpens;
});

//---------------------------------------------------------------------------- PieWidgeti
final getPieDataProvider = StateProvider<List<PieChartSectionData>>((ref) {
  var budgetlist = ref.watch(filteredBudgetList);
  List<PieChartSectionData> pieData = [];
  for (var item in budgetlist) {
    pieData.add(PieChartSectionData(
        showTitle: false, value: item.tutar, color: item.category.color));
  }
  return pieData;
});

final CategoryListProvider =
    StateNotifierProvider<CategoryManager, List<CategoryModel>>(
  (ref) => CategoryManager(
    [
      CategoryModel(
          icon: Iconsax.gift,
          color: Colors.green.shade200,
          title: "Hediye",
          tip: true),
      CategoryModel(
          icon: Iconsax.card,
          color: Colors.purple.shade200,
          title: "Maaş",
          tip: true),
      CategoryModel(
          icon: Iconsax.car,
          color: Colors.yellow.shade200,
          title: "Taxi",
          tip: true),
      CategoryModel(
          icon: Icons.shopping_basket,
          color: Colors.green.shade200,
          title: "Alışveriş",
          tip: false),
      CategoryModel(
          icon: Icons.oil_barrel,
          color: Colors.red.shade200,
          title: "Yakıt",
          tip: false),
      CategoryModel(
          icon: Iconsax.tenx_pay,
          color: Colors.blue.shade200,
          title: "Fatura",
          tip: false),
    ],
  ),
);

final filteredCategoryListProvider = Provider<List<CategoryModel>>((ref) {
  var allList = ref.watch(CategoryListProvider);
  var page = ref.watch(budgetFilterProvider);
  if (page == BudgetFilter.gelir) {
    return allList.where((element) => element.tip).toList();
  } else {
    return allList.where((element) => !element.tip).toList();
  }
});

final selectedCategoryProvider =
    StateNotifierProvider<SelectedCategoryNotifier, int>((ref) {
  return SelectedCategoryNotifier();
});

final addButtonProvider = Provider<bool>((ref) {
  var selectedCategory = ref.watch(selectedCategoryProvider);
  var textController = ref.watch(textControllerProvider);

  if (selectedCategory != -1 && textController.textController.text != "") {
    return true;
  } else {
    return false;
  }
});
