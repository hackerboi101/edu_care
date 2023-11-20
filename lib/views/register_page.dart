import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:edu_care/controllers/country_controller.dart';
import 'package:edu_care/controllers/register_controller.dart';
import 'package:edu_care/views/login_page.dart';

class RegisterPage extends StatelessWidget {
  final RegisterController registerController = Get.put(RegisterController());
  final CountryController countryController = Get.put(CountryController());
  final RxBool passwordIsSeen = false.obs;
  final List<Country> countryList = [
    Country('+93', 'Afghanistan'),
    Country('+355', 'Albania'),
    Country('+213', 'Algeria'),
    Country('+376', 'Andorra'),
    Country('+244', 'Angola'),
    Country('+1', 'Antigua and Barbuda'),
    Country('+54', 'Argentina'),
    Country('+374', 'Armenia'),
    Country('+61', 'Australia'),
    Country('+43', 'Austria'),
    Country('+994', 'Azerbaijan'),
    Country('+1', 'Bahamas'),
    Country('+973', 'Bahrain'),
    Country('+880', 'Bangladesh'),
    Country('+1', 'Barbados'),
    Country('+375', 'Belarus'),
    Country('+32', 'Belgium'),
    Country('+501', 'Belize'),
    Country('+229', 'Benin'),
    Country('+975', 'Bhutan'),
    Country('+591', 'Bolivia'),
    Country('+387', 'Bosnia and Herzegovina'),
    Country('+267', 'Botswana'),
    Country('+55', 'Brazil'),
    Country('+673', 'Brunei'),
    Country('+359', 'Bulgaria'),
    Country('+226', 'Burkina Faso'),
    Country('+257', 'Burundi'),
    Country('+855', 'Cambodia'),
    Country('+237', 'Cameroon'),
    Country('+1', 'Canada'),
    Country('+238', 'Cape Verde'),
    Country('+236', 'Central African Republic'),
    Country('+235', 'Chad'),
    Country('+56', 'Chile'),
    Country('+86', 'China'),
    Country('+57', 'Colombia'),
    Country('+269', 'Comoros'),
    Country('+242', 'Congo'),
    Country('+506', 'Costa Rica'),
    Country('+385', 'Croatia'),
    Country('+53', 'Cuba'),
    Country('+357', 'Cyprus'),
    Country('+420', 'Czech Republic'),
    Country('+45', 'Denmark'),
    Country('+253', 'Djibouti'),
    Country('+1', 'Dominica'),
    Country('+1', 'Dominican Republic'),
    Country('+670', 'East Timor'),
    Country('+593', 'Ecuador'),
    Country('+20', 'Egypt'),
    Country('+503', 'El Salvador'),
    Country('+240', 'Equatorial Guinea'),
    Country('+291', 'Eritrea'),
    Country('+372', 'Estonia'),
    Country('+251', 'Ethiopia'),
    Country('+679', 'Fiji'),
    Country('+358', 'Finland'),
    Country('+33', 'France'),
    Country('+241', 'Gabon'),
    Country('+220', 'Gambia'),
    Country('+995', 'Georgia'),
    Country('+49', 'Germany'),
    Country('+233', 'Ghana'),
    Country('+30', 'Greece'),
    Country('+1', 'Grenada'),
    Country('+502', 'Guatemala'),
    Country('+224', 'Guinea'),
    Country('+245', 'Guinea-Bissau'),
    Country('+592', 'Guyana'),
    Country('+509', 'Haiti'),
    Country('+504', 'Honduras'),
    Country('+36', 'Hungary'),
    Country('+354', 'Iceland'),
    Country('+91', 'India'),
    Country('+62', 'Indonesia'),
    Country('+98', 'Iran'),
    Country('+964', 'Iraq'),
    Country('+353', 'Ireland'),
    Country('+972', 'Israel'),
    Country('+39', 'Italy'),
    Country('+1', 'Jamaica'),
    Country('+81', 'Japan'),
    Country('+962', 'Jordan'),
    Country('+7', 'Kazakhstan'),
    Country('+254', 'Kenya'),
    Country('+686', 'Kiribati'),
    Country('+850', 'North Korea'),
    Country('+82', 'South Korea'),
    Country('+965', 'Kuwait'),
    Country('+996', 'Kyrgyzstan'),
    Country('+856', 'Laos'),
    Country('+371', 'Latvia'),
    Country('+961', 'Lebanon'),
    Country('+266', 'Lesotho'),
    Country('+231', 'Liberia'),
    Country('+218', 'Libya'),
    Country('+423', 'Liechtenstein'),
    Country('+370', 'Lithuania'),
    Country('+352', 'Luxembourg'),
    Country('+389', 'Macedonia'),
    Country('+261', 'Madagascar'),
    Country('+265', 'Malawi'),
    Country('+60', 'Malaysia'),
    Country('+960', 'Maldives'),
    Country('+223', 'Mali'),
    Country('+356', 'Malta'),
    Country('+692', 'Marshall Islands'),
    Country('+222', 'Mauritania'),
    Country('+230', 'Mauritius'),
    Country('+52', 'Mexico'),
    Country('+691', 'Micronesia'),
    Country('+373', 'Moldova'),
    Country('+377', 'Monaco'),
    Country('+976', 'Mongolia'),
    Country('+382', 'Montenegro'),
    Country('+212', 'Morocco'),
    Country('+258', 'Mozambique'),
    Country('+95', 'Myanmar'),
    Country('+264', 'Namibia'),
    Country('+674', 'Nauru'),
    Country('+977', 'Nepal'),
    Country('+31', 'Netherlands'),
    Country('+64', 'New Zealand'),
    Country('+505', 'Nicaragua'),
    Country('+227', 'Niger'),
    Country('+234', 'Nigeria'),
    Country('+47', 'Norway'),
    Country('+968', 'Oman'),
    Country('+92', 'Pakistan'),
    Country('+680', 'Palau'),
    Country('+507', 'Panama'),
    Country('+675', 'Papua New Guinea'),
    Country('+595', 'Paraguay'),
    Country('+51', 'Peru'),
    Country('+63', 'Philippines'),
    Country('+48', 'Poland'),
    Country('+351', 'Portugal'),
    Country('+974', 'Qatar'),
    Country('+40', 'Romania'),
    Country('+7', 'Russia'),
    Country('+250', 'Rwanda'),
    Country('+1', 'Saint Kitts and Nevis'),
    Country('+1', 'Saint Lucia'),
    Country('+1', 'Saint Vincent and the Grenadines'),
    Country('+685', 'Samoa'),
    Country('+378', 'San Marino'),
    Country('+239', 'Sao Tome and Principe'),
    Country('+966', 'Saudi Arabia'),
    Country('+221', 'Senegal'),
    Country('+381', 'Serbia'),
    Country('+248', 'Seychelles'),
    Country('+232', 'Sierra Leone'),
    Country('+65', 'Singapore'),
    Country('+421', 'Slovakia'),
    Country('+386', 'Slovenia'),
    Country('+677', 'Solomon Islands'),
    Country('+252', 'Somalia'),
    Country('+27', 'South Africa'),
    Country('+211', 'South Sudan'),
    Country('+34', 'Spain'),
    Country('+94', 'Sri Lanka'),
    Country('+249', 'Sudan'),
    Country('+597', 'Suriname'),
    Country('+268', 'Swaziland'),
    Country('+46', 'Sweden'),
    Country('+41', 'Switzerland'),
    Country('+963', 'Syria'),
    Country('+886', 'Taiwan'),
    Country('+992', 'Tajikistan'),
    Country('+255', 'Tanzania'),
    Country('+66', 'Thailand'),
    Country('+228', 'Togo'),
    Country('+676', 'Tonga'),
    Country('+1', 'Trinidad and Tobago'),
    Country('+216', 'Tunisia'),
    Country('+90', 'Turkey'),
    Country('+993', 'Turkmenistan'),
    Country('+688', 'Tuvalu'),
    Country('+256', 'Uganda'),
    Country('+380', 'Ukraine'),
    Country('+971', 'United Arab Emirates'),
    Country('+44', 'United Kingdom'),
    Country('+1', 'United States'),
    Country('+598', 'Uruguay'),
    Country('+998', 'Uzbekistan'),
    Country('+678', 'Vanuatu'),
    Country('+379', 'Vatican City'),
    Country('+58', 'Venezuela'),
    Country('+84', 'Vietnam'),
    Country('+967', 'Yemen'),
    Country('+260', 'Zambia'),
    Country('+263', 'Zimbabwe'),
  ];

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(27, 35, 48, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(107, 30, 101, 1),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: registerController.userNameController,
                decoration: const InputDecoration(
                  hintText: 'User Name',
                  filled: true,
                  fillColor: Color.fromRGBO(201, 201, 201, 1),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 12.0,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: registerController.nameController,
                decoration: const InputDecoration(
                  hintText: 'Full Name',
                  filled: true,
                  fillColor: Color.fromRGBO(201, 201, 201, 1),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 12.0,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: registerController.emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Color.fromRGBO(201, 201, 201, 1),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 12.0,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Obx(
                () => TextField(
                  controller: registerController.passwordController,
                  obscureText: !passwordIsSeen.value,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: const Color.fromRGBO(201, 201, 201, 1),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 12.0,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordIsSeen.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () => passwordIsSeen.toggle(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Obx(
                () => TextField(
                  controller: registerController.confirmPasswordController,
                  obscureText: !passwordIsSeen.value,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    filled: true,
                    fillColor: const Color.fromRGBO(201, 201, 201, 1),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 12.0,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordIsSeen.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () => passwordIsSeen.toggle(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Obx(
                      () => DropdownButtonFormField<Country>(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(201, 201, 201, 1),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 12.0,
                          ),
                        ),
                        value: countryController.selectedCountry.value ??
                            countryList[0],
                        items: countryList
                            .map((country) => DropdownMenuItem<Country>(
                                  value: country,
                                  child:
                                      Text('${country.code} (${country.name})'),
                                ))
                            .toList(),
                        onChanged: (value) {
                          countryController.selectCountry(value!);
                        },
                        selectedItemBuilder: (BuildContext context) {
                          return countryList.map<Widget>((Country country) {
                            return Text(country.code);
                          }).toList();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      controller: registerController.phoneNumberController,
                      decoration: const InputDecoration(
                        hintText: 'Phone Number',
                        filled: true,
                        fillColor: Color.fromRGBO(201, 201, 201, 1),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 12.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    registerController.signUp();
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(158, 44, 149, 1),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Color.fromRGBO(133, 133, 133, 1),
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  GestureDetector(
                    onTap: () => Get.to(LoginPage()),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Color.fromRGBO(158, 44, 149, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
