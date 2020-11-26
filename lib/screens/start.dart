import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'dart:convert' show jsonDecode;
import 'package:http/http.dart' as http;

class AuthInfoParameteres {
  String clientId;
  String state;
  String responseType;
  String scope;
  String redirectUri;

  AuthInfoParameteres({this.clientId, this.state, this.responseType, this.scope, this.redirectUri});
}

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            title: Text('Health Board App',
                style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.headline6.color)),
            leading: Icon(CupertinoIcons.heart),
          ),
          body: Column(children: <Widget>[
            OauthBlock(),
          ])),
    );
  }
}

class OauthBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _loginAction() async {
      final authInfoParameteres = AuthInfoParameteres(
        clientId: 'RKDF3YTKZSPGAPJO',
        state: 'XXX',
        responseType: 'token',
        scope: 'email daily',
      );
      final callbackScheme = 'com.health.oura_flutter';
      final url = Uri.https('cloud.ouraring.com', '/oauth/authorize', {
        'response_type': authInfoParameteres.responseType,
        'client_id': authInfoParameteres.clientId,
        'redirect_uri': '$callbackScheme:/',
        'scope': authInfoParameteres.scope,
        'state': authInfoParameteres.state
      });
      final result = await FlutterWebAuth.authenticate(url: url.toString(), callbackUrlScheme: callbackScheme);

// Use this code to get an access toke
      print(Uri.parse(result));
    }

    return Container(
      padding: EdgeInsets.only(top: 80),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: (Title(
              color: Theme.of(context).textTheme.headline6.color,
              child: Text(
                'Health Board',
                style: TextStyle(
                    fontSize: 40, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.headline6.color),
              ),
            )),
          ),
          SizedBox(height: 48.0),
          RaisedButton(
            onPressed: () {
              _loginAction();
            },
            child: Text('SIGN IN'),
          ),
        ],
      ),
    );
  }
}
