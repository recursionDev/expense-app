import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'Dog food', amount: 14.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Pen', amount: 0.99, date: DateTime.now()),
    Transaction(id: 't3', title: 'Milk', amount: 1.99, date: DateTime.now()),
    Transaction(id: 't4', title: 'Phone', amount: 999.99, date: DateTime.now())
  ];
  // String inputTitle;
  // String inputAmount;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense app'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Chart!'),
              elevation: 5,
            ),
          ),
          Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: titleController,
                      // onChanged: (value) {
                      //   inputTitle = value;
                      // },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: amountController,
                      // onChanged: (value) {
                      //   inputAmount = value;
                      // }
                    ),
                    FlatButton(
                      child: Text('Add transaction'),
                      textColor: Colors.red,
                      onPressed: () {},
                    ),
                  ],
                ),
              )),
          Column(
            children: transactions.map((transaction) {
              return Card(
                  child: Row(
                children: <Widget>[
                  Container(
                    width: 120,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 2)),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '\$${transaction.amount}',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          transaction.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          DateFormat.yMMMd().format(transaction.date),
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
