import 'package:currency_converter/model_class.dart';
import 'package:flutter/material.dart';

class DropDownBtnInput extends StatefulWidget {
  final ValueChanged<String?>? onChanged;
  final CurrencyRates currencyList;
  final String selectedCurrency;

  const DropDownBtnInput({
    Key? key,
    this.onChanged,
    required this.currencyList,
    required this.selectedCurrency,
  }) : super(key: key);

  @override
  State<DropDownBtnInput> createState() => _DropDownBtnInputState();
}

class _DropDownBtnInputState extends State<DropDownBtnInput> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        value: widget.selectedCurrency,
        items: widget.currencyList.getCurrencyCodes().map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: const TextStyle(color: Colors.black)),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            // Update the state with the new selected currency
          });
          widget.onChanged?.call(newValue);
        },
      ),
    );
  }
}
