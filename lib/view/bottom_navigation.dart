import 'package:flutter/material.dart';
import 'package:ticketing_app/view/home_page.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavigationPageState createState() =>
      _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State {
  int _selectedTab = 0;

  final List _pages = [
   const HomePage(),
    const Center(
      child: Text("Ticket"),
    ),
    const Center(
      child: Text("Profile"),
    ),
   
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          actions: const [
            Icon(Icons.notifications,color: Colors.black,)
          ],
          elevation: 0.0,
          centerTitle: true,
          title: const Text('Home',style: TextStyle(
            color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold
          ),),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.menu,color: Colors.black,),
            onPressed: () {},
            //onPressed: () => Navigator.of(context).pop(),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30.0),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  const [
                  Text(
                    'Ticket Details',
                    style: TextStyle(color: Colors.black, fontSize: 16.0,fontWeight: FontWeight.w700),
                  ),

                //  toggleButton(context)
                ],
              ),
            ),
          ),
        )) ,
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket_outlined), label: "Ticket"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
         
        ],
      ),
    );
  }
}