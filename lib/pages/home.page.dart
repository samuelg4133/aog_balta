import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:totalflexbalta/widgets/logo.widget.dart';
import 'package:totalflexbalta/widgets/success.widget.dart';
import 'package:totalflexbalta/widgets/submit-form.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.deepPurple;
  var _busy = false;
  var _completed = false;
  var _resultText = "Abasteça com Álcool";
  var _gasCtrl = new MoneyMaskedTextController(precision: 3);
  var _alcCtrl = new MoneyMaskedTextController(precision: 3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 1200,
        ),
        color: _color,
        child: ListView(
          children: <Widget>[
            Logo(),
            _completed
                ? Success(
                    result: _resultText,
                    reset: reset,
                  )
                : SubmitForm(
                    alcCtrl: _alcCtrl,
                    gasCtrl: _gasCtrl,
                    busy: _busy,
                    submitFunc: calculate,
                  ),
          ],
        ),
      ),
    );
  }

  Future calculate() {
    double alc =
        double.parse(_alcCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;

    double gas =
        double.parse(_gasCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;

    double res = alc / gas;

    setState(() {
      _color = Colors.deepPurpleAccent;
      _completed = false;
      _busy = true;
    });

    return new Future.delayed(
        const Duration(seconds: 1),
        () => {
              setState(() {
                if (res >= 0.74) {
                  _resultText = "Abasteça com Gasolina";
                } else {
                  _resultText = "Abasteça com Etanol";
                }
                _busy = false;
                _completed = true;
              })
            });
  }

  reset() {
    setState(() {
      _color = Colors.deepPurple;
      _alcCtrl = new MoneyMaskedTextController(
        precision: 3,
      );
      _gasCtrl = new MoneyMaskedTextController(precision: 3);
      _completed = false;
      _busy = false;
    });
  }
}
