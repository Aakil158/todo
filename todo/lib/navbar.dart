import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:todo/pages/Home.dart';
import 'package:todo/pages/add.dart';
import 'package:todo/pages/history.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}
int _current = 0;
 PageController _pageController = new PageController();

void _onPagedChanged(int index) {
    setState(() {
      _current = index;
    });
  }
void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }


List<Widget> pages =[
 Home(),
 Add(),
 History(),
];



class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 118, 149, 255),
        title: Center(
          child: Text('TO-DO'),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 157, 189, 255),

      body: PageView(
        controller: _pageController,
        children: pages,
        onPageChanged: _onPagedChanged,
      ),

      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(Icons.add_task_outlined,color: const Color.fromARGB(255, 255, 215, 196),),
          Icon(Icons.add,color: const Color.fromARGB(255, 255, 215, 196),),
          Icon(Icons.history,color: const Color.fromARGB(255, 255, 215, 196),),
        ],
        color: const Color.fromARGB(255, 118, 149, 255),
        backgroundColor: const Color.fromARGB(255, 157, 189, 255),
        animationCurve: Curves.fastEaseInToSlowEaseOut,
        onTap: (int index) {
          setState(() {
            _current = index;
          });
        },
        ),
    );
  }
}