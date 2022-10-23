import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:real_app/transaction.dart';

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
  MyHomePage({super.key});

  final List<Transaction> transactions = [
    Transaction(
        id: 'txn1', title: 'firestick', amount: 210, date: DateTime.now()),
    Transaction(
        id: 'txn2', title: 'Crackers', amount: 680, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            child: Container(
              child: Text('CHART!'),
              width: double.infinity,
              height: 20,
            ),
            color: Colors.lightBlue,
          ),
          Column(
            children: [
              Container(
                  //margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(labelText: 'Title'),
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Amount'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Add Transaction'),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.end,
                    ),
                  ))
            ],
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                  child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    )),
                    child: Text(
                      '₹ ${tx.amount}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tx.title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat.yMMMd().format(tx.date),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ));
            }).toList(),
          )
        ],
      ),
    );
  }
}
