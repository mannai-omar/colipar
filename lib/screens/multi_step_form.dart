import 'package:colipar/services/announcement_services.dart';
import 'package:colipar/styles/colors.dart';
import 'package:colipar/styles/text_styles.dart';
import 'package:colipar/widgets/auto_complete.dart';
import 'package:colipar/widgets/custom_button.dart';
import 'package:colipar/widgets/nav_bar.dart';
import 'package:colipar/widgets/text_field.dart';
import 'package:flutter/material.dart';

import '../models/announcement.dart';

const List<Widget> icons = <Widget>[
  Icon(Icons.flight),
  Icon(Icons.directions_boat),
];

class MultiStepForm extends StatefulWidget {
  const MultiStepForm({super.key});

  @override
  _MultiStepFormState createState() => _MultiStepFormState();
}

class _MultiStepFormState extends State<MultiStepForm> {
  final AnnouncementService announcementService = AnnouncementService();
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  final List<bool> _selectedToggle = <bool>[true, false];

  final _departureController = TextEditingController();
  final _arrivalController = TextEditingController();
  final _flightNumberController = TextEditingController();
  final _acceptedSizeController = TextEditingController();
  final _weightController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _countryController = TextEditingController();

  DateTime? _selectedDepartureDate;
  DateTime? _selectedArrivalDate;

  Future<void> _selectDate(BuildContext context, bool isDeparture) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        if (isDeparture) {
          _selectedDepartureDate = picked;
        } else {
          _selectedArrivalDate = picked;
        }
      });
    }
  }

  bool _validateFields() {
    if (_departureController.text.isEmpty ||
        _arrivalController.text.isEmpty ||
        _selectedDepartureDate == null ||
        _selectedArrivalDate == null ||
        _flightNumberController.text.isEmpty ||
        _acceptedSizeController.text.isEmpty ||
        _weightController.text.isEmpty ||
        _addressController.text.isEmpty ||
        _cityController.text.isEmpty ||
        _postalCodeController.text.isEmpty ||
        _countryController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return false;
    }
    return true;
  }

  void _postAnnouncement() {
    if (_validateFields()) {
    final announcement = Announcement(
      /* idUser: '4fed605b-bc62-427e-a972-339f5ab163fc', 
        dateofDeparture: _selectedDepartureDate!,
        dateofArrival: _selectedArrivalDate!,
        information: '',
        codep: _postalCodeController.text,
        tag: null,
        assessment: null,
        claims: [],
        size: _weightController.text,
        country: _countryController.text,
        placeOfDeparture: _departureController.text,
        placeOfArrival: _arrivalController.text,
        timeOfDeparture: '14:51', 
        acceptedSize: _acceptedSizeController.text,
        adress: _addressController.text,
        city: _cityController.text,
        timeOfArrival: '14:51', */
      idUser: '4fed605b-bc62-427e-a972-339f5ab163fc',
      dateofDeparture: _selectedDepartureDate!,
      dateofArrival: _selectedArrivalDate!,
      information: '',
      codep: _postalCodeController.text,
      tag: null,
      assessment: null,
      claims: [],
      size: _weightController.text,
      country: _countryController.text,
      placeOfDeparture: _departureController.text,
      placeOfArrival: _arrivalController.text,
      timeOfDeparture: '14:51',
      acceptedSize: _acceptedSizeController.text,
      adress: _addressController.text,
      city: _cityController.text,
      timeOfArrival: '14:51',
      flightNumber: _flightNumberController.text,
    );

    announcementService.postAnnouncement(announcement);
    }
  }

  List<Step> _stepperSteps() {
    return [
      /* ========================== Trajet ========================== */
      Step(
        title: const Text('Trajet'),
        content: Column(
          children: <Widget>[
            ToggleButtons(
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < _selectedToggle.length; i++) {
                    _selectedToggle[i] = i == index;
                  }
                });
              },
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              selectedBorderColor: Colors.blue[700],
              selectedColor: Colors.white,
              fillColor: Colors.blue[200],
              color: Colors.blue[400],
              isSelected: _selectedToggle,
              children: icons,
            ),
            const SizedBox(height: 20),
            /* CustomTextField(
              controller: _departureController,
              hintText:
                  _selectedToggle[0] ? 'Aéroport de départ' : 'Port de départ',
              icon: Icons.arrow_circle_up_outlined,
            ), */
            AirportAutocomplete(
                controller: _departureController,
                hintText: _selectedToggle[0]
                    ? 'Aéroport de départ'
                    : 'Port de départ'),
            const SizedBox(height: 20),
            /* CustomTextField(
              controller: _arrivalController,
              hintText: _selectedToggle[0]
                  ? 'Aéroport d\'arrivée'
                  : 'Port d\'arrivée',
              icon: Icons.arrow_circle_down_sharp,
            ), */
            AirportAutocomplete(
              hintText: _selectedToggle[0]
                  ? 'Aéroport d\'arrivée'
                  : 'Port d\'arrivée',
              controller: _arrivalController,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => _selectDate(context, true),
              child: AbsorbPointer(
                child: CustomTextField(
                  hintText: _selectedDepartureDate == null
                      ? 'Date de départ'
                      : "${_selectedDepartureDate!.day}-${_selectedDepartureDate!.month}-${_selectedDepartureDate!.year}",
                  icon: Icons.calendar_month,
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => _selectDate(context, false),
              child: AbsorbPointer(
                child: CustomTextField(
                  hintText: _selectedArrivalDate == null
                      ? 'Date arrivée'
                      : "${_selectedArrivalDate!.day}-${_selectedArrivalDate!.month}-${_selectedArrivalDate!.year}",
                  icon: Icons.calendar_month,
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _flightNumberController,
              hintText: _selectedToggle[0] ? 'N° vol' : 'N° Immatriculation',
              icon: Icons.numbers,
            ),
            const SizedBox(height: 40),
          ],
        ),
        isActive: _currentStep >= 0,
      ),
      /* ========================== Critères ========================== */
      Step(
        title: const Text('Critères'),
        content: Column(
          children: <Widget>[
            CustomTextField(
              controller: _acceptedSizeController,
              hintText: 'Taille acceptée',
              icon: Icons.line_weight,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _weightController,
              hintText: 'Taille(KG)',
              icon: Icons.monitor_weight,
            ),
            const SizedBox(height: 40),
          ],
        ),
        isActive: _currentStep >= 1,
      ),
      /* ========================== Adresses ========================== */
      Step(
        title: const Text('Adresses'),
        content: Column(
          children: [
            CustomTextField(
              controller: _addressController,
              hintText: 'Adresse',
              icon: Icons.location_on,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _cityController,
              hintText: 'Ville',
              icon: Icons.location_city,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _postalCodeController,
              hintText: 'Code postal',
              icon: Icons.numbers,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _countryController,
              hintText: 'Pays',
              icon: Icons.flag,
            ),
            const SizedBox(height: 40),
          ],
        ),
        isActive: _currentStep >= 2,
      ),
    ];
  }

  void _nextStep() {
    if (_currentStep < _stepperSteps().length - 1) {
      setState(() {
        _currentStep++;
      });
    } else {
      _postAnnouncement();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNav()),
      );
    }
  }

  void _prevStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backgroundWhite,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
          onPressed: _prevStep,
        ),
        title: const Text(
          'Ajouter une annonce',
          style: AppTextStyles.h2,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Theme(
          data: ThemeData(
            canvasColor: AppColors.backgroundWhite,
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: AppColors.blue,
                ),
          ),
          child: Stepper(
            elevation: 0,
            type: StepperType.horizontal,
            currentStep: _currentStep,
            steps: _stepperSteps(),
            onStepContinue: _nextStep,
            onStepCancel: _prevStep,
            onStepTapped: (step) => setState(() => _currentStep = step),
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return CustomButton(
                text: _currentStep == 2 ? 'Confirmer' : 'Suivant',
                onTap: _nextStep,
              );
            },
          ),
        ),
      ),
    );
  }
}
