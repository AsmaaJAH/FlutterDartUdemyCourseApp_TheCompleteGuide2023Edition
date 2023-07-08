import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();

enum Category { food, clothes, work, education, leisure }

//map
const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.clothes: Icons.collections_sharp,
  Category.work: Icons.work,
  Category.education: Icons.cast_for_education,
  Category.leisure: Icons.movie,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}