import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // Create TextEditingController for each input field
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController aadharController = TextEditingController();

  // Function to handle form submission
  void _submitForm() {
    String name = nameController.text;
    String email = emailController.text;
    String phone = phoneController.text;
    String aadhar = aadharController.text;

    // Add your logic here to handle the form submission
    // For now, we'll just print the values to the console
    print("Name: $name");
    print("Email: $email");
    print("Phone: $phone");
    print("Aadhar: $aadhar");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: aadharController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Aadhar Number',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(

              onPressed: savePersonalData,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  savePersonalData() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore.collection("Admission").doc().set({
    "name": nameController.text,
    "Email": emailController.text,
    "Aadharnumber": aadharController.text,
    "Phone Number": phoneController.text,
    });
  }
}
