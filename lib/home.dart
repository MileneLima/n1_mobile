import 'package:flutter/material.dart';
import 'package:n1_mobile/categories.dart';
import 'package:n1_mobile/login.dart';
import 'package:n1_mobile/profile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.black,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Expanded(
              child: Center(
                child: Text(
                  'Bem-vindo ao meu aplicativo!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    size: 48.0,
                  ),
                  iconSize: 64.0,
                  color: Colors.red,
                  splashRadius: 32.0,
                ),
                SizedBox(width: 32.0),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.thumb_down,
                    size: 48.0,
                  ),
                  iconSize: 64.0,
                  color: Colors.black,
                  splashRadius: 32.0,
                ),
              ],
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
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
                    SizedBox(height: 10),
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
                      builder: (context) => Home(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Perfil'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ),
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
      ),
    );
  }
}
