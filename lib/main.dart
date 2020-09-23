import 'package:flutter/material.dart';

void main() {
  runApp(FormApp());
}

class FormApp extends StatefulWidget {
  @override
  _FormAppState createState() => _FormAppState();
}

class _FormAppState extends State<FormApp> {
  // Global Form Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // AutoValidate To False
  bool _autoValidate = false;

  // Map -> contains the Input Validated Values, values shown in print after submit
  Map<dynamic, dynamic> keyValues = {};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Form"),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: fields(),
          ),
        ),
      ),
    );
  }

  // Widget Function -> Form Fields
  Widget fields() {
    return Container(
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          // First Name Input
          TextFormField(
            decoration: InputDecoration(labelText: "Enter First Name"),
            validator: (String val) {
              if (val.length < 5) return "Enter First Name";
              return null;
            },
            onSaved: (String val) {
              keyValues["firstName"] = val;
            },
          ),
          // Mid Name Input
          TextFormField(
            decoration: InputDecoration(labelText: "Enter Mid Name"),
            validator: (String val) {
              if (val.length < 5) return "Enter Mid Name";
              return null;
            },
            onSaved: (String val) {
              keyValues["secondName"] = val;
            },
          ),
          // Last Name Input
          TextFormField(
            decoration: InputDecoration(labelText: "Enter Last Name"),
            validator: (String val) {
              if (val.length < 5) return "Enter Last Name";
              return null;
            },
            onSaved: (String val) {
              keyValues["lastName"] = val;
            },
          ),
          // City Input
          TextFormField(
            decoration: InputDecoration(labelText: "Enter City Name"),
            validator: (String val) {
              if (val.length < 5) return "Enter City Name";
              return null;
            },
            onSaved: (String val) {
              keyValues["city"] = val;
            },
          ),
          // Phone# Input
          TextFormField(
            decoration: InputDecoration(labelText: "Enter Phone#"),
            keyboardType: TextInputType.number,
            validator: (String val) {
              if (val.length < 6) return "Enter Complete Number";
              return null;
            },
            onSaved: (String val) {
              keyValues["phoneNum"] = val;
            },
          ),
          // Age Input
          TextFormField(
            decoration: InputDecoration(labelText: "Enter Age"),
            keyboardType: TextInputType.number,
            validator: (String val) {
              if (val.length < 1 || val.length > 3) return "Enter Correct Age";
              return null;
            },
            onSaved: (String val) {
              keyValues["age"] = int.parse(val);
            },
          ),
          // Height Input
          TextFormField(
            decoration: InputDecoration(labelText: "Enter Height"),
            keyboardType: TextInputType.number,
            validator: (String val) {
              if (val.length < 1) return "Enter Correct height";
              return null;
            },
            onSaved: (String val) {
              keyValues["height"] = double.parse(val);
            },
          ),
          // Submit Button
          RawMaterialButton(
            onPressed: _validateInputs,
            child: Text(
              "Submit",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent),
            ),
          )
        ],
      ),
    );
  }

  // Validate Inputs
  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      keyValues.forEach(
        (key, value) {
          print('$key: $value');
        },
      );
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
