import 'package:ecommerce_app/providers/auth_provider.dart';
import 'package:ecommerce_app/widgets/default_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDatePicker extends StatelessWidget {
   CustomDatePicker({Key? key}) : super(key: key);

  final TextEditingController _dateController = TextEditingController();

  void _selectDate(BuildContext context) async{
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
    );

    if(picked != null) {
      _dateController.text =
      '${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}';
      context.read<AuthProvider>().setBirthDate(picked);
    }
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _selectDate(context);
      },
      child: DefaultTextField(
        hintText: 'DD/MM/YYYY',
        icon: Icon(Icons.calendar_today),
        enabled: false,
        onChanged: () {},
        tec: _dateController,
      )
    );
  }
}
