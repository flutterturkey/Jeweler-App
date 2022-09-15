import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Jewelry Detail Page"),
        ),
        body: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueAccent,
                    border: Border.all(
                        color: const Color.fromARGB(255, 122, 230, 233),
                        width: 5.0,
                        style: BorderStyle.solid),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://img.freepik.com/premium-vector/blue-shiny-clear-diamond-close-up-isolated_212889-1892.jpg?w=2000"),
                    ),
                  ),
                )),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Shine Bright Like a Diaomond",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Price: 600\$",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, top: 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Made in: Africa",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Color: Blue",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    width: 120,
                    padding: const EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.teal),
                        onPressed: () {},
                        child: const Text("Buy")),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}