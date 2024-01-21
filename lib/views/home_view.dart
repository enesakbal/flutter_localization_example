import 'package:flutter/material.dart';
import 'package:l10n_example/l10n/l10n.dart';
import 'package:l10n_example/widgets/calendar_date_picker_widget.dart';
import 'package:l10n_example/widgets/simple_text_widget.dart';
import 'package:l10n_example/widgets/text_with_parameters_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.homeAppBarTitle,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
        ),
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.language, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, '/language'),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* Simple Text Widget Example
            SimpleTextWidget(),

            Divider(height: 64, thickness: 1),

            //* Calendar Date Picker Widget Example
            CalendarDatePickerWidget(),

            Divider(height: 64, thickness: 1),

            TextWithParametersWidget(),

            Divider(height: 64, thickness: 1),

            // Text(l10n.yourSelectedDate(selectedDate.value)),
            // Text(l10n.numberOfDataPoints(12)),
          ],
        ),
      ),
    );
  }
}
