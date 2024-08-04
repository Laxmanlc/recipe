import 'package:recipe/main_screens/sweet_details.dart';

import '../const_page/const_package.dart';
import '../recipe_screen/read_data.dart';
import '../recipe_screen/recipemodel.dart';
import '../theme.dart';

class SweetScreen extends StatefulWidget {
  const SweetScreen({super.key});

  @override
  State<SweetScreen> createState() => _SweetScreenState();
}

class _SweetScreenState extends State<SweetScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final currentTheme = themeProvider.currentTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: currentTheme == lightTheme
                    ? Colors.amber
                    : Colors.lightGreen,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(250),
                )),
            height: screenHeight * 0.4,
          ),
          ListView(
            children: [
              Text(
                "Life is better with a spoonful of dessert. . !",
                style: TextStyle(
                  fontSize: screenHeight * 0.045,
                  fontStyle: FontStyle.italic,
                ),
              ),
              FutureBuilder(
                future: readJsonDatasweet(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    var items = snapshot.data as List<SrecipeModel>;

                    return GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.all(screenHeight * 0.01),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                height:
                                    screenHeight * 0.15, // Adjust the height
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(
                                    screenWidth * 0.06,
                                  ),
                                ),
                                child: Image.asset(
                                  items[index].simage.toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: EdgeInsets.all(screenWidth * 0.03),
                                child: Text(
                                  items[index].stitle.toString(),
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.05,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ).box.rounded.clip(Clip.antiAlias).shadowSm.make(),
                        ).onTap(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SweetRecipeDetails(
                                stitle: items[index].stitle!,
                                simage: items[index].simage!,
                                sdescription: items[index].sdescription!,
                                ssteps: items[index].ssteps!,
                              ),
                            ),
                          );
                        });
                      },
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

