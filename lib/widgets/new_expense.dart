import 'package:flutter/material.dart';
import 'package:expensetrack/models/expenses.dart';

class NewExpense extends StatefulWidget{
const NewExpense({super.key , required this.onAdde});
  final void Function(Expense expense) onAdde;
 @override
 State<NewExpense> createState(){
  return _NewExpenseState();
 }
}

class _NewExpenseState extends State<NewExpense>{
  //var txt1 = "";
  //void _st(String inputValue){
  //  txt1 = inputValue;
//
  //}
  DateTime ? _dateee;
  void _datee(){

    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(DateTime.now().year -1 , DateTime.now().month , DateTime.now().day ), lastDate: DateTime.now())
    .then((value) {
      setState(() {
            _dateee = value;

      });
    });
  }
  final textc = TextEditingController();
  final textc1 = TextEditingController();
  Category _selectedcategory = Category.leisure;
@override
  void dispose() {
    textc.dispose();
    textc1.dispose();
    super.dispose();
  }
  void _yess(){
    var a = double.tryParse(textc1.text);
    var b = a == null || a <= 0; 
    if(textc.text.trim().isEmpty || b || _dateee == null){
      showDialog(context: context, builder: (ctx) => AlertDialog(
        title:   const Text("Typo error"),
        content: const Text("Make sure you have entered correct title, amount, date or category "),
        actions: [
          TextButton(
            onPressed: (){ Navigator.pop(context);},
           child: const Text("I understood"))
        ],
      )
      
      );
      return;
    }
    else{
    widget.onAdde(Expense(date: _dateee!, title: textc.text, amount: a, category: _selectedcategory));
    Navigator.pop(context);
    }
  }
@override
Widget build(context){
  return Padding(
    padding: const EdgeInsets.fromLTRB(16,48,48,16),
    child: Column(
      children: [
        TextField(
          //onChanged: _st,
          controller: textc,
          maxLength: 50,
          decoration: const InputDecoration(
            label: Text("Name")
          ),
        ),
        const SizedBox(height: 20,),
        Row(
          children: [
            Expanded(child: TextField(
              controller: textc1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefixText: '₹',
                label: Text("Amount")
              ),
            ),
            ),
            Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Text(_dateee == null ? "Select Date" : formatter.format(_dateee!)),
              const SizedBox(width: 16),
              IconButton(
              onPressed: _datee, 
              icon: const Icon(Icons.calendar_month),
              ),
            ],
            ),
            ),
          ],
        ),

        const SizedBox(height: 30,),
        Row(
          children: [
            Expanded(child: 
            DropdownButton(
              value: _selectedcategory,
              items: Category.values.map(
                (category) => 
                DropdownMenuItem(
                  value: category,
                  
                  child: Text(category.name.toUpperCase(), style: const TextStyle(color: Colors.black),)
                  ) 
                  ).toList(),
                 onChanged: (value) {
                  if(value == null){
                    return;
                  }
                  setState(() {
                    
                    _selectedcategory = value;
                  });
                 
                 }),
            ),
            TextButton(
                onPressed: (){Navigator.pop(context);}, 
              child: const Text("Cancel")
              ),
            ElevatedButton(
                onPressed: _yess,
                
                style: ButtonStyle(
            
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.fromLTRB(30 , 16 ,30 , 16),
                      
                    ),         
                        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 14, 94)), 
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),       
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: const Text("Add"),
              ),
              const SizedBox(width: 10,),

              
          ],
          
        ),
      ],
      ),
  );
}
}