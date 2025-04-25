import 'package:flutter/material.dart';
import 'package:frontend/components/buttons/logoutBTN.dart';
import 'package:frontend/components/settings_account.dart';
import 'package:frontend/components/settings_list_item.dart';
import 'package:frontend/controller/navigation_controller.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 32, 32, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: mediaquery.height * 0.02,
                  horizontal: mediaquery.width * 0.02),
              child: Text(
                "Settings",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: mediaquery.width * 0.1,
                ),
              ),
            ),
            Consumer<NavigationController>(
              builder: (context, provider, child) {
                return settingsAccount(
                    provider.user!.username,
                    provider.user!.user_email,
                    mediaquery.width * 0.07,
                    mediaquery.width * 0.04);
              },
            ),
            Flexible(
              child: Consumer<NavigationController>(
                builder: (context, provider, child) {
                  return ListView.builder(
                      itemCount: provider.settings.length,
                      itemBuilder: (context, index) {
                        return settingsItem(provider.settings[index], () {},
                            mediaquery.height * 0.01, mediaquery.width * 0.05);
                      });
                },
              ),
            ),
            logoutBTN(mediaquery.width * 0.07, mediaquery.width * 0.08,
                mediaquery.width)
          ],
        ),
      ),
    );
  }
}
