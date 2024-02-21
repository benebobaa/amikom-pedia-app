import 'package:amikompedia_app/presentation/module/home/home_page.dart';
import 'package:amikompedia_app/presentation/module/otp/otp_page.dart';
import 'package:amikompedia_app/presentation/module/register/register_page.dart';
import 'package:flutter/material.dart';

class BotNavPage extends StatefulWidget {
  const BotNavPage({super.key});

  static const routeName = '/botnav';

  @override
  State<BotNavPage> createState() => _BotNavPageState();
}

class _BotNavPageState extends State<BotNavPage> {
  final List<Widget> pages = [
    HomePage(),
    RegisterPage(),
    OtpPage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Otp',
          ),
        ],
      ),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}
