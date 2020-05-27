import 'package:createsecurepassword/blocs/random_password_bloc/random_password_bloc.dart';
import 'package:createsecurepassword/blocs/random_password_bloc/random_password_event.dart';
import 'package:createsecurepassword/blocs/random_password_bloc/random_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final key = new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      backgroundColor: Color(0xff07022b),
      body: BlocBuilder<RandomPasswordBloc, RandomPasswordState>(
          builder: (context, state) {
        return Stack(
          children: <Widget>[
            Image.asset('assets/background.jpeg'),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: state is RandomPasswordLoadingState
                        ? CircularProgressIndicator()
                        : state is RandomPasswordSuccessState
                            ? InkWell(
                                onTap: () {
                                  Clipboard.setData(new ClipboardData(
                                      text: state.compexPassword));
                                  key.currentState.showSnackBar(new SnackBar(
                                    content: new Text("Copied to Clipboard"),
                                  ));
                                },
                                child: Text("${state.compexPassword}",
                                    style: TextStyle(fontSize: 18)),
                              )
                            : Text("Your password is here...",
                                style: TextStyle(fontSize: 18)),
                  ),
                  RaisedButton(
                    onPressed: () => _btnCreateOnPress(context),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child:
                        Text('Create Password', style: TextStyle(fontSize: 18)),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  _btnCreateOnPress(BuildContext context) =>
      BlocProvider.of<RandomPasswordBloc>(context)
        ..add(CreatePassButtonOnPress());
}
