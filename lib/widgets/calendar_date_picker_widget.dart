import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:l10n_example/l10n/l10n.dart';
import 'package:l10n_example/widgets/_custom_text_widget.dart';

class CalendarDatePickerWidget extends StatefulWidget {
  const CalendarDatePickerWidget({super.key});

  @override
  State<CalendarDatePickerWidget> createState() => _CalendarDatePickerWidgetState();
}

class _CalendarDatePickerWidgetState extends State<CalendarDatePickerWidget> {
  //* A value notifier to listen to the selected date
  late final ValueNotifier<DateTime?> selectedDate;

  @override
  void initState() {
    selectedDate = ValueNotifier<DateTime?>(null);
    super.initState();
  }

  @override
  void dispose() {
    selectedDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CustomText(
      title: l10n.calendarDatePickerTitle,
      content: Row(
        children: [
          //* CalendarDatePicker
          TextButton(
            onPressed: () async {
              selectedDate.value = await showDatePicker(
                    context: context,
                    currentDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    initialDatePickerMode: DatePickerMode.day,
                  ) ??
                  DateTime.now();
            },
            child: Text(l10n.calendarDatePickerButton),
          ),
          const Spacer(),

          //* Selected Date
          ValueListenableBuilder<DateTime?>(
            valueListenable: selectedDate,
            builder: (context, value, child) {
              return Text(
                value != null ? DateFormat('dd MMMM yyyy - EEEE').format(value) : l10n.calendarDatePickerNoSelected,
                style: const TextStyle(fontSize: 14),
              );
            },
          ),
        ],
      ),
    );
  }
}
