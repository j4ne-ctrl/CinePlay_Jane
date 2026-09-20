import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  // true kalau username dan password sama-sama sudah diisi
  bool get _isFilled =>
      _usernameController.text.trim().isNotEmpty &&
      _passwordController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    // rebuild layar tiap kali isi kolom berubah, supaya tombol ikut update
    _usernameController.addListener(() => setState(() {}));
    _passwordController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    Navigator.pushReplacementNamed(
      context,
      "/main",
      arguments: _usernameController.text,
    );
  }

  InputDecoration _fieldDecoration(String label, IconData icon, {Widget? suffix}) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Color(0xFF9A9A9A), fontSize: 13),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 16, right: 12),
        child: Icon(icon, color: const Color(0xFFD4AF37), size: 20),
      ),
      suffixIcon: suffix,
      filled: true,
      fillColor: const Color(0xFF1C1C1C),
      contentPadding: const EdgeInsets.symmetric(vertical: 20),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF2A2A2A)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFD4AF37), width: 1.4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 138,
                      height: 138,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [Color(0xFFF3D67A), Color.fromARGB(255, 187, 144, 2)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFD4AF37).withOpacity(0.35),
                            blurRadius: 24,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Icon(Icons.theaters_rounded, size: 70, color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'CINEPLAY',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD4AF37),
                        letterSpacing: 4,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'CINEPLAY_JANE INSPIRED BY M.TIX',
                      style: TextStyle(
                        color: Color(0xFF9A9A9A),
                        fontSize: 9,
                        letterSpacing: 4,
                      ),
                    ),
                    const SizedBox(height: 46),

                    // Form
                    TextField(
                      controller: _usernameController,
                      style: const TextStyle(color: Color(0xFFF5F5F5)),
                      decoration: _fieldDecoration('Username / Email', Icons.person_outline),
                    ),
                    const SizedBox(height: 14),
                    TextField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      style: const TextStyle(color: Color(0xFFF5F5F5)),
                      decoration: _fieldDecoration(
                        'Password',
                        Icons.lock_outline,
                        suffix: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            color: const Color(0xFF9A9A9A),
                            size: 20,
                          ),
                          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                        ),
                      ),
                    ),
                    const SizedBox(height: 7),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFFD4AF37),
                          padding: EdgeInsets.zero,
                        ),
                        child: const Text('Forgot Password?', style: TextStyle(fontSize: 12.5)),
                      ),
                    ),
                    const SizedBox(height: 14),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          // emas kalau sudah terisi, abu-abu kalau belum
                          gradient: _isFilled
                              ? const LinearGradient(
                                  colors: [Color(0xFFF3D67A), Color.fromARGB(255, 182, 140, 4)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                )
                              : const LinearGradient(
                                  colors: [Color(0xFF3A3A3A), Color(0xFF2A2A2A)],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(14),
                            // null = tombol tidak bisa diklik
                            onTap: _isFilled ? _handleLogin : null,
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: _isFilled ? Colors.black : const Color(0xFF8A8A8A),
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),

                    RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Color(0xFF9A9A9A), fontSize: 13),
                        children: [
                          TextSpan(text: "Don't have an account? "),
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
