import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemsWidget extends StatelessWidget {
  final String title;
  final String desc;
  final String categori;
  final DateTime dateFinish;
  final int number;

  ItemsWidget({
    Key? key,
    required this.title,
    required this.desc,
    required this.categori,
    required this.dateFinish,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    desc,
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(7)),
                child: Text(
                  categori,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Text(DateFormat.yMEd().format(DateTime.now())),
              Text(DateFormat.yMEd().format(dateFinish)),
            ],
          ),
        ],
      ),
    );
  }
}
