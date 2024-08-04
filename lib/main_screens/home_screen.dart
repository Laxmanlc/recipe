import 'package:recipe/main_screens/festival_details.dart';
import 'package:recipe/recipe_screen/read_data.dart';

import 'package:recipe/theme.dart';

import '../const_page/const_package.dart';
import '../recipe_screen/recipemodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    final currentTheme = themeProvider.currentTheme;
    //!
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              color:
                  currentTheme == lightTheme ? Colors.amber : Colors.lightGreen,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              )),
          height: screenHeight * 0.4,
        ),
        ListView(children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.02),
                child: Text(
                  'Nepali food, the source of joy!',
                  style: TextStyle(fontSize: screenHeight * 0.04),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Container(
                height: 200,
                color: Colors.transparent,
                child: VxSwiper.builder(
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    height: screenHeight * 0.23,
                    itemCount: slider.length,
                    itemBuilder: ((context, index) => Image.asset(
                          slider[index],
                          fit: BoxFit.fill,
                        )
                            .box
                            .rounded
                            .shadow3xl
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 15))
                            .make())),
              ),
            ],
          ).box.shadow3xl.outerShadow3Xl.clip(Clip.antiAlias).make(),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Welcome !...",
              style: TextStyle(
                  fontSize: 32,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Let's Enjoy 50+ Typical Nepali Recipe With Us. . . .",
              style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
            ),
          ),
          Divider(
            color:
                currentTheme == lightTheme ? Colors.amber : Colors.lightGreen,
            thickness: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: screenWidth * 0.75,
            color: currentTheme == lightTheme
                ? Color.fromARGB(255, 218, 203, 157)
                : Colors.lightGreen,
            child: Text(
              ' Festival Special :',
              style: TextStyle(fontSize: screenHeight * 0.043),
            ),
          ).box.roundedSM.shadow.clip(Clip.antiAlias).make(),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder(
              future: readJsonDatafestival(),
              builder: (context, data) {
                if (data.hasError) {
                  return Center(child: Text('${data.error}'));
                } else if (data.hasData) {
                  var items = data.data as List<FrecipeModel>;
                  return GridView.builder(
                    shrinkWrap: true,

                    physics:
                        const NeverScrollableScrollPhysics(), // To prevent nested scrolling
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: items.length, // Number of items in your GridView
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: currentTheme == lightTheme
                              ? const Color.fromARGB(88, 255, 193, 7)
                              : const Color.fromARGB(104, 4, 254, 42),
                          child: Column(
                            children: [
                              Image.asset(
                                items[index]
                                    .fimage
                                    .toString(), // Replace with your image path

                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                items[index]
                                    .ftitle
                                    .toString(), // Replace with your festival name
                                style: const TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        )
                            .onTap(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FestivalRecipeDetails(
                                    ftitle: items[index].ftitle!,
                                    fimage: items[index].fimage!,
                                    fdescription: items[index].fdescription!,
                                    fsteps: items[index].fsteps!,
                                  ),
                                ),
                              );
                            })
                            .box
                            .roundedSM
                            .shadowSm
                            .clip(Clip.antiAlias)
                            .make(),
                      );
                    },
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              })
        ]),
      ]),
    );
  }
}
