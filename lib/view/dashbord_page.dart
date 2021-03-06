import 'package:easysoft/view/calles/call_page.dart';
import 'package:easysoft/view/chat/chat_page.dart';
import 'package:easysoft/view/groups/group_page.dart';
import 'package:easysoft/view/home/hompe_page.dart';
import 'package:flutter/material.dart';

class DashbordPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("EasySoft")),
          bottom: TabBar(
            tabs: [
              Tab(text: "Home",icon: Icon(Icons.add_to_home_screen),),
              Tab(text: "Chat",icon: Icon(Icons.chat),),
              Tab(text: "Groups",icon: Icon(Icons.group),),
              Tab(text: "Calls",icon: Icon(Icons.call),),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Ashfaq"),
                accountEmail: Text("ashfaqroy2@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage:
                  AssetImage("assets/images/mypic.jpeg"),
                ),
              ),
              ListTile(
                leading: Icon(Icons.dashboard),
                title: Text("Dashboard"),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.add),
                title: Text("Add"),
                onTap: (){},
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.chat),
                title: Text("Chat"),
              ),
              ListTile(
                leading: Icon(Icons.call),
                title: Text("Calls"),
                onTap: () {}
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("LogOut"),
                onTap: () {
                },
              ),
            ],
          ),
        ),
        endDrawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Ashfaq"),
                accountEmail: Text("ashfaqroy2@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage:
                  AssetImage("assets/images/mypic.jpeg"),
                ),
              ),
              ListTile(
                leading: Icon(Icons.dashboard),
                title: Text("Dashboard"),
                onTap: (){},
              ),
              ListTile(
                leading: Icon(Icons.add),
                title: Text("Add"),
                onTap: (){},
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.chat),
                title: Text("Chat"),
              ),
              ListTile(
                  leading: Icon(Icons.call),
                  title: Text("Calls"),
                  onTap: () {}
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("LogOut"),
                onTap: () {
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DashboardHomePage(itemcount: 2),
            ChatPage(),
            GroupPage(),
            CallPage(),
          ],
        ),
      ),
    );
  }
}
