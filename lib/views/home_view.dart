import 'package:flutter/material.dart';
import 'package:l10n_example/widgets/_custom_app_bar.dart';
import 'package:l10n_example/widgets/basic_placeholder_text_widget.dart';
import 'package:l10n_example/widgets/calendar_date_picker_widget.dart';
import 'package:l10n_example/widgets/numbers_and_currencies_widget.dart';
import 'package:l10n_example/widgets/plural_text_widget.dart';
import 'package:l10n_example/widgets/select_text_widget.dart';
import 'package:l10n_example/widgets/simple_text_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* Simple Text Widget Example
            SimpleTextWidget(),

            Divider(height: 64, thickness: 1),

            //* Calendar Date Picker Widget Example
            CalendarDatePickerWidget(),

            Divider(height: 64, thickness: 1),

            //* Basic Placeholder Text Widget Example
            BasicPlaceholderTextWidget(),

            Divider(height: 64, thickness: 1),

            //* Plural Text Widget Example
            TextWithPluralWidget(),

            Divider(height: 64, thickness: 1),

            //* Select Text Widget Example
            TextWithSelectWidget(),

            Divider(height: 64, thickness: 1),

            //* Select Text Widget Example
            NumberAndCurrenciesWidget(),

            SizedBox(height: 96)
          ],
        ),
      ),
    );
  }
}
