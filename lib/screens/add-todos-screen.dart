import 'package:flutter/material.dart';
import 'package:todos_app/widgets/info-widget.dart';
import 'package:todos_app/widgets/textfield-widget.dart';
import 'package:todos_app/widgets/icon-text-widget.dart';
import 'package:todos_app/providers/todos-provider.dart';
import 'package:todos_app/models/todos-model.dart';
import 'package:todos_app/screens/home-screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddTodosScreen extends StatelessWidget {
  const AddTodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provGet = Provider.of<TodosProvider>(context);
    final provSet = Provider.of<TodosProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TodosApp'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const IconTextWidget(title: 'Kegiatan', icon: Icons.list_alt),
                  TextFieldWidget(
                    controller: provGet.getTitleController,
                    title: 'Judul Kegiatan',
                    width: MediaQuery.of(context).size.width / 1.8,
                    borderType: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    readOnly: false,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const IconTextWidget(title: 'Kategori', icon: Icons.list_alt),
                  TextFieldWidget(
                    controller: provGet.getCategoriController,
                    title: 'Kategori Todo',
                    width: MediaQuery.of(context).size.width / 1.8,
                    borderType: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    readOnly: false,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Column(
                children: [
                  const IconTextWidget(
                    title: 'Keterangan',
                    icon: Icons.format_align_left,
                  ),
                  TextFieldWidget(
                    controller: provGet.getDescController,
                    title: 'Tambah Keterangan',
                    borderType: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    readOnly: false,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const IconTextWidget(
                          title: 'Tanggal Mulai',
                          icon: Icons.date_range,
                        ),
                        TextFieldWidget(
                          title: DateFormat.yMd().format(DateTime.now()),
                          width: 120,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          readOnly: true,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const IconTextWidget(
                          title: 'Tanggal Selesai',
                          icon: Icons.date_range_outlined,
                        ),
                        TextFieldWidget(
                          tap: () {
                            _selectDate(BuildContext context) async {
                              final DateTime? showDateFinish =
                                  await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2030),
                              );

                              showDateFinish != null &&
                                      showDateFinish != DateTime.now()
                                  ? provSet.setDateController = showDateFinish
                                  : null;
                            }

                            _selectDate(context);
                          },
                          title: DateFormat.yMd()
                              .format(provGet.getDateController),
                          width: 120,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          readOnly: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                      onPressed: () {
                        provGet.empty();

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: const Text('Batal'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        if (provGet.getTitleController.text.isEmpty ||
                            provGet.getDescController.text.isEmpty ||
                            provGet.getCategoriController.text.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const InfoWidget(
                                title: 'Error!',
                                content: 'Todo tidak boleh kosong.',
                              );
                            },
                          );
                        } else {
                          const uuid = Uuid();
                          provGet.addNum();

                          provSet.addTodo(TodoModel(
                            id: uuid.v4(),
                            number: provGet.num,
                            title: provGet.getTitleController.text,
                            desc: provGet.getDescController.text,
                            categori: provGet.getCategoriController.text,
                            dateFinish: provGet.getDateController,
                          ));

                          provGet.empty();

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                            (route) => false,
                          );
                        }
                      },
                      child: const Text('Simpan'),
                    ),
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
