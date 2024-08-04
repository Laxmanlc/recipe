import 'package:recipe/const_page/const_package.dart';
import 'package:recipe/main_screens/privacy.dart';

import '../theme.dart';

class Settingg extends StatefulWidget {
  const Settingg({super.key});

  @override
  State<Settingg> createState() => _SettinggState();
}

class _SettinggState extends State<Settingg> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    final currentTheme = themeProvider.currentTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            currentTheme == lightTheme ? Colors.amber : Colors.lightGreen,
        title: Text(
          'Settings',
          style: TextStyle(
              fontSize: screenHeight * 0.03, fontStyle: FontStyle.italic),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Stack(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(mountainss),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child:
                      Container(), // Empty container to reserve space for "hello" text
                ),
                Positioned(
                  top:
                      5, // Adjust the values to position the "hello" text as desired
                  right: 17,
                  child: Text(
                    'NEPAL !',
                    style: TextStyle(
                        color: const Color.fromARGB(150, 0, 0, 0),
                        fontSize: screenHeight * 0.05,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
            ListTile(
              title: Text(
                'Dark Mode',
                style: TextStyle(fontSize: screenHeight * 0.025),
              ),
              leading: const Icon(Icons.nights_stay),
              trailing: Switch(
                inactiveThumbColor: currentTheme == lightTheme
                    ? Colors.amber
                    : Colors.lightGreen,
                activeColor: currentTheme == lightTheme
                    ? Colors.amber
                    : Colors.lightGreen,
                value: themeProvider.currentTheme == darkTheme,
                onChanged: (value) {
                  themeProvider.toggleTheme();
                },
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text(
                'Privacy Policy',
                style: TextStyle(fontSize: screenWidth * 0.055),
              ).onTap(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PrivacyPolicy()));
              }),
            ),
            const Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: screenHeight * 0.38,
            ),
            ListTile(
              title: Text(
                'Contact Us :',
                style: TextStyle(fontSize: screenWidth * 0.045),
              ),
            ),
            ListTile(
              title: SelectableText(
                'codea0730@gmail.com',
                style: TextStyle(fontSize: screenWidth * 0.045),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.016),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Us :',
                style: TextStyle(
                  fontSize: screenHeight * 0.033,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.035,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 20, 20, 20),
                  borderRadius: BorderRadius.circular(screenWidth * 0.05),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 41, 56, 46),
                      offset: Offset(screenWidth * 0.015, screenWidth * 0.015),
                      blurRadius: screenWidth * 0.02, // Responsive blurRadius
                      spreadRadius: screenWidth * 0.003,
                    ),
                    BoxShadow(
                      color: const Color.fromARGB(167, 255, 255, 255),
                      offset:
                          Offset(-screenWidth * 0.015, -screenWidth * 0.015),
                      blurRadius: screenWidth * 0.02, // Responsive blurRadius
                      spreadRadius: screenWidth * 0.003,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(screenWidth * 0.05),
                  child: Image.asset(
                    dalbhat,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Text(
                'Welcome to Nepali Recipe - A Gastronomic Journey Through Nepal\'s Culinary Heritage!',
                style: TextStyle(
                  fontSize: screenHeight * 0.033,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                'Namaste! I am Laxman Lamichhane, the passionate creator of Nepali Recipe, an offline application that offers 50+ authentic Nepali food recipes. Inspired by my mother\'s kitchen and fueled by my love for preserving culinary traditions, I embarked on a mission to curate a diverse collection of dishes that reflect the heart and soul of Nepal. From the iconic "Dal Bhat" to the mouthwatering "Momos," each recipe in Nepali Recipe is infused with fascinating stories and cultural significance. Join me on this flavorful adventure, where we celebrate the art of cooking and embrace the rich tapestry of Nepali cuisine. Let\'s explore together and experience the joy of savoring the true essence of Nepal\'s gastronomic brilliance!\n\nSincerely,\n\nLaxman Lamichhane\nFounder and Creator',
                style: TextStyle(
                  fontSize: screenHeight * 0.03,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
