import 'package:flutter/material.dart';

import 'recipe.dart';
import 'recipe_detail.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  // 1
  @override
  Widget build(BuildContext context) {
    // 2
    final theme = ThemeData();
    // 3
    return MaterialApp(
      // 4
      title: 'Recipe Calculator',
      // 5
      theme: theme.copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.greenAccent,
        ),
      ),
      // 6
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // 1
    return Scaffold(
      // 2
      appBar: AppBar(
        title: const Text('Dragon Mart'),
      ),
      // 3
      body: SafeArea(
        // 4
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dragon Mart heading
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Food Items',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Other items section - can be expanded as needed
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                '',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            // Grid of recipes
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 items per row
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.8, // Adjust aspect ratio as needed
                ),
                itemCount: Recipe.samples.length,
                itemBuilder: (BuildContext context, int index) { 
                  //return the single widget .
                  // represent a single item. 
                  // .Cannot return a multiple widget. when i want to compose
                  // multiple widget for that there are multiple widget where 
                  // we can put multiple widget. For horizontal row  we use 
                  // widget row
                  // inside the widget we have childern not child

                  return GestureDetector( 
                    // 8
                    onTap: () {
                      // 9
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            // 10
                            return RecipeDetail(recipe: Recipe.samples[index]);
                          },
                        ),
                      );
                    },
                    // 11
                    child: buildRecipeCard(Recipe.samples[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRecipeCard(Recipe recipe) {
    return Card(
      // 1
      elevation: 2.0,
      // 2
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      // 3
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        // 4
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image(
                image: AssetImage(recipe.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            // 5
            const SizedBox(
              height: 8.0,
            ),
            // 6
            Text(
              recipe.label,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
