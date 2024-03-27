import 'package:flutter/cupertino.dart';

class CurrencyCovertorCupertinoPage extends StatefulWidget {
  const CurrencyCovertorCupertinoPage({super.key});

  @override
  State<CurrencyCovertorCupertinoPage> createState() =>
      _CurrencyCovertorCupertinoPageState();
}

class _CurrencyCovertorCupertinoPageState
    extends State<CurrencyCovertorCupertinoPage> {
  final TextEditingController textEditingController = TextEditingController();
  double result = 0;
  void convert() {
    result = double.parse(textEditingController.text) * 81;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color.fromRGBO(122, 167, 152, 1),
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Color.fromRGBO(122, 167, 152, 1),
        automaticallyImplyMiddle: true,
        middle: Text(
          'currecny convertor',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 30,
          ),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'INR ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoTextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(252, 252, 252, 1),
                  borderRadius: BorderRadius.circular(3),
                ),
                placeholder: 'Please enter currency in USD',
                prefix: const Icon(CupertinoIcons.money_dollar),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CupertinoButton(
                onPressed: convert,
                color: CupertinoColors.black,
                child: const Text("CONVERT"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
