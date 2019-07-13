import 'package:flutter/material.dart';
import 'package:manage_my_pet/ui/home_page.dart';
import 'package:manage_my_pet/ui/feeds_page.dart';
import 'package:manage_my_pet/ui/vaccines_page.dart';
import 'package:manage_my_pet/ui/login_page.dart';

import 'package:manage_my_pet/ui/about.dart';
import 'package:manage_my_pet/ui/settings.dart';

class MyDrawer extends StatelessWidget {
  final token;
  // In the constructor, require a token.
  MyDrawer({Key key, @required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Nicollet Njora"),
              accountEmail: new Text("nicollet.njora05@gmail.com"),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage('assets/img/wallpaper.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "http://www.nicolletnjora.com/assets/img/PassportPhoto.jpg")),
            ),
            new ListTile(
                leading: Icon(Icons.pets),
                title: new Text("My Pets"),
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new MyHomePage(token: token)));
                  // Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.fastfood),
                title: new Text("Feeds"),
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new FeedsPage(token: token)));
                  // Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.healing),
                title: new Text("Vaccines"),
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new VaccinesPage(token: token)));
                  // Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.settings),
                title: new Text("Settings"),
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new SettingsPage(token: token)));
                  // Navigator.pop(context);
                }),
            new Divider(),
            new ListTile(
                leading: Icon(Icons.info),
                title: new Text("About"),
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new AboutPage(token: token)));
                  // Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.power_settings_new),
                title: new Text("Logout"),
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new LoginPage()));
                  // Navigator.pop(context);
                }),
          ],
        ),      
    );
  }
}
