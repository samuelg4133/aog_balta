import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  var label = "";
  var ctrl = new MoneyMaskedTextController();

  Input({@required this.label, @required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          alignment: Alignment.centerRight,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontFamily: "Big Shoulders Display",
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Padding(
          padding: EdgeInsets.only(
            right: 5,
          ),
          child: Text(
            "R\$",
            style: TextStyle(
              color: Colors.white,
              fontSize: 45,
              fontFamily: "Big Shoulders Display",
            ),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: ctrl,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.white,
              fontSize: 45,
              fontFamily: "Big Shoulders Display",
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
