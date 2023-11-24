import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {final DateFormat _dateFormat = DateFormat('dd-MM-yyyy');
  TimeOfDay _selectedTime = TimeOfDay.now();

_showTime(context) async {
  final timePick = await showTimePicker(
    context: context,
    initialTime: _selectedTime,
    builder: (BuildContext context, Widget? child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child!,
      );
    },
  );

  if (timePick != null) {
      setState(() {
        _selectedTime = timePick;
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
          Text('Selected Time: ${_selectedTime.format(context)}'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _showTime(context),
            child: const Text('Pick Time')
            ),
        ],
      ),
    );
  }
}