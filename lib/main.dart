import 'package:flutter/material.dart';
import './transaction.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Chart!'),
              elevation: 5,
            ),
          ),
          Column(
            children: transactions.map((transaction) {
              return Card(
                  child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      transaction.amount.toString(),
                    ),
                  ),
                  Column(children: <Widget>[
                    Text(transaction.title),
                    Text(transaction.date.toString()),
                  ],)
                ],
              ));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
