import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
enum Category {food , travel , leisure, work}
final formatter = DateFormat.yMd();
const cIcons = {
  Category.food : Icons.food_bank,
  Category.travel : Icons.card_travel_rounded,
  Category.leisure  : Icons.movie_creation_rounded,
  Category.work : Icons.work
};
class Expense{
  Expense({
    required this.date,
    required this.title,
    required this.amount,
    required this.category,

  }) : id = const Uuid().v4();
   final String id;
   final String title;
   final double amount;
   final DateTime date;
   final Category category;

   String get fdate{
    return(formatter.format(date));
   }
   
}

class chartofexpense{
  const chartofexpense({required this.category , required this.expenses});
  final Category category;
  final List<Expense> expenses;

  double get totalExpenses{
    double sum = 0;
    for(final ex in expenses){
      sum += ex.amount;
    }
    return sum;
  }
}

