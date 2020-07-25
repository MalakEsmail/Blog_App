import 'dart:ui';
import 'package:flutter/material.dart';
import 'Authentication.dart';
import 'DialogBox.dart';

class LoginRegisterPage extends StatefulWidget {
  final AuthImplementation auth;
  final VoidCallback onSignedIn;

  LoginRegisterPage({this.auth, this.onSignedIn});

  @override
  State<StatefulWidget> createState() {
    return _LoginRegisterPage();
  }
}

enum FormType { login, register }

class _LoginRegisterPage extends State<LoginRegisterPage> {
  DialogBox dialogBox = new DialogBox();
  final formKey = new GlobalKey<FormState>();
  FormType _formType = FormType.login;
  String _email = "";
  String _password = "";

  //method
  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          String userId = await widget.auth.signIn(_email, _password);
//          dialogBox.information(
//              context, 'Congratulations', ' your are logged in  successfully ');
        } else {
          String userId = await widget.auth.signUp(_email, _password);
//          dialogBox.information(context, 'Congratulations',
//              ' your account has been created successfully ');
        }
        widget.onSignedIn();
      } catch (e) {
        dialogBox.information(context, 'Error', e.toString());
        print(e);
      }
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  //design
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Flutter Blog App'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: new Form(
            key: formKey,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: createInputs() + createButtons(),
            )),
      ),
    );
  }

  List<Widget> createInputs() {
    return [
      SizedBox(
        height: 10.0,
      ),
      logo(),
      SizedBox(
        height: 20.0,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Email'),
        validator: (value) {
          return value.isEmpty ? 'Email is Required' : null;
        },
        onSaved: (value) {
          return _email = value;
        },
      ),
      SizedBox(
        height: 10.0,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Password'),
        obscureText: true,
        validator: (value) {
          return value.isEmpty ? 'Password is Required' : null;
        },
        onSaved: (value) {
          return _password = value;
        },
      ),
      SizedBox(
        height: 20.0,
      ),
    ];
  }

  Widget logo() {
    return new Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 110.0,
        child: Image.asset('images/pp.jpg'),
      ),
    );
  }

  List<Widget> createButtons() {
    if (_formType == FormType.login) {
      return [
        RaisedButton(
          child: Text(
            'Login',
            style: TextStyle(fontSize: 20.0),
          ),
          textColor: Colors.white,
          color: Colors.pink,
          onPressed: validateAndSave,
        ),
        FlatButton(
          child: Text(
            'Not Have an Account ? create Account ?',
            style: TextStyle(fontSize: 14.0),
          ),
          textColor: Colors.red,
          onPressed: moveToRegister,
        )
      ];
    } else {
      return [
        RaisedButton(
          child: Text(
            'create Account',
            style: TextStyle(fontSize: 20.0),
          ),
          textColor: Colors.white,
          color: Colors.pink,
          onPressed: validateAndSubmit,
        ),
        FlatButton(
          child: Text(
            'Already have an  Account ? Login ',
            style: TextStyle(fontSize: 14.0),
          ),
          textColor: Colors.red,
          onPressed: moveToLogin,
        )
      ];
    }
  }
}
