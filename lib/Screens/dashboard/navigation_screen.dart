import 'package:flutter/material.dart';
import 'package:frontend/controller/navigation_controller.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatefulWidget {
  NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NavigationController>(builder: (context, provider, child) {
        return IndexedStack(
            index: provider.selectedIndex, children: provider.screens);
      }),
      bottomNavigationBar: Consumer<NavigationController>(
        builder: (context, provider, child) {
          return NavigationBar(
            destinations: [
              NavigationDestination(
                  icon: Icon(Icons.message_rounded), label: 'Chats'),
              NavigationDestination(
                  icon: Icon(Icons.person_search), label: 'New Chat'),
              NavigationDestination(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
            selectedIndex: provider.selectedIndex,
            onDestinationSelected: (index) => provider.selectedIndex = index,
          );
        },
      ),
    );
  }
}
