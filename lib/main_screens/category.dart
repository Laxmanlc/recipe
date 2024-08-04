import 'package:recipe/main_screens/all_recipe_details.dart';
import 'package:recipe/recipe_screen/read_data.dart';
import 'package:recipe/recipe_screen/recipemodel.dart';

import '../const_page/const_package.dart';
import '../theme.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    final currentTheme = themeProvider.currentTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              color:
                  currentTheme == lightTheme ? Colors.amber : Colors.lightGreen,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(250),
              )),
          height: screenHeight * 0.4,
        ),
        ListView(
          children: [
            Text(
              'What Do You Want To Cook Today ?',
              style: TextStyle(
                  fontSize: screenHeight * 0.045, fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
                future: readJsonData(),
                builder: (context, data) {
                  if (data.hasError) {
                    return Center(child: Text('${data.error}'));
                  } else if (data.hasData) {
                    var items = data.data as List<RecipeModel>;
                    return GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.all(screenHeight * 0.01),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                height: screenHeight * 0.132,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.circular(screenWidth * 0.06),
                                ),
                                child: Image.asset(
                                  items[index]
                                      .image
                                      .toString(), // Replace with your image URL
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(screenWidth * 0.03),
                                child: Text(
                                  items[index].title.toString(),
                                  style:
                                      TextStyle(fontSize: screenWidth * 0.05),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ).box.roundedSM.shadowLg.clip(Clip.antiAlias).make(),
                        ).onTap(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllRecipeDetails(
                                title: items[index].title!,
                                image: items[index].image!,
                                description: items[index].description!,
                                steps: items[index].steps!,
                              ),
                            ),
                          );
                        });
                      },
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
          ],
        ),
      ]),
    );
  }
}
