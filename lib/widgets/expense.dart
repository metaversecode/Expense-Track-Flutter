import 'package:expensetrack/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expensetrack/models/expenses.dart';
import 'package:expensetrack/widgets/expenses_list/expenses_list.dart';
import 'package:collection/collection.dart';

class expenses extends StatefulWidget{
  @override
  State<expenses> createState(){
    return _exp();
  }
}

class _exp extends State<expenses>{
  final List<Expense> _suju = [
   //Expense(date: DateTime.now(), title: "PC", amount: 1100, category: Category.work),
   //Expense(date: DateTime.now(), title: "Music", amount: 100, category: Category.leisure),
   //Expense(date: DateTime.now(), title: "Pizza", amount: 1000, category: Category.food)

  ];
  List<String> xz = [];
  var tx = "";
  double a = 0;
  var xx = 0;
 void mainn(){
  setState(() {
    xx = _suju.length;
    
    if(_suju.isNotEmpty){
    a = 0;
    for(var ex in _suju){
    a += ex.amount;
  }
    }
  });
  
  
 }

 void xc(){
  setState(() {
    tx = findMostFrequentName(xz).toString();
  });
 }
 String? findMostFrequentName(List<String> names) {
  if (names.isEmpty) {
    return "Add Some";
  }

  final groupedNames = groupBy(names, (name) => name);
  final mostFrequentEntry = groupedNames.entries.reduce((a, b) => a.value.length > b.value.length ? a : b);

  return mostFrequentEntry.key;
}
 @override
 void initState() {
    super.initState();
    // Call your function here
    mainn();
    xc();
  }



  void _show(){
    xc();
    mainn();
    showModalBottomSheet(isScrollControlled:true, context : context, builder: (ctx) => NewExpense(onAdde: adde,));
  }
  void adde(Expense expense){
    setState(() {
      xz.add(expense.category.name);
      _suju.add(expense);
       xc();
      mainn();
    });

  }
  
  void subtr(Expense expense){
    var con = _suju.indexOf(expense);
    setState(() {
      xz.remove(expense.category.name);
      _suju.remove(expense);
       xc();
      mainn();
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Expense Deleted"),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
        label: "Undo",
         onPressed: (){
          setState(() {
            xz.add(expense.category.name);
          _suju.insert(con, expense);
           xc();
          mainn();
        });
        }),
        ),
    );
  }
  @override

  Widget build(context){
    Widget mainscreen = Center(
      child : TextButton(
      onPressed: _show,
       child: const Text('No expenses found. Click to add Some!' , style: TextStyle(
        color: Color.fromARGB(255, 77, 77, 77),
        fontWeight: FontWeight.normal
       ),),
       ),

    );
    if(_suju.isNotEmpty){
      mainscreen =  Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20,),
            Row(
              children: [
                Expanded(

                child : Column(
                  children: [
                   // const SizedBox(height: 10,),
                    const Text("Average Type"),
                    Text(tx, style: const TextStyle(
              fontSize: 19,
              color: Color.fromARGB(255, 255, 54, 118)
            ),),
                  ],
                ),
                ),
                Expanded(

                child : Column(
                  children: [
                   // const SizedBox(height: 10,),
                    const Text("Total Exp"),
                    Text(xx.toString(), style: const TextStyle(
              fontSize: 19,
              color: Color.fromARGB(255, 255, 121, 18)
            ),),
                  ],
                ),
                ),
                Expanded(
                  child:
                 Column(
              children: [
                const Text("Total Amount" ),
                Text('₹${a.toString()}', style: const TextStyle(
              fontSize: 19,

              color: Colors.blue
            ),),
              ],
            ),
                ), 
              ],
            ),
           




            const SizedBox(height: 50,),
            const Text("All Expenses"),
            Expanded(child: ExpenseList(expenses: _suju , re: subtr))
          ],
        );
    }
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("Expenses"),
      
        actions: [
          IconButton(
            onPressed: _show,
           icon: const Icon(Icons.add), 
           ),
        ],
      ),
      body : Center(
        child: mainscreen
      ),
    );
  }
}