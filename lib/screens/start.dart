import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

class AuthInfoParameteres {
  String clientId;
  String state;
  String responseType;
  String scope;
  String redirectUri;

  AuthInfoParameteres(
      {this.clientId,
      this.state,
      this.responseType,
      this.scope,
      this.redirectUri});
}

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            title: Text('Health Board App',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.headline6.color)),
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
      String url =
          'https://cloud.ouraring.com/oauth/authorize?client_id=${authInfoParameteres.clientId}&redirect_uri=com.example.oura_flutter:/&state=${authInfoParameteres.state}&response_type=${authInfoParameteres.responseType}&scope=${authInfoParameteres.scope}';
      final result =
          await FlutterWebAuth.authenticate(url: url, callbackUrlScheme: 'com.example.oura_flutter');

      print(result);
      if (result != null ) {
        final token = Uri.parse(result);
        print('token');
        print(token);
      } else {
        print('token');
        print('error');
      }

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
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.headline6.color),
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
