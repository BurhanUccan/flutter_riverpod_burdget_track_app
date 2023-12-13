import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CategoryModel {
  final bool tip;
  final String id = Uuid().v4().toString();
  final IconData icon;
  final Color color;
  final String title;

  CategoryModel({
    required this.icon,
    required this.color,
    required this.title,
    required this.tip,
  });
}
