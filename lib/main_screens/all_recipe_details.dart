// Import the necessary provider package
import 'package:recipe/const_page/const_package.dart';
import '../theme.dart';

class AllRecipeDetails extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final List<String> steps;

  const AllRecipeDetails({
    super.key,
    required this.title,
    required this.image,
    required this.description,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    final currentTheme = themeProvider.currentTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontSize: 26, fontStyle: FontStyle.italic),
        ),
        backgroundColor:
            currentTheme == lightTheme ? Colors.amber : Colors.lightGreen,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: currentTheme == lightTheme
                        ? const Color.fromARGB(159, 21, 21, 21)
                        : const Color.fromARGB(
                            112, 245, 245, 244), // Shadow color
                    spreadRadius: 9, // Spread radius
                    blurRadius: 15, // Blur radius
                    offset: const Offset(0, 3), // Shadow offset
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(screenWidth * 0.06),
                  bottomRight: Radius.circular(screenWidth * 0.06),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  height: screenHeight * 0.33,
                  width: screenWidth,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Description:',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 21),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Steps:',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: steps.map((step) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          '- $step',
                          style: const TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
