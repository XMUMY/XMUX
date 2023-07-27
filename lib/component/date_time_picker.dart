import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePicker extends StatelessWidget {
  /// Text used for label of picker.
  final String? labelText;

  final DateTime date;
  final TimeOfDay time;
  final DateTime firstDate;
  final DateTime lastDate;

  /// Callback on date selected.
  final ValueChanged<DateTime>? onDateChanged;

  /// Callback on time selected.
  final ValueChanged<TimeOfDay>? onTimeChanged;

  DateTimePicker({
    Key? key,
    this.labelText,
    required this.date,
    required this.firstDate,
    required this.lastDate,
    this.onDateChanged,
    this.onTimeChanged,
  })  : time = TimeOfDay.fromDateTime(date),
        super(key: key);

  Future<void> _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (picked != null && picked != date) onDateChanged?.call(picked);
  }

  Future<void> _pickTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (picked != null && picked != time) onTimeChanged?.call(picked);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: InkWell(
            onTap: () => _pickDate(context),
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: labelText,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    DateFormat.yMMMd().format(date),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.grey.shade700
                        : Colors.white70,
                  ),
                ],
              ),
            ),
          ),
        ),
        const VerticalDivider(width: 12.0, color: Colors.transparent),
        Expanded(
          flex: 3,
          child: InkWell(
            onTap: () => _pickTime(context),
            child: InputDecorator(
              decoration: const InputDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    time.format(context),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.grey.shade700
                        : Colors.white70,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
