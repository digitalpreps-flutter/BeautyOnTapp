import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _obscure = true;
  bool _agree = false;

  @override
  void dispose() {
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  InputDecoration _fieldDecoration(String label) {
    return InputDecoration(
      hintText: label,
      hintStyle: const TextStyle(color: Colors.black45),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30), // round like Figma
        borderSide: BorderSide(color: Colors.black.withOpacity(0.2), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black, width: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    // Logo dimensions (Figma 245x138 ratio)
    final double logoWidth = size.width * 0.63;
    final double logoHeight = logoWidth * (138 / 245);
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
                SizedBox(height: gap * 1.2),
                Center(
                  child: SizedBox(
                    width: logoWidth,
                    height: logoHeight,
                    child: Image.asset(
                      'assets/images/logo.png', // <- apka logo
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: gap * 1.2),

                const Text(
                  'Sign Up',
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

                // First Name
                TextFormField(
                  controller: _firstNameCtrl,
                  decoration: _fieldDecoration('First Name'),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Required' : null,
                ),
                SizedBox(height: gap),

                // Last Name
                TextFormField(
                  controller: _lastNameCtrl,
                  decoration: _fieldDecoration('Last Name'),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Required' : null,
                ),
                SizedBox(height: gap),

                // Email
                TextFormField(
                  controller: _emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _fieldDecoration('Email'),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Required' : null,
                ),
                SizedBox(height: gap),

                // Password
                TextFormField(
                  controller: _passwordCtrl,
                  obscureText: _obscure,
                  decoration: _fieldDecoration('Password').copyWith(
                    suffixIcon: IconButton(
                      onPressed: () => setState(() => _obscure = !_obscure),
                      icon: Icon(
                        _obscure ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                  validator: (v) =>
                      (v == null || v.length < 4) ? 'Minimum 4 characters' : null,
                ),
                SizedBox(height: gap),

                // Terms and conditions checkbox
                Row(
                  children: [
                    Transform.scale(
                      scale: 0.95,
                      child: Checkbox(
                        value: _agree,
                        onChanged: (v) => setState(() => _agree = v ?? false),
                        shape: const CircleBorder(),
                        side: BorderSide(color: Colors.black.withOpacity(0.5)),
                        activeColor: Colors.black,
                        checkColor: Colors.white,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        'I Agree with Terms & Conditions And Privacy Policy',
                        style: TextStyle(fontSize: 12.5, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: gap),

                // Sign Up button
                SizedBox(
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() && _agree) {
                        // TODO: API call -> On success navigate
                        Get.snackbar('Sign Up', 'Form Submitted',
                            snackPosition: SnackPosition.BOTTOM);
                      } else if (!_agree) {
                        Get.snackbar('Error', 'You must agree to Terms',
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: const StadiumBorder(),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    child: const Text('Sign Up'),
                  ),
                ),

                SizedBox(height: size.height * 0.12),

                // Bottom login link
                Center(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Text(
                        "Don’t have an account? ",
                        style: TextStyle(color: Colors.black87, fontSize: 13.5),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAllNamed('/login');
                        },
                        child: const Text(
                          'Sign In',
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
