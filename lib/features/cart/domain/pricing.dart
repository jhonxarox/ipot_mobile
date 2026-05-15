import '../../menu/domain/menu_item.dart';
import 'cart.dart';
import 'cart_line.dart';
import 'selected_option.dart';

/// Price for one customization option line (modifier × qty).
double optionPrice(SelectedOption selection) =>
    selection.option.priceModifier * selection.quantity;

/// Base item price plus all selected modifiers (per unit, before line qty).
double lineUnitPrice(MenuItem item, List<SelectedOption> selections) =>
    item.price +
    selections.fold<double>(0, (sum, selection) => sum + optionPrice(selection));

/// Total for one cart line (unit price × quantity).
double lineTotal(CartLine line) =>
    lineUnitPrice(line.item, line.selections) * line.quantity;

/// Sum of all line totals in the cart.
double cartSubtotal(Cart cart) =>
    cart.lines.fold<double>(0, (sum, line) => sum + lineTotal(line));
