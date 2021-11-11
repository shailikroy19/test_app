import 'package:flutter/material.dart';
import 'package:housy_test_1/dummy.dart';
import 'package:housy_test_1/widgets.dart';

import 'drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var drawerKey = GlobalKey<SwipeDrawerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SwipeDrawer(
        radius: 20,
        key: drawerKey,
        bodyBackgroundPeekSize: 30,
        backgroundColor: Colors.indigo[600],
        drawer: buildDrawer(),
        child: Container(color: Colors.orange[50], child: buildBody()),
      ),
    );
  }

  bool _visible = false;

  TextEditingController dateController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final DateTime dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 50),
      lastDate: DateTime(DateTime.now().year + 50),
    );

    if (dateTime != null) {
      if (mounted)
        setState(() {
          dateController.text = dateTime.year.toString() +
              "-" +
              (dateTime.month < 10 ? "0" : "") +
              dateTime.month.toString() +
              "-" +
              (dateTime.day < 10 ? "0" : "") +
              dateTime.day.toString();
        });
    }
  }

  Widget buildDrawer() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _visible = true;
      });
    });
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 20.0, left: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: CircleAvatar(
                  radius: 20.0,
                  foregroundImage: NetworkImage(image),
                ),
              ),
              label: Text(
                name,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Spacer(),
            TextButton.icon(
              onPressed: () {},
              icon: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Icon(
                  Icons.payment_outlined,
                  color: Colors.white,
                ),
              ),
              label: Text(
                'Payments',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
              label: Text(
                'Discounts',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
              label: Text(
                'Notifications',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Icon(
                  Icons.list,
                  color: Colors.white,
                ),
              ),
              label: Text(
                'Orders',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Icon(
                  Icons.help,
                  color: Colors.white,
                ),
              ),
              label: Text(
                'Help',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Spacer(),
            TextButton.icon(
              onPressed: () {},
              icon: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
              label: Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Icon(
                  Icons.headset_mic,
                  color: Colors.white,
                ),
              ),
              label: Text(
                'Support',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        // build your appBar
        Container(
          width: MediaQuery.of(context).size.width,
          height: 270.0,
          decoration: BoxDecoration(
            color: Colors.orange[200],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 5.0, left: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (drawerKey.currentState.isOpened()) {
                          drawerKey.currentState.closeDrawer();
                        } else {
                          drawerKey.currentState.openDrawer();
                        }
                      },
                      icon: Icon(Icons.menu),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          showSearch(
                            context: context,
                            delegate: CustomSearchDelegate(),
                          );
                        },
                        icon: Icon(Icons.search)),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 30.0,
                      top: 20.0,
                      right: MediaQuery.of(context).size.width / 5.5),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 150.0,
                        width: 150.0,
                        child: buildRangePointerExampleGauge(
                          80,
                          widget: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: CircleAvatar(
                              radius: 45.0,
                              foregroundImage: NetworkImage(image),
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 500),
                        opacity: _visible ? 1.0 : 0.0,
                        child: Column(
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'App Developer',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // build screen body
        Expanded(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My Tasks',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.75),
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            selectDate(context);
                          },
                          child: Icon(Icons.calendar_today),
                          elevation: 2.0,
                          isExtended: false,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ListTile(
                      onTap: () {},
                      title: Text(
                        'To Do',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.alarm,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.red[300],
                      ),
                      subtitle: Text(
                        '5 tasks now. 1 started',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ListTile(
                      onTap: () {},
                      title: Text(
                        'In Progress',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.alarm,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.yellow[600],
                      ),
                      subtitle: Text(
                        '1 task now. 1 started',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ListTile(
                      onTap: () {},
                      title: Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.check_circle_outline,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.blue[300],
                      ),
                      subtitle: Text(
                        '18 tasks now. 13 started',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      child: Text(
                        'Active Projects',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.75),
                        ),
                      ),
                    ),
                  ),
                  Wrap(
                    spacing: 15.0,
                    runSpacing: 15.0,
                    children: [
                      cardWidget(
                        25,
                        Colors.teal[300],
                        'Medical App',
                        '9 hrs progress',
                        () {},
                      ),
                      cardWidget(
                        60,
                        Colors.red[300],
                        'History Notes',
                        '20 hrs progress',
                        () {},
                      ),
                      cardWidget(
                        80,
                        Colors.blue[300],
                        'Health App',
                        '58 hrs progress',
                        () {},
                      ),
                      cardWidget(
                        10,
                        Colors.pinkAccent[100],
                        'Fitness App',
                        '1 hr progress',
                        () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 50.0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
