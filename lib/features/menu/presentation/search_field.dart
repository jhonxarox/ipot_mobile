import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'search_query_provider.dart';

/// Menu search bar wired to [searchQueryProvider].
class MenuSearchField extends ConsumerWidget {
  const MenuSearchField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(searchQueryProvider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search menu…',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: query.isEmpty
              ? null
              : IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () =>
                      ref.read(searchQueryProvider.notifier).clear(),
                ),
          border: const OutlineInputBorder(),
          isDense: true,
        ),
        onChanged: ref.read(searchQueryProvider.notifier).setQuery,
      ),
    );
  }
}
