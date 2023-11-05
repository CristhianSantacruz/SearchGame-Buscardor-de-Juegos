import 'package:flutter/material.dart';
import 'package:search_system/data/games.dart';
import 'package:search_system/resources/container_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  static List<GameModel> gamesList = GameModel.listGames();
  List<GameModel> displayGames = List.from(gamesList);
  void updateList(String value) {
    // esto actualiza la lista

    setState(() {
      displayGames = gamesList
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text("Buscador"),
            elevation: 0,
            backgroundColor: Colors.black,
            actions: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                child: Text(
                  "Count : ${displayGames.length}",
                  style: const TextStyle(fontSize: 17),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Busca tu juego",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
                const SizedBox(
                  height: 20,
                ),
                myTextField(),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: displayGames.isEmpty
                        ? const Center(
                            child: Text(
                              "No se encontro nada",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : ListView.builder(
                            itemCount: displayGames.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(14),
                                child: ContainerInfo(
                                    text: displayGames[index].name,
                                    price: displayGames[index].price.toString(),
                                    imagepath: displayGames[index].imagePath,
                                    year: displayGames[index].year),
                              );
                            })),
              ],
            ),
          )),
    );
  }

  TextField myTextField() {
    return TextField(
      onChanged: (value) => updateList(value),
      controller: controller,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        helperStyle: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        helperText: "Ingresa lo que deseas buscar",
        hintText: "Escribe lo que deseas buscar",
        hintStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
      ),
    );
  }
}
