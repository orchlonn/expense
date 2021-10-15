import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text('Одоогоор зарлагын мэдээлэл байхгүй',
                    style: Theme.of(context).textTheme.headline1),
                SizedBox(height: 20),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: FittedBox(
                          child: Text("\$${transactions[index].amount}"),
                        ),
                      ),
                    ),
                    title: Text(
                      '${transactions[index].title}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                        '${DateFormat.yMMMMd().format(transactions[index].date)}'),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
