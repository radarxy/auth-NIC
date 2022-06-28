import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mgmt/pages/login.dart';
import 'dart:math';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('failed to pick image: $e');
    }
  }

  final _formkey = GlobalKey<FormState>();
  final firstnameEC = new TextEditingController();
  final secondnameEC = new TextEditingController();
  final districtEC = new TextEditingController();
  final emailEC = new TextEditingController();
  final passwordEC = new TextEditingController();
  final cnfpasswordEC = new TextEditingController();
  final mobileEC = new TextEditingController();
  final noOfPeopleEC = new TextEditingController();
  final GSTEC = new TextEditingController();

  String _stateController = 'Haryana';
  String _catController = 'Categories';
  String _genderController = 'Male';

  @override
  Widget build(BuildContext context) {
    //name
    final firstnameField = TextFormField(
      autofocus: false,
      controller: firstnameEC,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "First Name can't be empty";
        }
      },
      onSaved: (value) {
        firstnameEC.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: "enter First Name",
        labelText: "First Name",
      ),
    );

    final secondnameField = TextFormField(
      autofocus: false,
      controller: secondnameEC,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Second Name can't be empty";
        }
      },
      onSaved: (value) {
        secondnameEC.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: "enter Second Name",
        labelText: "Second Name",
      ),
    );

    final districtField = TextFormField(
      autofocus: false,
      controller: districtEC,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Second Name can't be empty";
        }
      },
      onSaved: (value) {
        districtEC.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: "enter District",
        labelText: "District",
      ),
    );

    final GSTField = TextFormField(
      autofocus: false,
      controller: GSTEC,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "GST number can't be empty";
        }
      },
      onSaved: (value) {
        GSTEC.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: "enter GST no.",
        labelText: "GST no.",
      ),
    );

    //email
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEC,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Email can't be empty";
        }
      },
      onSaved: (value) {
        emailEC.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: "enter Email",
        labelText: "Email",
      ),
    );

    final MobileField = TextFormField(
      autofocus: false,
      controller: mobileEC,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Mobile Number can't be empty";
        }
        if (value.length != 10) {
          return "Mobile Number not valid";
        }
      },
      onSaved: (value) {
        mobileEC.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: "enter Mobile Number",
        labelText: "Mobile Number",
      ),
    );

    final noOfPeopleField = TextFormField(
      autofocus: false,
      controller: noOfPeopleEC,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "field can't be empty";
        }
      },
      onSaved: (value) {
        noOfPeopleEC.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: "enter No of People",
        labelText: "No of People",
      ),
    );

    final catField = DropdownButtonFormField<String>(
      value: _catController,
      items: [
        'Categories',
        'food',
        'NGCC',
        'education',
        'cosmetics',
        'jewellery',
        'handicrafts',
        'handiloom'
      ]
          .map((label) => DropdownMenuItem(
                child: Text(label.toString()),
                value: label,
              ))
          .toList(),
      hint: Text('Rating'),
      onChanged: (value) {
        setState(
          () {
            _catController = value!;
          },
        );
      },
    );

    final stateField = DropdownButtonFormField<String>(
      value: _stateController,
      items: [
        'Andhra Pradesh',
        'Arunachal Pradesh',
        'Assam',
        'Bihar',
        'Chhattisgarh',
        'Goa',
        'Gujarat',
        'Haryana',
        'Himachal Pradesh',
        'Jharkhand',
        'Karnataka',
        'Kerala',
        'Madhya Pradesh',
        'Maharashtra',
        'Manipur',
        'Meghalaya',
        'Mizoram',
        'Nagaland',
        'Odisha',
        'Punjab',
        'Rajasthan',
        'Sikkim',
        'Tamil Nadu',
        'Telangana',
        'Tripura',
        'Uttar Pradesh',
        'Uttarakhand',
        'West Bengal',
        'Andaman and Nicobar Islands',
        'Chandigarh',
        'Dadra & Nagar Haveli & Daman & Diu',
        'Delhi',
        'Jammu and Kashmir',
        'Lakshadweep',
        'Puducherry',
        'Ladakh'
      ]
          .map((label) => DropdownMenuItem(
                child: Text(label.toString()),
                value: label,
              ))
          .toList(),
      hint: Text('Rating'),
      onChanged: (value) {
        setState(
          () {
            _stateController = value!;
          },
        );
      },
    );

    final genderField = DropdownButtonFormField<String>(
      value: _genderController,
      items: [
        'Male',
        'Female',
        'Other',
      ]
          .map((label) => DropdownMenuItem(
                child: Text(label.toString()),
                value: label,
              ))
          .toList(),
      hint: Text('Gender'),
      onChanged: (value) {
        setState(
          () {
            _genderController = value!;
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Details'),
        backgroundColor: Color(0xff4a4e69),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text("Update details"),
                const SizedBox(
                  height: 20,
                ),
                image != null
                    ? Image.file(
                        image!,
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      )
                    : FlutterLogo(
                        size: 100,
                      ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      Material(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () => pickImage(ImageSource.gallery),
                          child: Container(
                            width: 300,
                            height: 50,
                            // decoration: BoxDecoration(
                            //     color: Colors.deepPurple,
                            //     borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: const Text(
                              'Pick Image from Gallery',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Material(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () => pickImage(ImageSource.camera),
                          child: Container(
                            width: 300,
                            height: 50,
                            // decoration: BoxDecoration(
                            //     color: Colors.deepPurple,
                            //     borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: const Text(
                              'Capture Image from Camera',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Material(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () async {
                            final result =
                                await FilePicker.platform.pickFiles();
                            if (result == null) return;
                          },
                          child: Container(
                            width: 300,
                            height: 50,
                            // decoration: BoxDecoration(
                            //     color: Colors.deepPurple,
                            //     borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: const Text(
                              'Upload PDF',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      firstnameField,
                      const SizedBox(
                        height: 20,
                      ),
                      secondnameField,
                      const SizedBox(
                        height: 20,
                      ),
                      genderField,
                      const SizedBox(
                        height: 20,
                      ),
                      emailField,
                      const SizedBox(
                        height: 20,
                      ),
                      stateField,
                      const SizedBox(
                        height: 20,
                      ),
                      districtField,
                      const SizedBox(
                        height: 20,
                      ),
                      MobileField,
                      const SizedBox(
                        height: 20,
                      ),
                      catField,
                      const SizedBox(
                        height: 20,
                      ),
                      GSTField,
                      const SizedBox(
                        height: 20,
                      ),
                      noOfPeopleField,
                      const SizedBox(
                        height: 50,
                      ),
                      Material(
                        color: Color(0xff4a4e69),
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () {},
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: 300,
                            height: 50,
                            // decoration: BoxDecoration(
                            //     color: Colors.deepPurple,
                            //     borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: const Text(
                              'Continue',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
