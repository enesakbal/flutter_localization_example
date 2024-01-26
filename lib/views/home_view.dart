import 'package:flutter/material.dart';
import 'package:l10n_example/l10n/l10n.dart';
import 'package:l10n_example/l10n/locale_provider.dart';
import 'package:l10n_example/widgets/basic_placeholder_text_widget.dart';
import 'package:l10n_example/widgets/calendar_date_picker_widget.dart';
import 'package:l10n_example/widgets/numbers_and_currencies_widget.dart';
import 'package:l10n_example/widgets/plural_text_widget.dart';
import 'package:l10n_example/widgets/select_text_widget.dart';
import 'package:l10n_example/widgets/simple_text_widget.dart';
import 'package:provider/provider.dart';

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
            onPressed: () {
              final locale = Localizations.localeOf(context);
              final provider = Provider.of<LocaleProvider>(context, listen: false);

              //* switch between locales
              switch (locale.languageCode) {
                case 'en':
                  provider.setLocale(const Locale('tr'));
                  break;
                case 'tr':
                  provider.setLocale(const Locale('de'));
                  break;
                case 'de':
                  provider.setLocale(const Locale('en'));
                  break;
                default:
                  provider.setLocale(const Locale('en'));
                  break;
              }
            },
          ),
        ],
      ),
      body: const SingleChildScrollView(
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
