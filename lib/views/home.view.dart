import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayoutBuilder(
        portrait: (context) => MobilePortrait(),
        landscape: (context) => MobileLandscape(),
      ),
      tablet: Scaffold(
        body: Row(
          children: [
            Container(
              width: context.percentWidth * 30,
              height: context.percentHeight * 100,
              child: MobilePortrait(),
            ),
            Flexible(
              child: Container(
                child: Center(
                  child: Text("data"),
                ),
              ),
            ),
          ],
        ),
      ),
      desktop: Scaffold(
        body: Row(
          children: [
            Container(
              width: context.percentWidth * 30,
              height: context.percentHeight * 100,
              child: MobilePortrait(),
            ),
            Flexible(
              child: Container(
                child: Center(
                  child: Text("data"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MobilePortrait extends StatefulWidget {
  @override
  _MobilePortraitState createState() => _MobilePortraitState();
}

class _MobilePortraitState extends State<MobilePortrait> {
  int selectedIdex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.ac_unit),
        elevation: 0,
        title: Text(
          "Fluttered",
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: Chats(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIdex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            selectedIdex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "Chats",
            icon: Icon(Icons.forum_outlined),
          ),
          BottomNavigationBarItem(
            label: "Groups",
            icon: Icon(Icons.group_outlined),
          ),
          BottomNavigationBarItem(
            label: "Calls",
            icon: Icon(Icons.phone_outlined),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings_outlined),
          ),
        ],
      ),
    );
  }
}

class MobileLandscape extends StatefulWidget {
  @override
  _MobileLandscapeState createState() => _MobileLandscapeState();
}

class _MobileLandscapeState extends State<MobileLandscape> {
  int selectedIdex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.ac_unit),
        elevation: 0,
        title: Text(
          "Fluttered",
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: Chats(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIdex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            selectedIdex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "Chats",
            icon: Icon(Icons.forum_outlined),
          ),
          BottomNavigationBarItem(
            label: "Groups",
            icon: Icon(Icons.group_outlined),
          ),
          BottomNavigationBarItem(
            label: "Calls",
            icon: Icon(Icons.phone_outlined),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings_outlined),
          ),
        ],
      ),
    );
  }
}

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> with TickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: TabBar(
              controller: tabController,
              tabs: [
                Tab(
                  text: "Messages",
                ),
                Tab(
                  text: "People",
                ),
              ],
            ),
          ),
          Flexible(
            child: TabBarView(
              controller: tabController,
              children: [
                ListView.builder(
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("Name"),
                      subtitle: Text("Last message"),
                      trailing: Text("5 mins ago"),
                      leading: Container(
                        width: 32,
                        height: 32,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green[900],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {},
                    );
                  },
                ),
                ListView.builder(
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("Name"),
                      subtitle: Text("Last message"),
                      leading: Container(
                        width: 32,
                        height: 32,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green[900],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {},
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
