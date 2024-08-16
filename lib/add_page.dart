// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AddItemPage extends StatefulWidget {
  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  IconData? _selectedIcon; // To store the selected icon

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Item'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Item Title'),
              ),
              TextField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Item Price'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Text(
                'Select an Icon:',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10.0,
                children: [
                  _buildIconChoice(Icons.shopping_bag),
                  _buildIconChoice(Icons.house),
                  _buildIconChoice(Icons.restaurant),
                  _buildIconChoice(Icons.wallet_giftcard),
                  _buildIconChoice(Icons.phone),
                  _buildIconChoice(Icons.fitness_center),
                  _buildIconChoice(Icons.car_repair),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final String title = _titleController.text;
                  final double? price = double.tryParse(_priceController.text);
                  if (title.isNotEmpty &&
                      price != null &&
                      _selectedIcon != null) {
                    final addSnackbar = SnackBar(
                      content: Text('Budget Has Been Added'),
                      //backgroundColor: accentColor,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(addSnackbar);
                    Future.delayed(Duration(seconds: 3), () {
                      Navigator.pop(context, {
                        'title': title,
                        'price': price,
                        'icon': _selectedIcon,
                      });
                    });
                  }
                  else {
                    final addSnackbar = SnackBar(
                      content: Text('Please Complete All Fields'),
                     // backgroundColor: accentColor,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(addSnackbar);
                    Future.delayed(Duration(seconds: 2), () {
                      print('');
                    });
                  };
                child: Text('Add Item'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build each icon choice
  Widget _buildIconChoice(IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIcon = icon;
        });
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: _selectedIcon == icon ? Colors.blue : Colors.grey,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Icon(
          icon,
          size: 36.0,
          color: _selectedIcon == icon ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}
