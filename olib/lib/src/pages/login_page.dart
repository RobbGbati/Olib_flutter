import 'package:flutter/material.dart';
import 'package:olib/src/pages/main_page.dart';
import 'package:olib/src/widgets/aureole.dart';

import '../tools/transition.dart';
import '../tools/theme.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  bool isLoading = false;
  FocusNode nodeEmail = FocusNode();
  FocusNode nodePassword = FocusNode();

  Widget _emailField() {
    return Theme(
        data: Theme.of(context).copyWith(primaryColor: ThemeColor.green700),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: new InputDecoration(
            border: InputBorder.none,
            hintText: 'Email',
            icon: Icon(Icons.email),
          ),
          onFieldSubmitted: (term) {
            FocusScope.of(context).requestFocus(nodePassword);
          },
          focusNode: nodeEmail,
          validator: (value) {
            if (value.isEmpty) return 'Please enter your email';
            if (value.isNotEmpty && !value.contains('@'))
              return 'Email is not valid';
            setState(() => _email = value);
            return null;
          },
        ),
      );
  }

  Widget passwordField() => Theme(
    data: Theme.of(context).copyWith(primaryColor: ThemeColor.green700),
    child: TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Password',
        icon: Icon(Icons.vpn_key),
      ),
      focusNode: nodePassword,
      onFieldSubmitted: (term) => _login(),
      validator: (value) {
        if (value.isEmpty) return 'Please enter a password';
        setState(() => _password = value);
        return null;
      },
    ),
  );


  // ---------------------------------------
  Widget decorateTextField(Widget textfield) {
    return Container(
      margin: const EdgeInsets.only(top: 15.0, left: 30.0, right: 30),
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: ThemeColor.white,
        borderRadius: new BorderRadius.all(const Radius.circular(22.0)),
        boxShadow: [
          BoxShadow(
            color: ThemeColor.orange,
            blurRadius: 5.0,
            offset: Offset(
              0.0,
              1.0,
            ),
          )
        ],
      ),
      child: textfield,
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () => _login(),
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(22)),
            boxShadow: <BoxShadow>[
              _boxShadow(ThemeColor.white)
            ],
            gradient: _linearGradient()),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 30, color: ThemeColor.white, fontFamily: 'unicorn',),
        ),
      )
    );
  }

  _boxShadow(Color col) => BoxShadow(
    color: col,
    offset: Offset(2, 4),
    blurRadius: 5,
    spreadRadius: 2
  );

  _linearGradient() {
    return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [ThemeColor.deepOrange, ThemeColor.orange],
      tileMode: TileMode.repeated);
  }


  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 2,
                color: Colors.black
              ),
            ),
          ),
          Text('or', style: TextStyle(color: Colors.black),),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 2,
                color: Colors.black
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _facebookButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff1959a9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('f',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff2872ba),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('Log in with Facebook',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: ThemeColor.deepOrange,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        decorateTextField(_emailField()),
        SizedBox(height: 15,),
        decorateTextField(passwordField()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        height: height ,
        child: Stack(
          children: [
            Positioned(
              bottom: 15,
              right: -MediaQuery.of(context).size.width * .46,
              child: Aureole(-3.5, ThemeColor.green700, ThemeColor.green400)
            ),
            Positioned(
              top: 1,
              left: -MediaQuery.of(context).size.width * .32,
              child: Aureole(-1, ThemeColor.green700, ThemeColor.green400)
            ),
            Container(
              child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(height: 30),
                _olibLogo(),
                SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: _emailPasswordWidget(),
                ),
                SizedBox(height: 30),
                _submitButton(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.centerRight,
                  child: Text('Forgot Password ?',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black)),
                ),
                _divider(),
                SizedBox(height: 10),
                _createAccountLabel(),
              ],
                      )
            )
          ]
        ),
      )
    );
  }

  //--------------------
  _olibLogo() {
    return Container(
      height: 200,
      child: Stack(
        children: [
          Hero(
            tag: "OLIB",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  margin: EdgeInsets.only(top: 50, left: 75, right: 75),
                  child: Text("OLIB",
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'unicorn',
                    letterSpacing: 15,
                    color: ThemeColor.deepOrange
                  )),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow> [
                      _boxShadow(Colors.white38)
                    ],
                    border: Border.all(color: Colors.white, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
  }

  _login() async {
    if (_formKey.currentState.validate()) {
      isLoading = true;
      Map body = { "email": _email, "password": _password};
      print(body);
      Navigator.of(context).push(Transition(
        nextPage: MainPage(currentPage: 0,),
        type: TransitionType.leftToRight
      ));
    }
  }
}