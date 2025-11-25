import 'package:flutter/material.dart';
import 'jokes.dart';

Color appColor = Colors.green.shade300;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FavoriteJokesPage(),
    );
  }
}

class FavoriteJokesPage extends StatefulWidget {
  const FavoriteJokesPage({super.key});

  @override
  State<FavoriteJokesPage> createState() => _FavoriteJokesPageState();
}

class _FavoriteJokesPageState extends State<FavoriteJokesPage> {
  // Track the best joke index at the parent level
  int? bestJokeIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          return FavoriteCard(
            index: index,
            joke: jokes[index],
            bestJokeIndex: bestJokeIndex,
            onFavoriteChanged: (selectedIndex) {
              setState(() {
                // Set the new favorite index
                if (bestJokeIndex == selectedIndex) {
                  bestJokeIndex = null; // unselect if already selected
                } else {
                  bestJokeIndex = selectedIndex;
                }
              });
            },
          );
        },
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final int index;
  final Joke joke;
  final int? bestJokeIndex;
  final Function(int) onFavoriteChanged;

  const FavoriteCard({
    super.key,
    required this.index,
    required this.joke,
    required this.bestJokeIndex,
    required this.onFavoriteChanged,
  });

  @override
  Widget build(BuildContext context) {
    bool isFavorite = bestJokeIndex == index;

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title,
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                Text(joke.description),
              ],
            ),
          ),
          IconButton(
            onPressed: () => onFavoriteChanged(index),
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
