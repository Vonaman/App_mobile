import 'package:flutter/material.dart';
// import 'home.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulation d'une requête de connexion
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _isLoading = false;
        });
        // Navigation vers la page d'accueil
        Navigator.of(context).pushReplacementNamed('/home');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.amber[50]!, Colors.orange[100]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  // Logo et titre
                  Icon(Icons.chair, size: 80, color: Colors.amber[800]),
                  const SizedBox(height: 24),
                  Text(
                    'Chaise Compare',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Serif',
                      color: Colors.brown[800],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Connectez-vous à votre compte',
                    style: TextStyle(fontSize: 16, color: Colors.brown[600]),
                  ),
                  const SizedBox(height: 48),
                  // Formulaire
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Champ Email
                        CustomTextFormField(
                          controller: _emailController,
                          hintText: 'Email ou identifiant',
                          icon: Icons.email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer votre email';
                            }
                            if (!value.contains('@') && value.length < 3) {
                              return 'Veuillez entrer un email ou identifiant valide';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        // Champ Mot de passe
                        CustomTextFormField(
                          controller: _passwordController,
                          hintText: 'Mot de passe',
                          icon: Icons.lock,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer votre mot de passe';
                            }
                            if (value.length < 6) {
                              return 'Le mot de passe doit contenir au moins 6 caractères';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        // Lien "Mot de passe oublié"
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Fonction de récupération non disponible',
                                  ),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            child: Text(
                              'Mot de passe oublié?',
                              style: TextStyle(color: Colors.amber[800]),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Bouton Connexion
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: CustomButton(
                            label: 'Se connecter',
                            onPressed: _login,
                            isLoading: _isLoading,
                            borderRadius: 12,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Lien inscription
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pas encore inscrit? ',
                        style: TextStyle(color: Colors.brown[600]),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/sign-up');
                        },
                        child: Text(
                          'Créer un compte',
                          style: TextStyle(
                            color: Colors.amber[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
