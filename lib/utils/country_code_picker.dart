import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

void pickerCountyCode({
  required BuildContext context,
  required void Function(Country) onSelect,
}) =>
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: onSelect,
    );

class PickCountyCode {
  final String phoneCode;
  final String flagEmoji;

  PickCountyCode(this.phoneCode, this.flagEmoji);
}
