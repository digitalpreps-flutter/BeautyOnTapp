import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscure = true;
  bool _remember = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  InputDecoration _fieldDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.black54),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      // light grey outline like figma
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.black.withOpacity(0.15), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.black, width: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    // Figma width 245, device width ~390 -> ~0.63 of screen width
    final double logoWidth = size.width * 0.63;
    final double logoHeight = logoWidth * (138 / 245); // keep aspect ratio
    final double gap = size.height * 0.018;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.07,
            vertical: size.height * 0.03,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ===== Logo (exact 245x138 ratio, responsive) =====
                SizedBox(height: gap * 1.2),
                Center(
                  child: SizedBox(
                    width: logoWidth,
                    height: logoHeight,
                    child: Image.asset(
                      'assets/images/logo.png', // <-- aapka logo path
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: gap * 1.2),

                // ===== Headings =====
                const Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Welcome Back! Enter Your Account Details',
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: gap * 1.3),

                // ===== Email =====
                TextFormField(
                  controller: _emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _fieldDecoration('Email Address'),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Required' : null,
                ),
                SizedBox(height: gap),

                // ===== Password =====
                TextFormField(
                  controller: _passwordCtrl,
                  obscureText: _obscure,
                  decoration: _fieldDecoration('Password').copyWith(
                    suffixIcon: IconButton(
                      onPressed: () => setState(() => _obscure = !_obscure),
                      icon: Icon(
                        _obscure ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  validator: (v) => (v == null || v.length < 4)
                      ? 'Minimum 4 characters'
                      : null,
                ),
                SizedBox(height: gap * 0.7),

                // ===== Remember + Forgot =====
                Row(
                  children: [
                    Transform.scale(
                      scale: 0.95,
                      child: Checkbox(
                        value: _remember,
                        onChanged: (v) =>
                            setState(() => _remember = v ?? false),
                        shape: const CircleBorder(),
                        side: BorderSide(color: Colors.black.withOpacity(0.5)),
                        activeColor: Colors.black,
                        checkColor: Colors.white,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                    const Text(
                      'Remember Me',
                      style: TextStyle(fontSize: 12.5, color: Colors.black87),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        // TODO: Forgot password
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Forget Password?',
                        style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: gap),

                // ===== Sign In button (black pill) =====
                SizedBox(
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Success -> navigate to Home
                        Get.offAllNamed(
                          '/home',
                        ); // replaces current route with Home
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: const StadiumBorder(), // pill shape like Figma
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    child: const Text('Sign In'),
                  ),
                ),

                SizedBox(height: size.height * 0.12),

                // ===== Bottom sign up text =====
                Center(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.black87, fontSize: 13.5),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/signup'); // <-- navigate to Sign Up
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: gap),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
