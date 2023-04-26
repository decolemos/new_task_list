import 'package:flutter/material.dart';
import 'package:new_task_list/models/task.dart';
import 'package:provider/provider.dart';

import '../provider/tasks.dart';

class TaskForm extends StatelessWidget {
  TaskForm({super.key});

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de tarefa'),
        actions: [
          IconButton(
            onPressed: () {
             bool? isValid = _form.currentState?.validate();

              if(isValid!) {
                  _form.currentState?.save();
                  Provider.of<Tasks>(context, listen: false).put(Task(
                    id: _formData['id'],
                    number: _formData['number'],
                    applicant: _formData['applicant'],
                    description: _formData['description'],
                    sector: _formData['sector'],
                  ),
                );
                Navigator.of(context).pop();
              }
            }, 
            icon: const Icon(Icons.save)
          )
        ],
      ),
      body: Padding(padding: const EdgeInsets.all(20),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Numero do chamado:'),
                validator: (value) {
                  if(value == null || value.trim().isEmpty ){
                    return 'Informe o numero do chamado';
                  }

                  if(value.trim().length < 6){
                    return 'Digite o numero do chamado completo. Minimo 6 digitos';
                  }

                  return null;
                },
                onSaved: (value) => _formData['Numero do chamado:'] = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Descrição:'),
                onSaved: (value) => _formData['Requerente:'] = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Descrição:'),
                onSaved: (value) => _formData['Descrição:'] = value!,       
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Setor:'),
                onSaved: (value) => _formData['Setor:'] = value!,
              ),
            ],
          )
        ),
      ),
    );
  }
}