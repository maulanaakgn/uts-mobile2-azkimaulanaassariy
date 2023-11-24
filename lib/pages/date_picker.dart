import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final DateFormat _dateFormat = DateFormat('dd-MM-yyyy');
  DateTime _selectedDate = DateTime.now();

  _showDate(context) async {
    final datePick = await showDatePicker(
      context: context, 
      initialDate: _selectedDate, 
      firstDate: _selectedDate.subtract(Duration(days: 30)), 
      lastDate: DateTime(_selectedDate.year + 1),
    );

    if (datePick != null) {
      setState(() {
        _selectedDate = datePick;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Selected Date: ${_dateFormat.format(_selectedDate)}'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _showDate(context),
            child: const Text('Pick Date')
            ),
        ],
      ),
    );
  }
}