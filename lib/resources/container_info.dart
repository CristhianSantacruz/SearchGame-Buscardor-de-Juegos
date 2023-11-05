import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ContainerInfo extends StatelessWidget {
  final String text;
  final String price;
  final String imagepath;
  final String year;
  const ContainerInfo(
      {super.key,
      required this.text,
      required this.price,
      required this.imagepath,
      required this.year});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(15),
            backgroundColor: Colors.green,
            foregroundColor: Colors.black,
            onPressed: (context) {},
            icon: Icons.shopify_outlined,
          ),
        ],
      ),
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.attach_money_rounded,
                        color: Colors.green,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        price,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    imagepath,
                    width: 100,
                    height: 80,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  year,
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      wordSpacing: 2),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
