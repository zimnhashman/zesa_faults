import 'package:flutter/material.dart';

class WeatherMiddleware extends StatefulWidget {
  const WeatherMiddleware({super.key});

  @override
  State<WeatherMiddleware> createState() => _WeatherMiddlewareState();
}

class _WeatherMiddlewareState extends State<WeatherMiddleware> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: const Center(child: Text('Weather Middleware')),
    );
  }
}
