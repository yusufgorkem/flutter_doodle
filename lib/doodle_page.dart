import 'package:flutter/material.dart';
import 'painter.dart';

class DoodlePage extends StatefulWidget {
  const DoodlePage({super.key});

  @override
  State<DoodlePage> createState() => _DoodlePageState();
}

class _DoodlePageState extends State<DoodlePage> {
  List<Offset?> points = [];
  Color selectedColor = Colors.black;
  double strokeWidth = 4.0;

  Widget buildColorButton(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey.shade800,
            width: selectedColor == color ? 3 : 1,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Doodle",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildColorButton(Colors.black),
                    buildColorButton(Colors.red),
                    buildColorButton(Colors.green),
                    buildColorButton(Colors.blue),
                    buildColorButton(Colors.purple),
                  ],
                ),
                SizedBox(height: 16),
                Text('Stroke Width: ${strokeWidth.toStringAsFixed(1)}'),
                Slider(
                    value: strokeWidth,
                    min: 1.0,
                    max: 20.0,
                    onChanged: (value) {
                      setState(() {
                        strokeWidth = value;
                      });
                    }
                ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  RenderBox renderBox = context.findRenderObject() as RenderBox;
                  points.add(renderBox.globalToLocal(details.globalPosition));
                });
              },
              onPanEnd: (_) => points.add(null),
              child: CustomPaint(
                painter: DoodlePainter(points, selectedColor, strokeWidth),
                child: Container(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.clear),
        onPressed: () => setState(() => points.clear()),
      ),
    );
  }
}
