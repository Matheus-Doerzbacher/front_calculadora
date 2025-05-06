import 'package:flutter/material.dart';
import 'package:front_calculadora/controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _value1 = TextEditingController();
  final TextEditingController _value2 = TextEditingController();
  final TextEditingController _operation = TextEditingController(text: '+');
  final TextEditingController _result = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = HomeController();

    Future<double> operacao(
      String value1,
      String value2,
      String operation,
    ) async {
      if (operation == '+') {
        return await homeController.soma(value1, value2);
      } else if (operation == '-') {
        return await homeController.subtrai(value1, value2);
      } else if (operation == '*') {
        return await homeController.multiplica(value1, value2);
      } else if (operation == '/') {
        return await homeController.divide(value1, value2);
      }
      return 0;
    }

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _value1,
              decoration: InputDecoration(labelText: 'Valor 1'),
            ),
            TextField(
              controller: _value2,
              decoration: InputDecoration(labelText: 'Valor 2'),
            ),
            DropdownButton(
              value: _operation.text,
              items: [
                DropdownMenuItem(value: '+', child: Text('+')),
                DropdownMenuItem(value: '-', child: Text('-')),
                DropdownMenuItem(value: '*', child: Text('*')),
                DropdownMenuItem(value: '/', child: Text('/')),
              ],
              onChanged: (value) {
                setState(() {
                  _operation.text = value as String;
                });
              },
            ),
            FilledButton(
              onPressed: () async {
                final resposta = await operacao(
                  _value1.text,
                  _value2.text,
                  _operation.text,
                );
                setState(() {
                  _result.text = resposta.toStringAsFixed(2);
                });
              },
              child: Text('Calcular'),
            ),
            const SizedBox(height: 20),
            Text('Resultado: ${_result.text}', style: TextStyle(fontSize: 20)),
            Spacer(),
            ElevatedButton(
              onPressed:
                  () => Navigator.pushReplacementNamed(context, '/login'),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
