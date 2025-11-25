class Joke {
  final String title;
  final String description;

  Joke(this.title, this.description);
}

List<Joke> jokes = List.generate(
  20,
  (i) => Joke(
    "Joke ${i + 1}",
    "This is the description of joke number ${i + 1}.",
  ),
);
