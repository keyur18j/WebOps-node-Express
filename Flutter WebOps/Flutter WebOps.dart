import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(ColorPaletteApp());
}

class ColorPaletteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorPalettePage(),
    );
  }
}

class ColorPalettePage extends StatefulWidget {
  @override
  _ColorPalettePageState createState() => _ColorPalettePageState();
}

class _ColorPalettePageState extends State<ColorPalettePage> {
  List<Color> colors = [];

  void generateRandomPalette() {
    setState(() {
      colors.clear();
      for (int i = 0; i < 5; i++) {
        colors.add(Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Random Colour Palette'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(30),
                backgroundColor:Colors.black,
                
              ),
              onPressed: generateRandomPalette,
              child: Text(
                  'Generate Palette',

                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            if (colors.isNotEmpty)
              Container(
                width: 400,
                height: 150,
                //decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.white,spreadRadius: 10)] ),
                child: Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 120,
                    ),
                    itemCount: colors.length,
                    itemBuilder: (context, index) {
                      return Container(
                        color: colors[index],
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}