import 'package:uuid/uuid.dart';

import 'category_model.dart';

class BudgetModel {
  //false ise gider true ise gelir
  final String id = Uuid().v4();
  final bool tip;
  final double tutar;
  final DateTime zaman;
  final CategoryModel category;

  BudgetModel(
      {required this.tip,
      required this.tutar,
      required this.zaman,
      required this.category});
}
