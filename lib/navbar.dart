import 'package:flutter/material.dart';
import 'package:neww/roles.dart';
import 'package:neww/users/farmer.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Username',style: TextStyle(fontSize: 25)),
            accountEmail: Text('email address',style: TextStyle(fontSize: 20)),
            // currentAccountPicture: CircleAvatar(
            //   child: ClipOval(
            //     child: Image.network(
            //       'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
            //       fit: BoxFit.cover,
            //       width: 90,
            //       height: 90,
            //     ),
            //   ),
            // ),
            decoration: BoxDecoration(
              color: Colors.green,
               image: DecorationImage(
                   fit: BoxFit.fill,
                   image: NetworkImage(
                       'https://oflutter.com/wp-content/uploads/2021/02/profile-bg-2.jpg')),
            ),
          ),
         
          
          // ListTile(
          //   leading: Icon(Icons.share),
          //   title: Text('Share'),
          //   onTap: () => null,
          // ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Slot Requests",style: TextStyle(fontSize: 17),),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit Farm Details',style: TextStyle(fontSize: 17),),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings',style: TextStyle(fontSize: 17),),
            onTap: () => null,
          ),
          
          Divider(),
          ListTile(
            title: Text('Logout',style: TextStyle(fontSize: 17),),
            leading: Icon(Icons.exit_to_app),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}