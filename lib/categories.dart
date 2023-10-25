import 'package:flutter/material.dart';
import 'package:n1_mobile/addNotes.dart';
import 'package:n1_mobile/home.dart';
import 'package:n1_mobile/login.dart';
import 'package:n1_mobile/profile.dart';

class CategoriesPage extends StatelessWidget {
  final List<String> categories = [
    'MINDFULNESS',
    'WORK HARD',
    'INSPIRATIONAL',
    'DONT GIVE UP',
    'FRIENDSHIP',
    'LOVE',
    'FAMILY',
    'BREAKUP',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorias'),
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Abra o Drawer quando o ícone do menu for pressionado
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),

      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Dois quadrados por linha
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
      ),

      // Adicione o Drawer à sua tela
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Cabeçalho do Drawer
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                     backgroundColor: Colors.white,
                    backgroundImage: AssetImage('../lib/assets/65581.png'),
                  ),
                  SizedBox(
                      height: 10),
                  Text(
                    'Milene Lima',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Home()), 
                );
              },
            ),
            ListTile(
              title: Text('Perfil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProfilePage()),
                );
              },
            ),
            ListTile(
              title: Text('Categorias'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CategoriesPage()),
                );
              },
            ),
             ListTile(
                title: Text('Notas'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddNotes()),
                  );
                },
              ),
            ListTile(
              title: Text('Sair'),
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (BuildContext context) => LoginScreen(),
                  ),
                  (route) => false, 
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String category;

  CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, 
          width: 2.0, 
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Card(
        child: InkWell(
          onTap: () {
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 8.0),
              Text(
                category,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
