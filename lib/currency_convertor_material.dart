// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class CurrencyConvertorMaterialPagee extends StatefulWidget {
  const CurrencyConvertorMaterialPagee({super.key});

  @override
  State<CurrencyConvertorMaterialPagee> createState() {
    return _CurrecnyConvertorMaterialPagee();
  }
}

class _CurrecnyConvertorMaterialPagee
    extends State<CurrencyConvertorMaterialPagee> {
  final TextEditingController textEditingController = TextEditingController();
  double result = 0;
  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(90),
      ),
    );
    return Scaffold(
      backgroundColor: const Color.fromRGBO(122, 167, 152, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(122, 167, 152, 1),
        elevation: 0,
        title: const Text(
          'currecny convertor',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result.toString(),
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  hintText: 'Please enter currency in rupees',
                  hintStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    result = double.parse(textEditingController.text) * 81;
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("CONVERT"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
