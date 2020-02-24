import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
