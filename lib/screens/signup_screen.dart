import 'package:flutter/material.dart';

import '../models/registration_form_model.dart';
import '../widgets/mealify_banner.dart';
import '../widgets/checkbox.dart';
import '../utilities/icon_selection.dart';
import '../utilities/validation_functions.dart';
import '../styles/themes.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const SignupScreen());

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _registrationForm = GlobalKey<FormState>();
  final _emailFormField = GlobalKey<FormFieldState>();
  final _passwordFormField = GlobalKey<FormFieldState>();
  final _confirmedPasswordField = GlobalKey<FormFieldState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmedPasswordController = TextEditingController();

  final _passwordFocusNode = FocusNode();
  final _confirmedPasswordFocusNode = FocusNode();
  final _termsFocusNode = FocusNode();

  bool? _emailIsValid;
  bool? _passwordIsValid;
  bool? _confirmedPasswordIsValid;

  bool _visiblePassword = false;
  bool _visiblePasswordConfirmed = false;

  var formValues = RegistrationForm(
    email: '',
    password: '',
    confirmedPassword: '',
    confirmedTerms: false,
  );

  void _saveForm() {
    _emailIsValid = _emailFormField.currentState!.validate();
    _passwordIsValid = _passwordFormField.currentState!.validate();
    _confirmedPasswordIsValid =
        _confirmedPasswordField.currentState!.validate();
    final valid = _registrationForm.currentState!.validate();
    setState(() {});
    if (!valid) {
      return;
    }
    _registrationForm.currentState!.save();
  }

  // always dispose controlers and focusnodes
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmedPasswordController.dispose();
    _passwordFocusNode.dispose();
    _confirmedPasswordFocusNode.dispose();
    _termsFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'lib/assets/images/mealify_registration_vectors.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MealifyBanner(
                  'Registration', 'Create an Account to Continue!'),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                child: Form(
                  key: _registrationForm,
                  child: Column(
                    children: [
                      TextFormField(
                        key: _emailFormField,
                        // initialValue: _initialValues['email'].toString(),
                        validator: (value) => emailValidator(value),
                        style: Theme.of(context).textTheme.titleSmall,
                        onSaved: (_) {
                          formValues =
                              formValues.copyWith(email: _emailController.text);
                        },
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_passwordFocusNode);
                        },
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(
                            Icons.email,
                            size: 20,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          suffixIcon: iconSelection(
                            context,
                            _emailIsValid,
                            () {
                              formValues = formValues.copyWith(email: '');
                              _emailController.clear();
                            },
                            () {
                              _emailController.clear();
                            },
                            () {
                              _emailController.clear();
                            },
                          ),
                        ),
                      ),
                      TextFormField(
                        key: _passwordFormField,
                        validator: (password) => passwordValidator(password),
                        style: Theme.of(context).textTheme.titleSmall,
                        obscureText: _visiblePassword ? false : true,
                        obscuringCharacter: '*',
                        onSaved: (_) {
                          formValues = formValues.copyWith(
                            password: _passwordController.text,
                          );
                        },
                        focusNode: _passwordFocusNode,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_confirmedPasswordFocusNode);
                        },
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(
                            Icons.lock,
                            size: 20,
                          ),
                          suffixIcon: iconSelectionforPasswordField(
                            context,
                            _passwordIsValid,
                            () {
                              setState(() {
                                _visiblePassword = !_visiblePassword;
                              });
                            },
                            () {
                              _passwordController.clear();
                            },
                            () {
                              _passwordController.clear();
                            },
                          ),
                        ),
                      ),
                      TextFormField(
                        key: _confirmedPasswordField,
                        validator: (_) => passwordMatch(
                          _passwordIsValid,
                          _passwordController.text,
                          _confirmedPasswordController.text,
                        ),
                        style: Theme.of(context).textTheme.titleSmall,
                        obscureText: _visiblePasswordConfirmed ? false : true,
                        obscuringCharacter: '*',
                        onSaved: (_) {
                          formValues = formValues.copyWith(
                              confirmedPassword:
                                  _confirmedPasswordController.text);
                        },
                        focusNode: _confirmedPasswordFocusNode,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_termsFocusNode);
                        },
                        controller: _confirmedPasswordController,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          prefixIcon: const Icon(
                            Icons.lock,
                            size: 20,
                          ),
                          suffixIcon: iconSelectionforPasswordField(
                            context,
                            _confirmedPasswordIsValid,
                            () {
                              setState(() {
                                _visiblePasswordConfirmed =
                                    !_visiblePasswordConfirmed;
                              });
                            },
                            () {
                              _confirmedPasswordController.clear();
                            },
                            () {
                              _confirmedPasswordController.clear();
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CheckboxFormField(
                        title: Text(
                          'By creating an account, you agree to our Terms & Conditions',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        onSaved: (_) {
                          formValues =
                              formValues.copyWith(confirmedTerms: true);
                        },
                        validator: (value) => isMarked(value),
                        focusNode: _termsFocusNode,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton.icon(
                        style: AppTheme.elevatedButtonFilledButton()
                            .style
                            ?.copyWith(
                                minimumSize:
                                    MaterialStateProperty.resolveWith<Size>(
                                        (_) =>
                                            const Size(double.infinity, 40))),
                        onPressed: () {
                          _saveForm();
                        },
                        icon: const Icon(
                          Icons.arrow_right_alt,
                          size: 18.0,
                        ),
                        label: const Text('Sign in'),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(35, 15),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text('Log in',
                                style: Theme.of(context).textTheme.labelSmall),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
