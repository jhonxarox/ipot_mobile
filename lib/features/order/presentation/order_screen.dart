import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/network/api_exception.dart';
import '../../../core/widgets/app_error_view.dart';
import '../../../core/widgets/app_loader.dart';
import '../data/order_repository_provider.dart';
import '../domain/order.dart';
import '../domain/order_status.dart';
import 'status_timeline.dart';

/// Order confirmation and live status tracking (polls every 3s).
class OrderScreen extends ConsumerStatefulWidget {
  const OrderScreen({super.key, required this.orderId});

  final String orderId;

  @override
  ConsumerState<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends ConsumerState<OrderScreen> {
  Order? _order;
  String? _refreshError;
  Timer? _pollTimer;
  bool _initialLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchStatus();
    _pollTimer = Timer.periodic(
      const Duration(seconds: 3),
      (_) => _fetchStatus(),
    );
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    super.dispose();
  }

  Future<void> _fetchStatus() async {
    try {
      final order =
          await ref.read(orderRepositoryProvider).getOrder(widget.orderId);
      if (!mounted) return;

      setState(() {
        _order = order;
        _refreshError = null;
        _initialLoading = false;
      });

      if (order.status == OrderStatus.served) {
        _pollTimer?.cancel();
      }
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _refreshError = _errorMessage(error);
        _initialLoading = false;
      });
    }
  }

  String _errorMessage(Object error) => switch (error) {
        ApiException(:final message) => message,
        _ => 'Could not refresh order status',
      };

  @override
  Widget build(BuildContext context) {
    if (_initialLoading && _order == null) {
      return const Scaffold(
        body: AppLoader(message: 'Loading order…'),
      );
    }

    if (_order == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Order')),
        body: AppErrorView(
          error: _refreshError ?? 'Order not found',
          onRetry: () {
            setState(() => _initialLoading = true);
            _fetchStatus();
          },
        ),
      );
    }

    final order = _order!;

    return Scaffold(
      appBar: AppBar(title: const Text('Order status')),
      body: RefreshIndicator(
        onRefresh: _fetchStatus,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const _ConfirmationIcon(),
            const SizedBox(height: 16),
            Text(
              'Order placed',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Order ID: ${order.id}',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            if (order.estimatedPreparationMinutes != null) ...[
              const SizedBox(height: 8),
              Text(
                'Estimated prep: ~${order.estimatedPreparationMinutes} min',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
            if (_refreshError != null) ...[
              const SizedBox(height: 16),
              MaterialBanner(
                content: Text(_refreshError!),
                actions: [
                  TextButton(onPressed: _fetchStatus, child: const Text('Retry')),
                ],
              ),
            ],
            const SizedBox(height: 32),
            Text('Status', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            StatusTimeline(current: order.status),
            if (order.status == OrderStatus.served) ...[
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () => context.go('/scan'),
                child: const Text('Done — scan another table'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// One-shot scale-and-fade on the confirmation check icon.
///
/// Lives in its own widget so the parent's polling-driven rebuilds
/// don't retrigger the animation.
class _ConfirmationIcon extends StatefulWidget {
  const _ConfirmationIcon();

  @override
  State<_ConfirmationIcon> createState() => _ConfirmationIconState();
}

class _ConfirmationIconState extends State<_ConfirmationIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 420),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scale = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );
    return FadeTransition(
      opacity: _controller,
      child: ScaleTransition(
        scale: scale,
        child: Icon(
          Icons.check_circle_outline,
          size: 56,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
