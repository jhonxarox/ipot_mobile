import 'package:freezed_annotation/freezed_annotation.dart';

import '../../menu/domain/customization_option.dart';

part 'selected_option.freezed.dart';

@freezed
abstract class SelectedOption with _$SelectedOption {
  const factory SelectedOption({
    required int groupId,
    required CustomizationOption option,
    required int quantity,
  }) = _SelectedOption;
}
