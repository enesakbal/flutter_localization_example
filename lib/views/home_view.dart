import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:l10n_example/l10n/l10n.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              title: l10n.simpleTextTitle,
              content: Text(
                l10n.simpleTextContent,
              ),
            ),
            const Divider(height: 64, thickness: 1),
            CustomText(
              title: l10n.calendarDatePickerTitle,
              content: Row(
                children: [
                  TextButton(
                    onPressed: () async {
                      selectedDate.value = await showDatePicker(
                        context: context,
                        currentDate: DateTime.now(),
                        initialDate: selectedDate.value,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                        initialDatePickerMode: DatePickerMode.day,
                      );
                    },
                    child: Text(l10n.calendarDatePickerButton),
                  ),
                  const Spacer(),
                  ValueListenableBuilder<DateTime?>(
                    valueListenable: selectedDate,
                    builder: (context, value, child) {
                      return Text(
                        value != null
                            ? DateFormat('dd MMMM yyyy - EEEE').format(value)
                            : l10n.calendarDatePickerNoSelected,
                        style: const TextStyle(fontSize: 14),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Divider(height: 64, thickness: 1),
          ],
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.content,
    required this.title,
  });

  final String title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        content,
      ],
    );
  }
}
