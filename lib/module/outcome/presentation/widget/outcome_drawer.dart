import 'package:bud_get/common/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OutcomeDrawer extends ConsumerWidget {
  const OutcomeDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      bottom: false,
      child: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
              ),
              accountName: Text(
                'Name Placeholder',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              accountEmail: Text(
                'Email Placeholder',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(''),
              ),
              otherAccountsPictures: [
                InkWell(
                  onTap: () async {},
                  child: CircleAvatar(
                    child: Icon(
                      Icons.logout,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    ref.read(appThemeProvider.notifier).toggleTheme();
                  },
                  child: CircleAvatar(
                    child: Icon(
                      Theme.of(context).brightness == Brightness.dark
                          ? Icons.light_mode
                          : Icons.dark_mode,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
