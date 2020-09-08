import 'package:flutter/widgets.dart';

class PaymentRecord {
  final DateTime date;
  final String item;
  final double amount;
  final double paid;

  PaymentRecord({
    @required this.date,
    @required this.item,
    @required this.amount,
    @required this.paid,
  });
}
