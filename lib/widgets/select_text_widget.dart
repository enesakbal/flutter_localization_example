import 'package:flutter/material.dart';
import 'package:l10n_example/l10n/l10n.dart';
import 'package:l10n_example/widgets/_custom_text_widget.dart';

class TextWithSelectWidget extends StatelessWidget {
  const TextWithSelectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    //* Text with Select
    return CustomText(
      title: l10n.pronounTitle,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(l10n.pronounContent('male')), //* Returns 'he'
          Text(l10n.pronounContent('female')), //* Returns 'she'
          Text(l10n.pronounContent('other')), //* Returns 'they'
          Text(l10n.pronounContent('wrong key')), //* Returns 'they'
        ],
      ),
    );
  }
}