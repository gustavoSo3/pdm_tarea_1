import 'package:flutter/material.dart';

/*
Created by: Gustavo Jose Hernandez Sotres
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea 1 PDM',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const MyHomePage(title: 'Tarea 1 PDM'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _likes = 15;
  bool _mailPressed = false;
  bool _phonePressed = false;
  bool _routePressed = false;

  void _incrementLikes() {
    setState(() {
      _likes++;
    });
  }

  void _decreaseLikes() {
    setState(() {
      _likes--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.network(
                "https://iteso.mx/image/journal/article?img_id=19998034&t=1587774470583"),
            Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "ITESO, Universidad Jesuita de Guadalajara",
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      "San Pedro Tlaquepaque, Jal",
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
                IconButton(
                    onPressed: _incrementLikes,
                    icon: const Icon(Icons.thumb_up_outlined)),
                IconButton(
                    onPressed: _decreaseLikes,
                    icon: const Icon(Icons.thumb_down_outlined)),
                Flexible(child: Text('$_likes'))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      const snackBar = SnackBar(
                        content: Text(
                          "Send Mail",
                          textAlign: TextAlign.center,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      setState(() {
                        _mailPressed = !_mailPressed;
                      });
                    },
                    icon: const Icon(Icons.mail),
                    color: _mailPressed ? Colors.indigo : Colors.black),
                IconButton(
                    onPressed: () {
                      const snackBar = SnackBar(
                        content: Text(
                          "Call ITESO",
                          textAlign: TextAlign.center,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      setState(() {
                        _phonePressed = !_phonePressed;
                      });
                    },
                    icon: const Icon(Icons.phone_forwarded),
                    color: _phonePressed ? Colors.indigo : Colors.black),
                IconButton(
                    onPressed: () {
                      const snackBar = SnackBar(
                        content: Text(
                          "Goto ITESO",
                          textAlign: TextAlign.center,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      setState(() {
                        _routePressed = !_routePressed;
                      });
                    },
                    icon: const Icon(Icons.directions),
                    color: _routePressed ? Colors.indigo : Colors.black),
              ],
            ),
            const Flexible(
                child: Text(
                    "El ITESO es la Universidad Jesuita de Guadalajara. Fue fundado en 1957 y pertenece al conjunto de más de 228 universidades jesuitas en el mundo. Comparte con ellas la tradición educativa de 450 años, históricamente ubicada en el centro del pensamiento mundial y reconocida por la formación de líderes en todos los campos de las ciencias y las artes."))
          ],
        ),
      ),
    );
  }
}
