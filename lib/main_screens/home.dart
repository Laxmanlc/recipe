import 'package:recipe/const_page/const_package.dart';
import 'package:recipe/main_screens/setting.dart';
import 'package:recipe/main_screens/category.dart';
import 'package:recipe/main_screens/home_screen.dart';
import 'package:recipe/main_screens/sweet.dart';

import '../theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  var navitem = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.food_bank_outlined),
      label: 'All Food',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.category_outlined),
      label: 'Sweets',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];
  var pages = [
    const HomeScreen(),
    const CategoryScreen(),
    const SweetScreen(),
    const Settingg(),
  ];
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final currentTheme = themeProvider.currentTheme;
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 18,
        iconSize: 28,
        backgroundColor:
            currentTheme == lightTheme ? Colors.amber : Colors.lightGreen,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 9, 1, 0),
        unselectedItemColor: Colors.white,
        currentIndex: currentIndex,
        items: navitem,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
