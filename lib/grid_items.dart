import 'package:flutter/material.dart';

import 'add_page.dart';

void main() => runApp(MaterialApp(home: ItemsPage()));

class ItemsPage extends StatefulWidget {
  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  List<Map<String, dynamic>> items = [
    {"title": "Item 1", "price": 240, "icon": Icons.shopping_bag},
    {"title": "Item 2", "price": 300, "icon": Icons.restaurant},
    {"title": "Item 3", "price": 150, "icon": Icons.house},
    {"title": "Item 4", "price": 450, "icon": Icons.car_repair},
  ];

  void addItem(String title, double price) {
    setState(() {
      items.add({
        "title": title,
        "price": price,
        "icon":
            Icons.shopping_bag, // You can change the icon based on the title
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items and Prices'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of items per row
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 3 / 2, // Adjust the aspect ratio
          ),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      items[index]['icon'],
                      size: 40.0,
                      color: Colors.blue,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      items[index]['title'],
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      '\$${items[index]['price']}',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddItemPage(),
            ),
          );
          if (result != null) {
            addItem(result['title'], result['price']);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

/*class ItemsGrid extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  ItemsGrid({required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items and Prices'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of items per row
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 3 / 2, // Adjust the aspect ratio
          ),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      items[index]['icon'],
                      size: 40.0,
                      color: Colors.blue,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      items[index]['title'],
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      '\$${items[index]['price']}',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
*/
//void main() => runApp(MaterialApp(home: ItemsGrid(items: items)));
