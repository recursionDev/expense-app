import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingProcentageOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingProcentageOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, contstraints) {
        return Column(
          children: <Widget>[
            Container(
              height: contstraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
              ),
            ),
            SizedBox(
              height: contstraints.maxHeight * 0.05,
            ),
            Container(
              height: contstraints.maxHeight * 0.6,
              width: 10,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 200, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingProcentageOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: contstraints.maxHeight * 0.05,
            ),
            Container(
                height: contstraints.maxHeight * 0.15,
                child: FittedBox(child: Text(label))),
          ],
        );
      },
    );
  }
}
