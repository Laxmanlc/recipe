import 'package:recipe/const_page/const_package.dart';
import 'package:recipe/theme.dart';

class FestivalRecipeDetails extends StatelessWidget {
  final String ftitle;
  final String fimage;
  final String fdescription;
  final List<String> fsteps;

  const FestivalRecipeDetails({
    super.key,
    required this.ftitle,
    required this.fimage,
    required this.fdescription,
    required this.fsteps,
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
          ftitle,
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
                  fimage,
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
                    fdescription,
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
                    children: fsteps.map((step) {
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
