import 'package:flutter/material.dart';
import 'package:expensetrack/models/expenses.dart';

class ExpenseList extends StatelessWidget{
  const ExpenseList({super.key , required this.expenses , required this.re});
  final void Function(Expense expense) re;
  
  final List<Expense> expenses;
    @override

  Widget build(context){
    return ListView.builder(itemCount: expenses.length ,itemBuilder: (ctx , index) => Dismissible(
          background: Container(
            
            decoration: BoxDecoration(
                color: Colors.red,
              borderRadius: BorderRadius.circular(10.0),
            ),
          
            margin: const EdgeInsets.fromLTRB(5, 16, 5, 0),
            // Set the desired radius value
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 45, 0, 0),
                  child:  const Align(
                    alignment: Alignment.centerLeft,
                    
                  child:  Text("Delete" ,textAlign: TextAlign.center, style: TextStyle(
                    color: Colors.white,
                  fontSize: 20,
                  
                  
                  ),),
                  ),
                ),
               Container(
              margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: const Align(
                alignment: Alignment.topRight,
                
              child:  Text("Delete" ,textAlign: TextAlign.center, style: TextStyle(
                color: Colors.white,
              fontSize: 20,
              
              
              ),),
              ),
            ),
            
           
              ],
            ),
          ),
          onDismissed:(direction) {
            re(expenses[index]);
          },
          key: ValueKey(expenses[index]),
        
              child:
             Container(
              decoration: BoxDecoration(
            color: Colors.blue, // Set your desired background color here
            borderRadius: BorderRadius.circular(10.0), // Set the desired radius value
          ),
              margin: const EdgeInsets.fromLTRB(5 , 12 , 5 , 0),
             
               child: Padding(
                
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(expenses[index].title, style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30
                          ),),
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            Text('₹${expenses[index].amount.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white)),
                         const Spacer(),
                         Row(
                          children: [
                          Icon(cIcons[expenses[index].category]),
                            const SizedBox(width: 20,),
                            Text(expenses[index].fdate, style: const TextStyle(color: Colors.white))
                          ],
                         ),
                          ],
                          
                        )
                      ],
                    ),
                  ),
             )
              ),
      
    );
  }
}