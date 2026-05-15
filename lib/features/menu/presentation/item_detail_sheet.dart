import 'package:flutter/material.dart';

import '../../cart/presentation/widgets/customization_sheet.dart';
import '../domain/menu_item.dart';

/// Opens the add-to-cart flow for [item].
Future<void> showItemDetailSheet(BuildContext context, MenuItem item) {
  return showAddToCartSheet(context, item);
}
