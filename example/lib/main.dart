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
    registerField(TextInput(
        label: 'Email',
        name: _emailKey,
        initialValue: '',
        hotErrorEnabled: false,
        isRequired: true,
        validators: [EmailValidator()]));
    registerField(TextInput(
        label: 'Password',
        name: _passwordKey,
        initialValue: '',
        isRequired: true,
        hotErrorEnabled: true,
        validators: [MinLengthValidator(6, fieldName: 'Password')]));
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
                onChanged: (text) {
                  updateField(_emailKey, text);
                },
                decoration: InputDecoration(
                  errorText: _emailFieldErrorMessage,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: TextField(
                onChanged: (text) {
                  updateField(_passwordKey, text);
                  setState(() {
                    _passwordFieldErrorMessage = getField(_passwordKey)?.error;
                  });
                },
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
                  if (_emailFieldErrorMessage != null &&
                      _passwordFieldErrorMessage != null) {
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
