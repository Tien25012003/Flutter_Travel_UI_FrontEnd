import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/utilites/app_color.dart';
import 'package:travel_ui/widgets/destination_carousel.dart';
import 'package:travel_ui/widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  final List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.parachuteBox,
    FontAwesomeIcons.bicycle,
  ];
  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? AppColor.secondColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          _icons[index],
          size: 25,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 30),
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 50),
            child: Text(
              "What would you like to find?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _icons.asMap().entries.map((e) {
              return _buildIcon(e.key);
            }).toList(),
          ),
          const SizedBox(height: 20),
          const DestinationCarousel(),
          const SizedBox(height: 10),
          const HotelCarousel(),
        ],
      )),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentTab,
          items: List<BottomNavigationBarItem>.generate(3, (index) {
            if (index != 2) {
              return BottomNavigationBarItem(
                  icon: index == 0
                      ? const Icon(Icons.search, size: 30)
                      : const Icon(Icons.local_pizza),
                  label: "");
            } else {
              return const BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                      "https://i1.wp.com/www.globalgranary.life/wp-content/uploads/2018/02/JONGSUK2017ygstage.jpg?resize=300%2C379&ssl=1"),
                ),
                label: "",
              );
            }
          }),
          onTap: (int index) {
            setState(() {
              _currentTab = index;
            });
          },
          // items: const [
          //   BottomNavigationBarItem(
          //     icon: Icon(
          //       Icons.search,
          //       size: 30,
          //       color: Colors.black,
          //     ),
          //     label: "",
          //   ),
          //   BottomNavigationBarItem(
          //     icon: Icon(
          //       Icons.local_pizza,
          //       size: 30,
          //       color: Colors.black,
          //     ),
          //     label: "",
          //   ),
          //   BottomNavigationBarItem(
          //     icon: CircleAvatar(
          //       radius: 15,
          //       backgroundImage: NetworkImage(
          //           "https://i1.wp.com/www.globalgranary.life/wp-content/uploads/2018/02/JONGSUK2017ygstage.jpg?resize=300%2C379&ssl=1"),
          //     ),
          //     label: "",
          //   ),
          // ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blue,
        ),
      ),
    );
  }
}
