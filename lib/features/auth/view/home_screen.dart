import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../routes/app_router.dart';
import '../../../routes/screen_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  String? name;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadName();
  }

  Future<void> _loadName() async {
    final storedName = await storage.read(key: 'name');
    if (mounted) {
      setState(() {
        name = storedName;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, ${name ?? 'User'}!',
              style: const TextStyle(fontSize: 26, color: Colors.black),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Logout'),
              onPressed: () async {
                await storage.deleteAll(); // Clears all stored data
                AppRouter.goToAndRemove(screenName: ScreenName.login);
              },
            )
          ],
        ),
      ),
    );
  }
}
