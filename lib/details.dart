import 'dart:math';

import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WallpaperDetails extends StatefulWidget {
  const WallpaperDetails({Key? key}) : super(key: key);

  @override
  State<WallpaperDetails> createState() => _WallpaperDetailsState();
}

class _WallpaperDetailsState extends State<WallpaperDetails> {
  final List<String> wallpapers = [
    "https://a-static.besthdwallpaper.com/girl-sitting-city-top-in-front-of-sunset-wallpaper-1170x2532-121127_226.jpg",
    "https://a-static.besthdwallpaper.com/shadow-of-a-girl-her-cat-watching-dark-town-wallpaper-1080x1920-121204_165.jpg",
    "https://a-static.besthdwallpaper.com/trippy-vibe-wallpaper-1080x1920-121209_165.jpg",
    "https://a-static.besthdwallpaper.com/dark-night-on-my-own-wallpaper-1080x1920-121251_165.jpg",
    "https://a-static.besthdwallpaper.com/sunset-beautiful-evening-darkness-wallpaper-2732x2048-121189_172.jpg",
  ];

  Future<void> setRandomWallpaper() async {
    final random = Random();
    final randomIndex = random.nextInt(wallpapers.length); // Ensures the entire list is used
    final selectedWallpaper = wallpapers[randomIndex];

    try {
      final result = await AsyncWallpaper.setWallpaper(
        url: selectedWallpaper,
        wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
        goToHome: false,
        toastDetails: ToastDetails.success(),
        errorToastDetails: ToastDetails.error(),
      );

      _showMessage(result ? 'Wallpaper set successfully!' : 'Failed to set wallpaper.');
    } on PlatformException catch (e) {
      _showMessage('Error: ${e.message}');
    } catch (e) {
      _showMessage('Unexpected error occurred.');
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallpaper Setter'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: setRandomWallpaper,
          child: const Text("Change Wallpaper"),
        ),
      ),
    );
  }
}
