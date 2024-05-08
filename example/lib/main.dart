import 'package:flutter/material.dart';
import 'package:form_utility/form_utility.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Utility Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Form Utility Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with FormUtils {
  static const String _emailKey = 'email';
  static const String _passwordKey = 'password';

  String? _emailFieldErrorMessage;
  String? _passwordFieldErrorMessage;

  @override
  void initState() {
    registerField(TextInput(name: _emailKey, initialValue: '', hotErrorEnabled: true, isRequired: true, generateValidations: (_) => [EmailValidation()]));
    registerField(TextInput(name: _passwordKey, initialValue: '', isRequired: true, hotErrorEnabled: true, generateValidations: (_) => [MinLengthValidation(6, fieldName: 'Password')]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: TextField(
                onChanged: (text) => updateField(_emailKey, text),
                decoration: InputDecoration(
                  errorText: _emailFieldErrorMessage,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: TextField(
                onChanged: (text) => updateField(_passwordKey, text),
                decoration: InputDecoration(
                  errorText: _passwordFieldErrorMessage,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _emailFieldErrorMessage = validateField(_emailKey);
                    _passwordFieldErrorMessage = validateField(_passwordKey);
                  });
                  if (_emailFieldErrorMessage != null && _passwordFieldErrorMessage != null) {
                    return;
                  } else {
                    //Submitting
                  }
                },
                child: const Text('Submit'))
          ],
        ),
      ),
    );
  }
}
