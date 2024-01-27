# Flutter Localization 
In this project, I tried to explain in detail how to do Localizations in Flutter.



## Folder Structure
```
src
├── l10n
│   ├── arb
│   │   ├── app_de.arb
│   │   ├── app_en.arb
│   │   └── app_tr.arb
│   │ 
│   ├── l10n.dart
│   └── locale_provider.dart
│ 
├── views
│   └── home_view.dart
│ 
├── widgets
│   ├── _custom_text_widget.dart
│   ├── basic_placeholder_text_widget.dart
│   ├── calendar_date_picker_widget.dart
│   ├── numbers_and_currencies_widget.dart
│   ├── plural_text_widget.dart
│   ├── select_text_widget.dart
│   └── simple_text_widget.dart
│ 
└── main.dart
```


## Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations: # for localization
    sdk: flutter
  intl: ^0.18.0 # for localization
  provider: ^6.1.1 # for change locale

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0

flutter:
  uses-material-design: true
  generate: true # for generating l10n files
```

## l10n.yaml

``` yaml
#* This YAML file contains configuration settings for localization in the application.

#* - `arb-dir`: Specifies the directory where the ARB (Application Resource Bundle) files are located.
#* - `template-arb-file`: Specifies the name of the template ARB file.
#* - `output-localization-file`: Specifies the name of the output file that will contain the generated localizations.
#* - `nullable-getter`: Specifies whether the generated getter methods should be nullable or not.
#* - `untranslated-messages-file`: Specifies the name of the file that will contain the untranslated messages.

arb-dir: lib/l10n/arb
template-arb-file: app_de.arb
output-localization-file: app_localizations.dart
nullable-getter: false
untranslated-messages-file: untranslated_messages.json
```
---


## Simple Text
<img src="assets/simple_text.gif">

### Configuration

``` arb
"simpleTextTitle": "Simple Text",
"simpleTextContent": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
```

### Usage
```dart
class SimpleTextWidget extends StatelessWidget {
  const SimpleTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CustomText(
      title: l10n.simpleTextTitle,
      content: Text(l10n.simpleTextContent),
    );
  }
}
```

---

## Calendar Date Picker
<img src="assets/calendar_date_picker.gif">


### Configuration

``` arb
"calendarDatePickerTitle": "Calendar Date Picker",
"calendarDatePickerButton": "Pick Date",
"calendarDatePickerNoSelected": "No date selected",
```

### Usage
```dart
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
            builder: (_, selectedDate, __) {
              return Builder(
                builder: (context) {
                  if (selectedDate != null) {
                    final locale = Localizations.localeOf(context);

                    return Text(
                      DateFormat.yMMMEd(locale.languageCode).format(selectedDate),
                      style: const TextStyle(fontSize: 14),
                    );
                  }

                  return Text(
                    l10n.calendarDatePickerNoSelected,
                    style: const TextStyle(fontSize: 14),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

```
---
## Basic Placeholder Text
<img src="assets/basic_placeholder_text.gif">

### Configuration

``` arb
"basicPlaceholderTitle": "Basic Placeholder Text",
    "basicPlaceholderContent": "Hello, my name is {name}. I am {age} years old with {experience} years of experience with Flutter. Born on {birthDate} in {birthPlace}",
    "@basicPlaceholderContent": {
        "description": "A message with name, age, experience, birthDate and birthPlace parameters",
        "placeholders": {
            "name": {
                "type": "String",
                "example": "Enes"
            },
            "age": {
                "type": "int",
                "example": "23"
            },
            "experience": {
                "type": "double",
                "example": "2.5"
            },
            "birthDate": {
                "type": "DateTime",
                "format": "yMMMEd"
            },
            "birthPlace": {
                "type": "String",
                "example": "Istanbul, Türkiye"
            }
        }
    }
```

### Usage
```dart
class BasicPlaceholderTextWidget extends StatelessWidget {
  const BasicPlaceholderTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    //* Text with parameters
    return CustomText(
      title: l10n.basicPlaceholderTitle,
      content: Text(
        l10n.basicPlaceholderContent(
          'Enes',
          22,
          2.5,
          DateTime(2001, 07, 29),
          'Istanbul, Türkiye',
        ),
      ),
    );
  }
}

```

---