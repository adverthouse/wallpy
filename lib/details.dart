import 'dart:math';

import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WallpaperDetails extends StatefulWidget {
  const WallpaperDetails({super.key});

  @override
  State<WallpaperDetails> createState() => _WallpaperDetailsState();
}

class _WallpaperDetailsState extends State<WallpaperDetails> {
  List<String> wallpapers = [
    "https://a-static.besthdwallpaper.com/girl-sitting-city-top-in-front-of-sunset-wallpaper-1170x2532-121127_226.jpg",
    "https://a-static.besthdwallpaper.com/shadow-of-a-girl-her-cat-watching-dark-town-wallpaper-1080x1920-121204_165.jpg",
    "https://a-static.besthdwallpaper.com/trippy-vibe-wallpaper-1080x1920-121209_165.jpg",
    "https://a-static.besthdwallpaper.com/dark-night-on-my-own-wallpaper-1080x1920-121251_165.jpg",
    "https://a-static.besthdwallpaper.com/sunset-beautiful-evening-darkness-wallpaper-2732x2048-121189_172.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              Random random = Random();
              int randomNumber = random.nextInt(4);
              String result;

              try {
                result = await AsyncWallpaper.setWallpaper(
                  url: wallpapers[randomNumber],
                  wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
                  goToHome: false,
                  toastDetails: ToastDetails.success(),
                  errorToastDetails: ToastDetails.error(),
                )
                    ? 'Wallpaper set'
                    : 'Failed to get wallpaper.';
              } on PlatformException {
                result = 'Failed to get wallpaper.';
              }
            },
            child: const Text("Change wallpaper"),
          ),
        ],
      ),
    );
  }
}
