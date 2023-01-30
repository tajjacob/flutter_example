import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MicrosoftAuthPage extends StatefulWidget {
  const MicrosoftAuthPage({
    Key? key,
    // required this.title,
  }) : super(key: key);
  // final String title;

  @override
  MicrosoftAuthPageState createState() => MicrosoftAuthPageState();
}

class MicrosoftAuthPageState extends State<MicrosoftAuthPage> {
  static final Config config = Config(
      tenant: 'ea5215fb-7987-4a9d-994e-aeb1095dec3e',
      clientId: 'f621f566-a715-475d-ba64-3cf409fa56e9',
      scope: 'api://f621f566-a715-475d-ba64-3cf409fa56e9/Read',
      navigatorKey: navigatorKey,
      loader: const SizedBox());
  final AadOAuth oauth = AadOAuth(config);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Microsoft Auth'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              'AzureAD OAuth',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.launch),
            title: const Text('Login'),
            onTap: () {
              login(false);
            },
          ),
          // if (kIsWeb)
          //   ListTile(
          //     leading: const Icon(Icons.launch),
          //     title: const Text('Login (web redirect)'),
          //     onTap: () {
          //       login(true);
          //     },
          //   ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Logout'),
            onTap: () {
              logout();
            },
          ),
        ],
      ),
    );
  }

  void showError(dynamic ex) {
    showMessage(ex.toString());
  }

  void showMessage(String text) {
    var alert = AlertDialog(content: Text(text), actions: <Widget>[
      TextButton(
          child: const Text('Ok'),
          onPressed: () {
            Navigator.pop(context);
          })
    ]);
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  void login(bool redirect) async {
    config.webUseRedirect = redirect;
    final result = await oauth.login();
    result.fold(
      (l) => showError(l.toString()),
      (r) => showMessage('Logged in successfully, your access token: $r'),
    );
    var accessToken = await oauth.getAccessToken();
    if (accessToken != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(accessToken)));
    }
  }

  void logout() async {
    await oauth.logout();
    showMessage('Logged out');
  }
}
