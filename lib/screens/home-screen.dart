import 'package:flutter/material.dart';
import 'package:todos_app/screens/add-todos-screen.dart';
import 'package:todos_app/widgets/Items-widget.dart';
import 'package:todos_app/providers/todos-provider.dart';
import 'package:todos_app/widgets/info-widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TodosApp'),
      ),
      body: Consumer<TodosProvider>(builder: (context, todosProvider, child) {
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          children: todosProvider.getTodoList.isNotEmpty
              ? todosProvider.getTodoList.map((el) {
                  return Dismissible(
                    key: Key(el.id),
                    background: Container(
                      color: Colors.red.shade300,
                      child: const Center(
                        child: Text(
                          'Hapus Todo Ini?',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    child: Card(
                      child: ListTile(
                        title: ItemsWidget(
                          title: el.title,
                          desc: el.desc,
                          categori: el.categori,
                          dateFinish: el.dateFinish,
                          number: el.number,
                        ),
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const InfoWidget(
                                title: 'Hapus?',
                                content: 'Geser untuk menghapus.',
                              );
                            },
                          );
                        },
                      ),
                    ),
                    onDismissed: (direction) {
                      Provider.of<TodosProvider>(context, listen: false)
                          .removeTodo(el);
                    },
                  );
                }).toList()
              : [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: const Center(
                      child: Text(
                        'Todo masih kosong!',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTodosScreen(),
            ),
          );
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
