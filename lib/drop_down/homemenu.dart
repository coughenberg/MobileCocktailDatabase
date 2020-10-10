
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _myActivities;
  String _myActivitiesResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivities = [];
    _myActivitiesResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivitiesResult = _myActivities.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cocktail Drink App'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: MultiSelectFormField(
                  autovalidate: false,
                  chipBackGroundColor: Colors.red,
                  chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                  dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  checkBoxActiveColor: Colors.blueGrey,
                  checkBoxCheckColor: Colors.lightGreen,
                  dialogShapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  title: Text(
                    "Ingredients for Cocktail:",
                    style: TextStyle(fontSize: 16),
                  ),
                  validator: (value) {
                    if (value == null || value.length == 0) {
                      return 'Please select ingredient options for cocktail drink';
                    }
                    return null;
                  },
                  //Will need to tweak this to use drink values coming back from cocktail API
                  dataSource: [
                    {
                      "display": "Limes",
                      "value": "Limes",
                    },
                    {
                      "display": "Vodka",
                      "value": "Vodka",
                    },
                    {
                      "display": "Rum",
                      "value": "Rum",
                    },
                    {
                      "display": "Cranberry",
                      "value": "Cranberry",
                    },
                    {
                      "display": "Jack Daniels",
                      "value": "Jack Daniels",
                    },
                    {
                      "display": "Cherries",
                      "value": "Cherries",
                    },
                    {
                      "display": "Coca-Cola",
                      "value": "Coca-Cola",
                    },
                    {
                      "display": "Tequila",
                      "value": "Tequila",
                    }
                  ],
                  textField: 'display',
                  valueField: 'value',
                  okButtonLabel: 'OK',
                  cancelButtonLabel: 'CANCEL',
                  hintWidget: Text('Please choose one or more ingredient options'),
                  initialValue: _myActivities,
                  onSaved: (value) {
                    if (value == null) return;
                    setState(() {
                      _myActivities = value;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  child: Text('Submit'),
                  onPressed: _saveForm,
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(_myActivitiesResult),
              )
            ],
          ),
        ),
      ),
    );
  }
}