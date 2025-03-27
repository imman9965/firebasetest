import 'package:flutter/material.dart';
import '../utils/colors.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  bool? _isAdmin;
  String? _username;
  String? _profileImage;

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _setUserLocalData();
  }

  void _setUserLocalData() async {
    debugPrint(_isAdmin.toString() + "))))");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex != 0) {
          _onTabTapped(0);
          return false;
        } else {
          return true;
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: _pages[_currentIndex],
          bottomNavigationBar: Container(
            height: 80,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.black,
                  width: 0.0, // Adjust the width as needed
                ),
              ),
              color: Colors.black,
              boxShadow: [BoxShadow()],
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: _buildNavItem(
                    Icon(Icons.home),
                    'Home',
                    () => _onTabTapped(0),
                  ),
                ),

                Visibility(
                  visible: _isAdmin == true,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: _buildCenterNavItem(
                      IconButton(
                        icon: Icon(
                          Icons.add,
                          color:
                              _currentIndex == 1 ? Colors.white : Colors.black,
                        ),
                        onPressed: () => _onTabTapped(1),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _isAdmin == true,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: _buildNavItem(
                        Icon(Icons.add_home_work),
                      'Add Worker',
                      () => _onTabTapped(2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(Widget icon, String text, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment
                .center, // Ensures the column is only as big as its children
        children: [
          SizedBox(
            height: 40,
            // color: Colors.red,
            child: Center(child: icon),
          ),
          Container(
            color: Colors.transparent,
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCenterNavItem(Widget icon) {
    return Center(
      child: Container(
        width: 60,
        height: 60,
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(shape: BoxShape.circle, color: buttonColor03),
        child: icon,
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
