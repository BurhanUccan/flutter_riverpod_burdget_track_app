import 'package:flutter_budget_track/models/budget_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BudgetManager extends StateNotifier<List<BudgetModel>> {
  //köşeli parantezin anlamı yazmak zorunda değilsin
  BudgetManager([List<BudgetModel>? initialTodos]) : super(initialTodos ?? []);

  void addBudget(BudgetModel newData) {
    state = [...state, newData];
  }

  void removeBudget(BudgetModel removeData) {
    state = state.where((element) => element.id != removeData.id).toList();
  }
}
