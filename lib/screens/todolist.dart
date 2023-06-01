import 'package:flutter/material.dart';
import 'package:odev/models/todo.dart';
import 'package:odev/utils/drawer.dart';

class Todolist extends StatefulWidget {
  const Todolist({super.key});

  @override
  State<Todolist> createState() => _TodolistState();
}

late String title;
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
List<Todo> todolist = [];

class _TodolistState extends State<Todolist> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: addTodo,
        child: const Icon(Icons.add),
      ),
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: const [
          Icon(Icons.settings),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              color: Colors.grey[300],
              child: Form(
                key: formKey,
                child: TextFormField(
                  autovalidateMode: autovalidateMode,
                  onSaved: (newValue) {
                    title = newValue!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Boş geçilemez!!";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                      labelText: "Başlık", hintText: "Başlık giriniz"),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.topCenter,
              child: ListView.builder(
                itemCount: todolist.length,
                itemBuilder: (BuildContext context, int index) {
                  Todo item = todolist[index];
                  return ListTile(
                    tileColor: item.isComplated ? Colors.green : Colors.red,
                    title: Text(
                      "#${item.id} - ${item.title}",
                      style: TextStyle(
                        decoration: item.isComplated
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    subtitle: const InkWell(
                      child: Text("Bilgi Giriniz."),
                     
                    ),
                    leading: item.isComplated
                        ? const Icon(Icons.check_box_outlined)
                        : const Icon(Icons.check_box_outline_blank),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        
                        InkWell(
                            child: const Icon(Icons.close),
                            onTap: () async {
                              setState(() {
                                todolist.removeAt(index);
                                deleteTodo(item.id);
                              });
                            })
                      ],
                    ),
                  );
                },
              ),
            ),
          )
         ],
      ),
    );
  }


  void deleteTodo(int id) {
    final item = todolist.firstWhere(((element) => element.id == id));
    todolist.remove(item);
  }

  void addTodo() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        todolist.add(Todo(
            id: todolist.isNotEmpty ? todolist.last.id + 1 : 1,
            title: title,
            isComplated: false));
      });
      debugPrint(todolist.toString());
      alertSuccess();
      formKey.currentState!.reset();
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  void alertSuccess() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Kapat"))
              ],
              content: SizedBox(
                height: 100,
                child: Column(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 72,
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text("Kayıt Eklendi!")),
                  ],
                ),
              ),
            ));
  }
}
