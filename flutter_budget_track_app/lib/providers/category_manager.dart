import 'package:flutter_budget_track/models/category_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryManager extends StateNotifier<List<CategoryModel>> {
  CategoryManager([List<CategoryModel>? initialTodos])
      : super(initialTodos ?? []);

  void addBudget(CategoryModel newData) {
    state = [...state, newData];
  }

  void removeBudget(CategoryModel removeData) {
    state = state.where((element) => element.id != removeData.id).toList();
  }
}

class SelectedCategoryNotifier extends StateNotifier<int> {
  SelectedCategoryNotifier() : super(-1); // No category selected initially
}
