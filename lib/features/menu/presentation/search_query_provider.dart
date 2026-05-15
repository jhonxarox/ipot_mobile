import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Search text driving menu item filtering on [MenuScreen].
class SearchQueryNotifier extends Notifier<String> {
  @override
  String build() => '';

  void setQuery(String value) => state = value;

  void clear() => state = '';
}

final searchQueryProvider =
    NotifierProvider<SearchQueryNotifier, String>(SearchQueryNotifier.new);
