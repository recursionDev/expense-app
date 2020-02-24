import 'package:flutter/material.dart';
import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction(id: 't1', title: 'Dog food', amount: 14.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Pen', amount: 0.99, date: DateTime.now()),
    // Transaction(id: 't3', title: 'Milk', amount: 1.99, date: DateTime.now()),
    // Transaction(id: 't4', title: 'Phone', amount: 999.99, date: DateTime.now())
  ];

  void _addNewTransactions(String title, double amount)
  {
    final newTransaction = Transaction(title: title, amount: amount, date: DateTime.now(), id: DateTime.now().toString());
    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransactions),
        TransactionList(_transactions),
      ],
    );
  }
}
