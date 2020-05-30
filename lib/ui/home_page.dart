import 'package:createsecurepassword/blocs/random_password_bloc/random_password_bloc.dart';
import 'package:createsecurepassword/blocs/random_password_bloc/random_password_event.dart';
import 'package:createsecurepassword/blocs/random_password_bloc/random_password_state.dart';
import 'package:createsecurepassword/common/ultis.dart';
import 'package:createsecurepassword/ui/password_length_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/random_password_bloc/random_password_bloc.dart';
import '../blocs/random_password_bloc/random_password_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> _textFormKey = GlobalKey<FormState>();
  TextEditingController _lengthPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final key = new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      backgroundColor: Color(0xff07022b),
      body: BlocBuilder<RandomPasswordBloc, RandomPasswordState>(
          builder: (context, state) {
        return GestureDetector(
          onTap: () => dismissKeyboard(context),
          child: Stack(
            children: <Widget>[
              Image.asset(
                'assets/background.jpeg',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: state is RandomPasswordLoadingState
                            ? CircularProgressIndicator()
                            : state is RandomPasswordSuccessState
                            ? InkWell(
                          onTap: () {
                            Clipboard.setData(new ClipboardData(
                                text: state.compexPassword));
                            key.currentState
                                .showSnackBar(new SnackBar(
                              content:
                              new Text("Copied to Clipboard"),
                            ));
                          },
                          child: Text("${state.compexPassword}",
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold)),
                        )
                            : Text("Your password is here...",
                            style: TextStyle(fontSize: 18)),
                      ),
                    ),
                    _checkboxGroupWidget(context, state),
                    Center(
                      child: RaisedButton(
                        onPressed: () => _btnCreateOnPress(context),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Text('Create Password',
                            style: TextStyle(fontSize: 18)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  _btnCreateOnPress(BuildContext context) {
    String lengthPassword = '8';
    if (_lengthPasswordController.text.isEmpty)
      lengthPassword = '8';
    else
      lengthPassword = _lengthPasswordController.text.trim();
    debugPrint(lengthPassword);
    BlocProvider.of<RandomPasswordBloc>(context)
      ..add(CreatePassButtonOnPress(lengthPassword));
    _lengthPasswordController.text = '';
  }

  Widget _checkboxGroupWidget(BuildContext context, RandomPasswordState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () => _onlyNumberOnPress(context, !state.isSelectOnlyNumber),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Checkbox(
                value: state.isSelectOnlyNumber,
              ),
              Text(
                'Just only number',
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () => _passwordLengthOptionOnPress(
              context, !state.isSelectPasswordLenghtOption),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Checkbox(
                value: state.isSelectPasswordLenghtOption,
              ),
              Text(
                'Password length options',
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
        Form(
          key: _textFormKey,
          child: Visibility(
            visible: state.isSelectPasswordLenghtOption,
            child: TextFormField(
              controller: _lengthPasswordController,
              style: TextStyle(fontSize: 18, color: Colors.black87),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  errorStyle: TextStyle(fontSize: 14, color: Colors.redAccent),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.red[800])),
                  hintText: '8',
                  hintStyle: TextStyle(fontSize: 18, color: Colors.black38),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 12)),
              validator: (value) {
                if (value.isEmpty) return 'This field isn\'t empty';
                return null;
              },
            ),
          ),
        )
      ],
    );
  }

  _onlyNumberOnPress(BuildContext context, bool isSelect) {
    BlocProvider.of<RandomPasswordBloc>(context)
        .add(SelectOnlyNumberOptionOnPresEvent(isSelect));
  }

  _passwordLengthOptionOnPress(BuildContext context, bool isSelect) {
    BlocProvider.of<RandomPasswordBloc>(context)
        .add(SelectPasswordLengthOptionsOnPressEvent(isSelect));
  }
}
