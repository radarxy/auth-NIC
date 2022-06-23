import 'package:flutter/material.dart';
import 'package:mgmt/pages/login.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final _formkey = GlobalKey<FormState>();
  final firstnameEC = new TextEditingController();
  final emailEC = new TextEditingController();
  final passwordEC = new TextEditingController();
  final cnfpasswordEC = new TextEditingController();

  String _ratingController = 'Haryana';

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
      controller: firstnameEC,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Second Name can't be empty";
        }
      },
      onSaved: (value) {
        firstnameEC.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: "enter Second Name",
        labelText: "Second Name",
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

    final stateField = DropdownButtonFormField<String>(
      value: _ratingController,
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
            _ratingController = value!;
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
                const Text("Sign up, New User"),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      firstnameField,
                      const SizedBox(
                        height: 20,
                      ),
                      secondnameField,
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
                              'Sign up',
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
