class GameModel {
  final String name;
  final double price;
  final String year;
  final String imagePath;

  GameModel(
      {required this.name,
      required this.price,
      required this.year,
      required this.imagePath});

  static List<GameModel> listGames() {
    return [
      GameModel(
          name: "MarioBros",
          price: 6.99,
          year: "2003",
          imagePath: "assets/mario.jpg"),
      GameModel(
          name: "Uncharted 4",
          price: 5.99,
          year: "2003",
          imagePath: "assets/uncharted.jpg"),
      GameModel(
          name: "MarioBros",
          price: 6.99,
          year: "2003",
          imagePath: "assets/mario.jpg"),
      GameModel(
          name: "DragonBall Xenoverse",
          price: 5.99,
          year: "2006",
          imagePath: "assets/dragon.jpg"),
      GameModel(
          name: "GrandTheFauto ",
          price: 5.99,
          year: "2006",
          imagePath: "assets/grand.jpg"),
      GameModel(
          name: "Call of Duty ",
          price: 5.99,
          year: "2006",
          imagePath: "assets/call.png"),
    ];
  }
}
