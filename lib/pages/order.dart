import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  final items = <Map<String,dynamic>>[
    {
      'name': 'Özel Saat',
      'orderNo': '132484',
      'image':
          'https://images.unsplash.com/photo-1600003014755-ba31aa59c4b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80'
    },
    {
      'name': 'Altın Saat',
      'orderNo': '642325',
      'image':
          'https://images.unsplash.com/photo-1572545884955-6f3d7b6540a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80'
    },
    {
      'name': 'Altın Yüzük',
      'orderNo': '325273',
      'image':
          'https://cdn.pixabay.com/photo/2018/08/16/19/56/wedding-rings-3611277_1280.jpg'
    },
    {
      'name': 'Özel Bilezik',
      'orderNo': '965149',
      'image':
          'https://cdn.pixabay.com/photo/2016/02/02/15/54/jewellery-1175532_1280.jpg'
    },
  ];

  final types = <String>['Delivered','Processing','Cancelled'];
  final typeColors = <Color>[Colors.green,Colors.blue.shade700,Colors.red.shade700];
  final icons = [
    const Icon(
      Icons.verified,
      size: 14,
      color: Colors.green,
    ),
    Icon(
      Icons.downloading,
      size: 14,
      color: Colors.blue.shade700,
    ),
    Icon(
      Icons.cancel,
      size: 14,
      color: Colors.red.shade700,
    ),
  ];

  late TabController controller;

  @override
  void initState() {
    super.initState();
    initTabController();
  }

  void initTabController() {
    controller = TabController(length: 3, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        bottom: buildTabBar(),
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: Color(0xff002171),fontSize: 22,fontWeight: FontWeight.bold),
        elevation: 0,
      ),
      body: TabBarView(
        controller: controller,
        children: List.generate(
          3,
          (index) => buildItemList(size,types[index],icons[index],typeColors[index]),
        ),
      ),
    );
  }

  ListView buildItemList(Size size,type,icon,color) {
    return ListView.builder(
      itemCount: items.length,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.02,
      ),
      itemBuilder: (context, index) => buildEachItem(size, index,type,icon,color),
    );
  }

  Container buildEachItem(Size size, int index,type,icon,color) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: size.height * 0.12 + 16,
      margin: EdgeInsets.only(bottom: size.height * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            color: Colors.grey.shade200,
            blurRadius: 3,
            spreadRadius: 1,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildImage(index, size),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildItemDetail(index),
                      buildItemDate(),
                    ],
                  ),
                  buildItemInformation(type,icon,color)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildItemInformation(type,icon,color) {
    return Row(
      children: [
        icon,
         Text(
          ' $type',
          style:  TextStyle(fontSize: 12, color: color),
        ),
        const Spacer(),
        Row(
          children: [
            Text(
              'Details',
              style: TextStyle(fontSize: 12, color: Colors.orange.shade800),
            ),
            Icon(
              Icons.arrow_right,
              color: Colors.orange.shade800,
            )
          ],
        )
      ],
    );
  }

  Text buildItemDate() {
    return Text(
      '16 Ağustos 2022',
      style: TextStyle(
        color: Colors.grey.shade800,
        fontSize: 11,
      ),
    );
  }

  Column buildItemDetail(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          items[index]['name'],
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          'Order No: ${items[index]['orderNo']}',
          style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
        )
      ],
    );
  }

  Image buildImage(int index, Size size) {
    return Image.network(
      items[index]['image'],
      fit: BoxFit.cover,
      width: size.width * 0.2,
      height: size.height * 0.12,
    );
  }

  TabBar buildTabBar() {
    return TabBar(
      controller: controller,
      labelColor: Colors.white,
      indicatorColor: Colors.transparent,
      padding: const EdgeInsets.only(bottom: 3),
      tabs: [
        buildTabItem(title: 'Delivered', index: 0),
        buildTabItem(title: 'Processing', index: 1),
        buildTabItem(title: 'Cancelled', index: 2),
      ],
    );
  }

  Padding buildTabItem({title, index}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: controller.index == index ? Colors.red : null,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: controller.index == index
                ? Colors.white
                : const Color(0xff002171),
          ),
        ),
      ),
    );
  }
}
