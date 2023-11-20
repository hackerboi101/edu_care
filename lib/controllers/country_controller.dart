import 'package:get/get.dart';

class Country {
  final String name;
  final String code;

  Country(this.code, this.name);
}

class CountryController extends GetxController {
  Rx<Country?> selectedCountry = Rx<Country?>(null);

  void selectCountry(Country country) {
    selectedCountry.value = country;
  }
}
