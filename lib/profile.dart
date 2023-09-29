import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String userName = "Milene Lima"; 
  final String country = "Brasil"; 
  final int noteCount = 10; 
  final int likeCount = 100; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  radius: 80.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                      '../lib/assets/65581.png'),
                ),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      userName,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      country,
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: <Widget>[
                        const Text(
                          'Notas: ',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          noteCount.toString(),
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(width: 16.0),
                        const Text(
                          'Likes: ',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          likeCount.toString(),
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      minimumSize: Size(150, 50), 
                    ),
                    child: const Text('Visualizar notas',
                        style: TextStyle(fontSize: 16.0, color: Colors.white)),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, 
                      minimumSize: Size(150, 50), 
                    ),
                    child: const Text('Adicionar notas',
                        style: TextStyle(fontSize: 16.0, color: Colors.white)),
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
