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
        home: const Column(
          children: [
            Expanded(child: MyHomePage2(title: 'Form Utility Demo')),
            Expanded(child: MyHomePage(title: 'Form Utility Demo')),
          ],
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with FormUtility<MyHomePage>, FormBuilder<MyHomePage> {
  static const String _emailKey = 'email';
  static const String _passwordKey = 'password';

  List<IField> _fields = [];

  @override
  void initState() {
    registerField(
      InputField(
          name: _emailKey,
          hotErrorEnabled: false,
          isRequired: false,
          validators: [EmailValidator(fieldName: 'Email')]),
    );
    registerField(
      InputField(
          name: _passwordKey,
          isRequired: true,
          hotErrorEnabled: true,
          validators: [MinLengthValidator(6, fieldName: 'Password')]),
    );
    startBuilder(onChange: (List<IField> fields) {
      setState(() {
        _fields = fields;
      });
    });
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
            ..._fields.map((e) => Container(
                padding: const EdgeInsets.only(bottom: 20), child: _buildForm(e))),

            ElevatedButton(
                onPressed: () {
                  validateForms();
                },
                child: const Text('Submit'))
          ],
        ),
      ),
    );
  }

  Widget _buildForm(IField field) {
    return SizedBox(
      width: 200,
      child: TextField(
        onChanged: (text) {
          updateField(field.name, text);
        },
        decoration: InputDecoration(
          errorText: field.error,
          label: Text(field.name),
        ),
      ),
    );
  }
}

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage2> createState() => _MyHomePageState2();
}

class _MyHomePageState2 extends State<MyHomePage2>
    with FormUtility<MyHomePage2>, FormBuilder<MyHomePage2> {
  static const String _emailKey = 'email';
  static const String _passwordKey = 'password';
  static const String _confirmPasswordKey = 'confirmPassword';

  List<IField> _fields = [];

  @override
  void initState() {
    registerField(
      InputField(
          name: _emailKey,
          hotErrorEnabled: false,
          isRequired: false,
          validators: [EmailValidator(fieldName: 'Email')]),
    );
    registerField(
      InputField(
          name: _passwordKey,
          isRequired: true,
          hotErrorEnabled: true,
          validators: [MinLengthValidator(6, fieldName: 'Password')]),
    );
    registerField(
      InputField(
          name: _confirmPasswordKey,
          isRequired: true,
          hotErrorEnabled: true,
          generateCustomValidators: (fields) {
            return [
              BaseValidator(
                errorMessage: 'Passwords do not match',
                validation: (value) => value == fields[_passwordKey]?.value,
              ),
            ];
          }),
    );

    startBuilder(onChange: (List<IField> fields) {
      setState(() {
        _fields = fields;
      });
    });
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
            ..._fields.map((e) => Container(
                padding: const EdgeInsets.only(bottom: 20), child: _buildForm(e))),


            ElevatedButton(
                onPressed: () {
                  validateForms();
                },
                child: const Text('Submit'))
          ],
        ),
      ),
    );
  }

  Widget _buildForm(IField field) {
    return SizedBox(
      width: 200,
      child: TextField(
        onChanged: (text) {
          updateField(field.name, text);
        },
        decoration: InputDecoration(
          errorText: field.error,
          label: Text(field.name),
        ),
      ),
    );
  }
}
