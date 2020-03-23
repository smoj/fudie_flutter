import 'package:flutter/material.dart';

class UIQuote extends StatelessWidget {
  final String quote;
  final String author;

  UIQuote(this.quote, this.author);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1
              )
          )
      ),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.15, 2, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(this.quote, textAlign: TextAlign.left, style: Theme.of(context).textTheme.body1.copyWith(
                  fontSize: MediaQuery.of(context).size.width * 0.07,
                  height: 1.2,
                ),),
                SizedBox(
                  height: 10,
                ),
                Text(this.author, textAlign: TextAlign.left, style: Theme.of(context).textTheme.body2.copyWith(
                    fontSize: MediaQuery.of(context).size.width * 0.05
                ),),
              ],
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.025,
            child: Icon(Icons.format_quote, color: Colors.yellow.shade800, size: 35,)
          ),
        ],
      ),
    );
  }
}
