import 'package:flutter/material.dart';

import '../network/api_exception.dart';

/// Full-screen error state with an optional retry action.
class AppErrorView extends StatelessWidget {
  const AppErrorView({
    super.key,
    required this.error,
    this.onRetry,
  });

  final Object error;
  final VoidCallback? onRetry;

  String get _message => switch (error) {
        ApiNetworkException() =>
          'Cannot reach the server. Check your connection and try again.',
        ApiTimeoutException() => 'The request timed out. Please try again.',
        ApiHttpException(:final serverMessage, :final statusCode) =>
          serverMessage ?? 'Request failed (HTTP $statusCode).',
        ApiParseException(:final message) => message,
        ApiException(:final message) => message,
        _ => 'Something went wrong. Please try again.',
      };

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              _message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              FilledButton(
                onPressed: onRetry,
                child: const Text('Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
