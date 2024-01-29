import 'package:flutter/material.dart';
import 'package:l10n_example/l10n/l10n.dart';
import 'package:l10n_example/l10n/locale_provider.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppBar(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
