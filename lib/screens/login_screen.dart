import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/login/login_cubit.dart';
import '../models/registration_form_model.dart';
import '../repositories/auth_repository.dart';
import '../screens/signup_screen.dart';
import '../utilities/icon_selection.dart';
import '../utilities/validation_functions.dart';
import '../widgets/mealify_banner.dart';
import '../styles/themes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static Page page() => const MaterialPage<void>(child: LoginScreen());

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _registrationForm = GlobalKey<FormState>();
  final _emailFormField = GlobalKey<FormFieldState>();
  final _passwordFormField = GlobalKey<FormFieldState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool? _emailIsValid;
  bool? _passwordIsValid;

  final _passwordFocusNode = FocusNode();

  bool _visiblePassword = false;

  var formValues = RegistrationForm(
    email: '',
    password: '',
    confirmedPassword: '',
    confirmedTerms: false,
  );

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _saveForm(Function login) {
    _emailIsValid = _emailFormField.currentState!.validate();
    _passwordIsValid = _passwordFormField.currentState!.validate();
    final valid = _registrationForm.currentState!.validate();
    setState(() {});
    if (!valid) {
      return;
    }
    _registrationForm.currentState!.save();

    login(formValues.email, formValues.password);
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
              const MealifyBanner('Welcome back',
                  'Check for the latest deals around your location!'),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                child: Form(
                  key: _registrationForm,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
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
                          prefixIcon: const Icon(
                            Icons.email,
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
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(
                            Icons.lock,
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
                      const SizedBox(
                        height: 80,
                      ),
                      BlocProvider(
                        create: (_) => LoginCubit(
                          context.read<AuthRepository>(),
                        ),
                        child: SigninButton(onPressed: _saveForm),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'You don\'t have an account?',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          TextButton(
                            child: Text('Create account',
                                style: Theme.of(context).textTheme.labelSmall),
                            onPressed: () {
                              Navigator.of(context).push(SignupScreen.route());
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SigninButton extends StatelessWidget {
  final Function _onPressed;

  const SigninButton({Key? key, required Function onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status == LoginStatus.loading) {
          return const CircularProgressIndicator();
        }

        return ElevatedButton.icon(
          style: AppTheme.elevatedButtonFilledButton().style?.copyWith(
                minimumSize: MaterialStateProperty.resolveWith<Size>(
                    (_) => const Size(double.infinity, 40)),
              ),
          onPressed: () {
            Function loginFuntion =
                context.read<LoginCubit>().logInWithCredentials;

            _onPressed(loginFuntion);
          },
          icon: const Icon(
            Icons.arrow_right_alt,
            size: 18.0,
          ),
          label: const Text('Sign in'),
        );
      },
    );
  }
}
