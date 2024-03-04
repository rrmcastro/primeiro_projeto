import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacidade = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tarefas'),
          leading: Container(),
        ),
        body: AnimatedOpacity(
          opacity: opacidade ? 1 : 0,
          duration: Duration(milliseconds: 800),
          child: ListView(
            children: const [
              Tasks(
                  'Estudar Flutter',
                  'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                  1),
              Tasks(
                  'Andar de Bike',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4MGk9JbM2t1gqr_rgMPxYym0CUUKG8Z7p1g&usqp=CAU',
                  2),
              Tasks(
                  'Ler',
                  'https://www.uninorte.com.br/wp-content/uploads/2018/07/tecnicas-ler-blog-uninorte-768x511.jpg',
                  3),
              Tasks(
                  'Meditar',
                  'https://organicsnewsbrasil.com.br/wp-content/uploads/2016/04/benef%C3%ADcios-da-ioga.jpg',
                  4),
              Tasks(
                  'Jogar Futebol',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdDfLzqjjof-cRLR_SA2t5paGVOl-3vMb0wg&usqp=CAU',
                  5)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              opacidade = !opacidade;
            });
          },
          child: Icon(Icons.remove_red_eye),
        ),
      ),
    );
  }
}

class Tasks extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Tasks(this.nome, this.foto, this.dificuldade, {Key? key})
      : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  int nivel = 0;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.blue,
              ),
              height: 140,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black26,
                        ),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            widget.foto,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 200,
                              child: Text(
                                widget.nome,
                                style: const TextStyle(
                                    fontSize: 24,
                                    overflow: TextOverflow.ellipsis),
                              )),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 15,
                                color: widget.dificuldade >= 1
                                    ? Colors.blue
                                    : Colors.blue.shade100,
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: widget.dificuldade >= 2
                                    ? Colors.blue
                                    : Colors.blue.shade100,
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: widget.dificuldade >= 3
                                    ? Colors.blue
                                    : Colors.blue.shade100,
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: widget.dificuldade >= 4
                                    ? Colors.blue
                                    : Colors.blue.shade100,
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: widget.dificuldade >= 5
                                    ? Colors.blue
                                    : Colors.blue.shade100,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: 62,
                          width: 52,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                nivel++;
                              });
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(Icons.arrow_drop_up),
                                Text(
                                  'UP',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: Container(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.dificuldade > 0)
                              ? (nivel / widget.dificuldade) / 10
                              : 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Nivel: $nivel',
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
