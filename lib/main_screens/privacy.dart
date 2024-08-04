import '../const_page/const_package.dart';
import '../theme.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    final currentTheme = themeProvider.currentTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy and Policy"),
        centerTitle: true,
        backgroundColor:
            currentTheme == lightTheme ? Colors.amber : Colors.lightGreen,
      ),
      body: ListView(children: const [
        Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '''Privacy Policy

We operate this mobile application. This page informs you of our policies regarding the collection, use, and disclosure of personal information if you choose to use our App.

Information Collection and Use

Our App does not require any user authentication, login, or sign-up. Therefore, we do not collect or store any personal information about you.

Information Sharing

Since we do not collect any personal information, we do not share any personal information with third parties.

Log Data

We may collect information that your device sends whenever you use our App. This data, known as Log Data, may include information such as your device's Internet Protocol ("IP") address, device name, operating system version, the configuration of the app when utilizing our App, the time and date of your use of the App, and other statistics.

Cookies

Our App does not use "cookies" or any similar technologies.

Security

We value your trust in providing your personal information. We take reasonable steps to ensure the security of your data. However, please be aware that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.

Links to Other Sites

Our App may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.

Children's Privacy

Our App does not address anyone under the age of 13. We do not knowingly collect personal information from children under 13. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we can take the necessary actions.

Changes to This Privacy Policy

We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately after they are posted on this page.

Contact Us

If you have any questions or suggestions about our Privacy Policy, please do not hesitate to contact us.
''',
              style: TextStyle(fontSize: 20),
            )),
      ]),
    );
  }
}
