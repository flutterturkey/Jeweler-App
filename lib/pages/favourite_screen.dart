import 'package:flutter/material.dart';
import '../components/demo_data.dart';
import '../components/favourite_item_card.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: demoData.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 290,
              ),
              itemBuilder: (context, index) {
                return FavouriteItem(
                  title: demoData[index]["title"],
                  price: demoData[index]["price"],
                  imageLink: demoData[index]["imageLink"],
                  hasFavourite: demoData[index]["hasFavourite"],
                  isFavourite: demoData[index]["isFavourite"],
                  onTap: () {
                    /*
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TestPage(index: index),
                    ));
                     */
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
