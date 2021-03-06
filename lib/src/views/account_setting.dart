import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/src/redux/store.dart';
import 'package:ecommerce_flutter/src/redux/user/user_actions.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AccountSetting extends StatefulWidget {
  AccountSetting({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AccountSettingState createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    email.dispose();
    password.dispose();

    super.dispose();
  }

  void _onLogout() {
    print("Ready to logout");
    Redux.store.dispatch(new UserActions().logoutAction);

    if (Redux.store.state.userState.token == "")
      Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "Account Setting",
          style: TextStyle(
            color: Color.fromRGBO(79, 59, 120, 1),
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: ListView(
              children: [
                ListTile(
                  title: Text("Account Info"),
                  onTap: () => {
                    Navigator.pushNamed(context, '/account-info'),
                  },
                ),
                ListTile(
                  title: Text("Address List"),
                  onTap: () => {
                    Navigator.pushNamed(context, '/address-list'),
                  },
                ),
              ],
            ),
          ),
          FlatButton(
            onPressed: () {
              _onLogout();
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(146, 127, 191, 1),
                  Color.fromRGBO(79, 59, 120, 1)
                ], begin: Alignment.topRight, end: Alignment.bottomLeft),
              ),
              child: Center(
                child: Text(
                  "Log Out",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
