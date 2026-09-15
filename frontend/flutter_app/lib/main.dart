import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const CocoonApp());
}

class CocoonApp extends StatelessWidget {
  const CocoonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cocoon — A Safer Place for What Matters',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF7FAF8),
        fontFamily: 'Inter',
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF0F382C),
          secondary: Color(0xFF607A70),
          surface: Colors.white,
          background: Color(0xFFF7FAF8),
          onSurface: Color(0xFF1E2925),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Color(0xFFE8EEEC), width: 1),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFF0F4F2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF0F382C), width: 1.5),
          ),
          labelStyle: const TextStyle(color: Color(0xFF66716F)),
        ),
      ),
      home: const AppRootNavigator(),
    );
  }
}

class DocumentItem {
  final String? id;
  final String title;
  final String category;
  final String owner;
  final String expiryDate;
  final String status;
  final String content;
  final String fileSize;
  final List<String> tags;
  final String? createdAt;

  DocumentItem({
    this.id,
    required this.title,
    required this.category,
    required this.owner,
    required this.expiryDate,
    required this.status,
    required this.content,
    this.fileSize = 'PDF • 1.4 MB',
    required this.tags,
    this.createdAt,
  });

  factory DocumentItem.fromJson(Map<String, dynamic> json) {
    return DocumentItem(
      id: json['id'],
      title: json['title'] ?? '',
      category: json['category'] ?? 'Other',
      owner: json['owner'] ?? '',
      expiryDate: json['expiryDate'] ?? '',
      status: json['status'] ?? 'Valid',
      content: json['content'] ?? '',
      fileSize: json['fileSize'] ?? 'PDF • 1.4 MB',
      tags: json['tags'] != null ? List<String>.from(json['tags']) : [],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'category': category,
      'owner': owner,
      'expiryDate': expiryDate,
      'status': status,
      'content': content,
      'fileSize': fileSize,
      'tags': tags,
    };
  }
}

class AppRootNavigator extends StatefulWidget {
  const AppRootNavigator({super.key});

  @override
  State<AppRootNavigator> createState() => _AppRootNavigatorState();
}

class _AppRootNavigatorState extends State<AppRootNavigator> {
  bool _isLoggedIn = false;

  void _login() {
    setState(() {
      _isLoggedIn = true;
    });
  }

  void _logout() {
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoggedIn
        ? DashboardScreen(onLogout: _logout)
        : LoginScreen(onLoginSuccess: _login);
  }
}

// ==========================================
// 1. LOGIN SCREEN (100% Matching Login Mockup)
// ==========================================
class LoginScreen extends StatefulWidget {
  final VoidCallback onLoginSuccess;
  const LoginScreen({super.key, required this.onLoginSuccess});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController(text: 'satyam@docvault.com');
  final _passwordController = TextEditingController(text: 'password123');
  bool _rememberMe = true;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 900;

    return Scaffold(
      body: Stack(
        children: [
          // Background nature image for left hero
          Positioned.fill(
            child: Image.asset(
              'assets/bgLeaf.png',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(color: const Color(0xFFE5EBEA)),
            ),
          ),

          // Main Responsive Layout
          SafeArea(
            child: isDesktop
                ? Column(
                    children: [
                      // Top Navbar
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
                        child: Row(
                          children: [
                            Image.asset('assets/Logo1.png', height: 36),
                            const Spacer(),
                            TextButton(onPressed: () {}, child: const Text('Features', style: TextStyle(color: Color(0xFF1E2925), fontSize: 13))),
                            const SizedBox(width: 24),
                            TextButton(onPressed: () {}, child: const Text('Security', style: TextStyle(color: Color(0xFF1E2925), fontSize: 13))),
                            const SizedBox(width: 24),
                            TextButton(onPressed: () {}, child: const Text('About', style: TextStyle(color: Color(0xFF1E2925), fontSize: 13))),
                            const SizedBox(width: 28),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFDCE6E1),
                                foregroundColor: const Color(0xFF0F382C),
                                elevation: 0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              ),
                              onPressed: widget.onLoginSuccess,
                              child: const Text('Create an account', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                      ),

                      // Desktop Middle Body
                      Expanded(
                        child: Row(
                          children: [
                            // Left Hero Text Block
                            Expanded(
                              flex: 6,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 60),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'A SAFER PLACE\nFOR WHAT MATTERS',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 2,
                                        color: Color(0xFF4A5854),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(width: 40, height: 2.5, color: const Color(0xFF0F382C)),
                                    const SizedBox(height: 24),
                                    const Text(
                                      'Your documents.\nAlways within reach.',
                                      style: TextStyle(
                                        fontSize: 48,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFF0F382C),
                                        height: 1.1,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      'Ask your documents.\nDon\'t search for them.',
                                      style: TextStyle(fontSize: 18, color: Color(0xFF4A5854), height: 1.3),
                                    ),
                                    const SizedBox(height: 36),
                                    Row(
                                      children: [
                                        _buildFeatureBadge(Icons.verified_user_outlined, 'Secure'),
                                        const SizedBox(width: 20),
                                        _buildFeatureBadge(Icons.folder_open_outlined, 'Organized'),
                                        const SizedBox(width: 20),
                                        _buildFeatureBadge(Icons.cloud_outlined, 'Accessible\nAnywhere'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Right Floating Glass Form Card
                            Expanded(
                              flex: 5,
                              child: Center(
                                child: Container(
                                  constraints: const BoxConstraints(maxWidth: 420),
                                  margin: const EdgeInsets.only(right: 60),
                                  padding: const EdgeInsets.all(36),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.92),
                                    borderRadius: BorderRadius.circular(24),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.08),
                                        blurRadius: 30,
                                        offset: const Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: _buildLoginForm(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Desktop Footer
                      const Padding(
                        padding: EdgeInsets.only(bottom: 24),
                        child: Text('— A SAFER TOMORROW', style: TextStyle(fontSize: 11, letterSpacing: 1.5, color: Color(0xFF66716F), fontWeight: FontWeight.bold)),
                      ),
                    ],
                  )
                : Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 420),
                        padding: const EdgeInsets.all(28),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.94),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 24,
                            ),
                          ],
                        ),
                        child: _buildLoginForm(),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureBadge(IconData icon, String label) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Color(0xFFDCE6E1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFF0F382C), size: 20),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: Color(0xFF1E2925)),
        ),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/Logo1.png',
          height: 48,
          errorBuilder: (_, __, ___) => const Icon(Icons.shield, size: 48, color: Color(0xFF0F382C)),
        ),
        const SizedBox(height: 6),
        const Text(
          'Ask your documents. Don\'t search for them.',
          style: TextStyle(fontSize: 12, color: Color(0xFF66716F)),
        ),
        const SizedBox(height: 24),
        const Text(
          'Welcome back',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0F382C)),
        ),
        const SizedBox(height: 4),
        const Text('Sign in to your secure space.', style: TextStyle(fontSize: 13, color: Color(0xFF66716F))),
        const SizedBox(height: 20),

        // Email
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.email_outlined, size: 18, color: Color(0xFF66716F)),
            hintText: 'Email address',
          ),
        ),
        const SizedBox(height: 12),

        // Password
        TextField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock_outline, size: 18, color: Color(0xFF66716F)),
            suffixIcon: IconButton(
              icon: Icon(_obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined, size: 18),
              onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
            ),
            hintText: 'Password',
          ),
        ),
        const SizedBox(height: 8),

        // Remember me & Forgot Password
        Row(
          children: [
            Checkbox(
              value: _rememberMe,
              activeColor: const Color(0xFF0F382C),
              onChanged: (val) => setState(() => _rememberMe = val ?? true),
            ),
            const Text('Remember me', style: TextStyle(fontSize: 12, color: Color(0xFF4A5854))),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: const Text('Forgot password?', style: TextStyle(fontSize: 12, color: Color(0xFF0F382C), fontWeight: FontWeight.w600)),
            ),
          ],
        ),
        const SizedBox(height: 14),

        // Sign In Button
        SizedBox(
          width: double.infinity,
          height: 46,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F382C),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              elevation: 0,
            ),
            onPressed: widget.onLoginSuccess,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sign in', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward_rounded, size: 18),
              ],
            ),
          ),
        ),
        const SizedBox(height: 18),

        // Social Logins
        const Text('Or continue with', style: TextStyle(fontSize: 11, color: Color(0xFF899391))),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialBtn('G', Colors.red),
            const SizedBox(width: 14),
            _buildSocialBtn('M', Colors.blue),
            const SizedBox(width: 14),
            _buildSocialBtn('', Colors.black),
          ],
        ),
        const SizedBox(height: 18),

        // Create Account Link
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('New here? ', style: TextStyle(fontSize: 12, color: Color(0xFF66716F))),
            GestureDetector(
              onTap: widget.onLoginSuccess,
              child: const Text('Create an account', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF0F382C))),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Encryption Badge
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shield_outlined, size: 14, color: Color(0xFF607A70)),
            SizedBox(width: 6),
            Text(
              'Your data is end-to-end encrypted and always private.',
              style: TextStyle(fontSize: 10, color: Color(0xFF66716F)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialBtn(String label, Color color) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4F2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: color)),
      ),
    );
  }
}

// ==========================================
// 2. DASHBOARD SCREEN (100% Matching Dashboard Mockup)
// ==========================================
class DashboardScreen extends StatefulWidget {
  final VoidCallback onLogout;
  const DashboardScreen({super.key, required this.onLogout});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  static const String baseUrl = 'http://localhost:8080/api/v1';

  bool _isBackendConnected = false;
  bool _isLoading = true;
  List<DocumentItem> _documents = [];
  String _searchQuery = '';
  int _activeNavIndex = 0;

  @override
  void initState() {
    super.initState();
    _checkHealth();
    _fetchDocs();
  }

  Future<void> _checkHealth() async {
    try {
      final res = await http.get(Uri.parse('$baseUrl/health')).timeout(const Duration(seconds: 4));
      if (res.statusCode == 200) setState(() => _isBackendConnected = true);
    } catch (_) {
      setState(() => _isBackendConnected = false);
    }
  }

  Future<void> _fetchDocs() async {
    setState(() => _isLoading = true);
    try {
      final res = await http.get(Uri.parse('$baseUrl/documents')).timeout(const Duration(seconds: 5));
      if (res.statusCode == 200) {
        final List<dynamic> data = jsonDecode(res.body);
        setState(() {
          _documents = data.map((j) => DocumentItem.fromJson(j)).toList();
          _isLoading = false;
          _isBackendConnected = true;
        });
      }
    } catch (_) {
      setState(() {
        _isLoading = false;
        // Fallback default mockup items matching Example_dashbaord.png if backend loading
        _documents = [
          DocumentItem(title: 'Aadhar Card', category: 'Identity', owner: 'Satyam Diwakar', expiryDate: 'Permanent', status: 'Valid', content: 'Unique Identification Authority of India', fileSize: 'PDF • 1.2 MB', tags: ['identity']),
          DocumentItem(title: 'Insurance Policy', category: 'Insurance', owner: 'Satyam Diwakar', expiryDate: '2026-10-03', status: 'Valid', content: 'Car Comprehensive Coverage Policy', fileSize: 'PDF • 1.8 MB', tags: ['insurance']),
          DocumentItem(title: 'Degree Certificate', category: 'Education', owner: 'Satyam Diwakar', expiryDate: 'Permanent', status: 'Valid', content: 'Bachelor of Technology Degree', fileSize: 'PDF • 2.4 MB', tags: ['education']),
          DocumentItem(title: 'PAN Card', category: 'Identity', owner: 'Satyam Diwakar', expiryDate: 'Permanent', status: 'Valid', content: 'Income Tax Department Permanent Account Number', fileSize: 'PDF • 1.1 MB', tags: ['pan']),
        ];
      });
    }
  }

  Future<void> _addDocument(DocumentItem doc) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/documents'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(doc.toJson()),
      );
      if (res.statusCode == 201 || res.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('✓ Document saved to JSON file!'), backgroundColor: Color(0xFF0F382C)),
        );
        _fetchDocs();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e'), backgroundColor: Colors.redAccent),
      );
    }
  }

  void _showAddModal() {
    final titleCtrl = TextEditingController();
    final ownerCtrl = TextEditingController(text: 'Satyam Diwakar');
    final expiryCtrl = TextEditingController();
    final contentCtrl = TextEditingController();
    String category = 'Identity';

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Add Document to Vault'),
        content: SizedBox(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: titleCtrl, decoration: const InputDecoration(labelText: 'Title *')),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: category,
                decoration: const InputDecoration(labelText: 'Category'),
                items: ['Identity', 'Finance', 'Education', 'Health', 'Family', 'Other']
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (v) => category = v!,
              ),
              const SizedBox(height: 10),
              TextField(controller: ownerCtrl, decoration: const InputDecoration(labelText: 'Owner *')),
              const SizedBox(height: 10),
              TextField(controller: expiryCtrl, decoration: const InputDecoration(labelText: 'Expiry Date (e.g. 2028-12-31)')),
              const SizedBox(height: 10),
              TextField(controller: contentCtrl, decoration: const InputDecoration(labelText: 'Summary / Details')),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0F382C), foregroundColor: Colors.white),
            onPressed: () {
              if (titleCtrl.text.isEmpty) return;
              final d = DocumentItem(
                title: titleCtrl.text.trim(),
                category: category,
                owner: ownerCtrl.text.trim(),
                expiryDate: expiryCtrl.text.trim().isEmpty ? 'Permanent' : expiryCtrl.text.trim(),
                status: 'Valid',
                content: contentCtrl.text.trim(),
                tags: [category.toLowerCase()],
              );
              Navigator.pop(ctx);
              _addDocument(d);
            },
            child: const Text('Save Document'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // 1. LEFT SIDEBAR
          Container(
            width: 230,
            color: const Color(0xFFF7FAF8),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo Header
                Row(
                  children: [
                    Image.asset('assets/Logo1.png', height: 26),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 34, top: 2),
                  child: Text('Your life, securely with you', style: TextStyle(fontSize: 9, color: Color(0xFF66716F))),
                ),
                const SizedBox(height: 32),

                // Nav Items
                _buildNavItem(0, Icons.home_rounded, 'Home'),
                _buildNavItem(1, Icons.description_outlined, 'Documents'),
                _buildNavItem(2, Icons.people_outline_rounded, 'Family'),
                _buildNavItem(3, Icons.share_outlined, 'Shared'),
                _buildNavItem(4, Icons.auto_awesome_outlined, 'AI Assistant'),
                _buildNavItem(5, Icons.notifications_none_rounded, 'Reminders', badge: '2'),
                _buildNavItem(6, Icons.delete_outline_rounded, 'Trash'),

                const Spacer(),

                // Bottom Sidebar Card with Emblem Logo
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFE8EEEC)),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/logo0.png',
                        height: 52,
                        errorBuilder: (_, __, ___) => const Icon(Icons.spa_outlined, color: Color(0xFF607A70), size: 40),
                      ),
                      const SizedBox(height: 10),
                      const Text('A safer place\nfor what matters.', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFF1E2925))),
                      const SizedBox(height: 6),
                      Container(width: 24, height: 1.5, color: const Color(0xFF66716F)),
                      const SizedBox(height: 6),
                      const Text('Secure. Private.\nAlways with you.', textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: Color(0xFF66716F))),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Profile Footer
                InkWell(
                  onTap: widget.onLogout,
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 16,
                        backgroundColor: Color(0xFF607A70),
                        child: Text('SD', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(width: 8),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Satyam Diwakar', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          Text('Personal Account', style: TextStyle(fontSize: 10, color: Color(0xFF66716F))),
                        ],
                      ),
                      const Spacer(),
                      const Icon(Icons.chevron_right_rounded, size: 18, color: Color(0xFF66716F)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const VerticalDivider(width: 1, thickness: 1, color: Color(0xFFE8EEEC)),

          // 2. MAIN DASHBOARD CONTENT AREA
          Expanded(
            child: Column(
              children: [
                // Top Search & Status Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  color: Colors.white,
                  child: Row(
                    children: [
                      // Search Bar
                      Expanded(
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 480),
                          child: TextField(
                            onChanged: (v) => setState(() => _searchQuery = v),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.search_rounded, size: 18, color: Color(0xFF66716F)),
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Chip(label: Text('⌘ K', style: TextStyle(fontSize: 10)), padding: EdgeInsets.zero),
                              ),
                              hintText: 'Search anything...',
                              contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),

                      // Connection Status Indicator
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: _isBackendConnected ? const Color(0xFFE6F4EA) : const Color(0xFFFCE8E6),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(radius: 4, backgroundColor: _isBackendConnected ? Colors.green : Colors.red),
                            const SizedBox(width: 6),
                            Text(_isBackendConnected ? 'Backend Live' : 'Offline', style: TextStyle(fontSize: 11, color: _isBackendConnected ? Colors.green[800] : Colors.red[800])),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      IconButton(icon: const Icon(Icons.dark_mode_outlined, size: 20), onPressed: () {}),
                      Stack(
                        children: [
                          IconButton(icon: const Icon(Icons.notifications_none_outlined, size: 20), onPressed: () {}),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: CircleAvatar(radius: 4, backgroundColor: Colors.red[600]),
                          ),
                        ],
                      ),
                      IconButton(icon: const Icon(Icons.grid_view_rounded, size: 20), onPressed: () {}),
                    ],
                  ),
                ),
                const Divider(height: 1, thickness: 1, color: Color(0xFFE8EEEC)),

                // Scrollable Dashboard Body + Right Panel
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(28),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left Center Column
                        Expanded(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Greeting
                              const Text('Good evening, Satyam 👋', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFF0F382C))),
                              const SizedBox(height: 4),
                              const Text('Your documents are safe, organized, and always within reach.', style: TextStyle(fontSize: 13, color: Color(0xFF66716F))),
                              const SizedBox(height: 20),

                              // ASK COCOON HERO BANNER
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image: AssetImage('assets/carddbg.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Row(
                                          children: [
                                            Icon(Icons.auto_awesome_outlined, size: 16, color: Color(0xFF0F382C)),
                                            SizedBox(width: 6),
                                            Text('ASK COCOON', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.2, color: Color(0xFF0F382C))),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        const Text(
                                          'Find, understand, and\nmanage your documents — effortlessly.',
                                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0F382C), height: 1.2),
                                        ),
                                        const SizedBox(height: 18),

                                        // Input bar in banner
                                        Container(
                                          constraints: const BoxConstraints(maxWidth: 480),
                                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(30),
                                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10)],
                                          ),
                                          child: Row(
                                            children: [
                                              const Icon(Icons.attach_file_rounded, color: Color(0xFF66716F), size: 18),
                                              const SizedBox(width: 8),
                                              const Expanded(
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    hintText: 'Ask anything about your documents...',
                                                    border: InputBorder.none,
                                                    fillColor: Colors.transparent,
                                                    contentPadding: EdgeInsets.zero,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.all(8),
                                                decoration: const BoxDecoration(color: Color(0xFF0F382C), shape: BoxShape.circle),
                                                child: const Icon(Icons.send_rounded, color: Colors.white, size: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 14),

                                        // Chips
                                        Wrap(
                                          spacing: 8,
                                          runSpacing: 8,
                                          children: [
                                            _buildSuggestionChip('Find my PAN card'),
                                            _buildSuggestionChip('Which documents expire soon?'),
                                            _buildSuggestionChip('Show family documents'),
                                            _buildSuggestionChip('What do I need for a passport?'),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Positioned(
                                      right: 0,
                                      top: 0,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text('MORE', style: TextStyle(fontSize: 9, letterSpacing: 1.5, color: Color(0xFF4A5854), fontWeight: FontWeight.bold)),
                                          Text('THAN', style: TextStyle(fontSize: 9, letterSpacing: 1.5, color: Color(0xFF4A5854), fontWeight: FontWeight.bold)),
                                          Text('STORAGE', style: TextStyle(fontSize: 9, letterSpacing: 1.5, color: Color(0xFF4A5854), fontWeight: FontWeight.bold)),
                                          Text('A SAFER', style: TextStyle(fontSize: 9, letterSpacing: 1.5, color: Color(0xFF4A5854), fontWeight: FontWeight.bold)),
                                          Text('TOMORROW', style: TextStyle(fontSize: 9, letterSpacing: 1.5, color: Color(0xFF4A5854), fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),

                              // STAT CARDS ROW
                              Row(
                                children: [
                                  _buildStatCard('48', 'Total Documents', Icons.description_outlined, const Color(0xFFEAF4EE)),
                                  const SizedBox(width: 14),
                                  _buildStatCard('4', 'Shared with Family', Icons.people_outline_rounded, const Color(0xFFEBF3FA)),
                                  const SizedBox(width: 14),
                                  _buildStatCard('2', 'Expiring Soon', Icons.access_time_rounded, const Color(0xFFFDF0E6)),
                                  const SizedBox(width: 14),
                                  _buildStatCard('100%', 'Secure & Private', Icons.shield_outlined, const Color(0xFFF1EEF9)),
                                ],
                              ),
                              const SizedBox(height: 28),

                              // YOUR DOCUMENTS CATEGORIES
                              Row(
                                children: [
                                  const Text('Your Documents', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F382C))),
                                  const SizedBox(width: 4),
                                  const Icon(Icons.chevron_right_rounded, size: 18, color: Color(0xFF0F382C)),
                                  const Spacer(),
                                  TextButton(onPressed: () {}, child: const Text('See all >', style: TextStyle(fontSize: 12, color: Color(0xFF607A70)))),
                                ],
                              ),
                              const SizedBox(height: 12),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    _buildCategoryCard('Identity', '12 documents', Icons.badge_outlined, const Color(0xFFEEF2FF)),
                                    _buildCategoryCard('Finance', '8 documents', Icons.bar_chart_rounded, const Color(0xFFE0F2FE)),
                                    _buildCategoryCard('Education', '6 documents', Icons.school_outlined, const Color(0xFFECFDF5)),
                                    _buildCategoryCard('Health', '5 documents', Icons.favorite_outline_rounded, const Color(0xFFFEF2F2)),
                                    _buildCategoryCard('Family', '7 documents', Icons.group_outlined, const Color(0xFFF0FDF4)),
                                    _buildCategoryCard('Other', '10 documents', Icons.folder_zip_outlined, const Color(0xFFF5F5F5)),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 28),

                              // RECENTLY ADDED SECTION
                              Row(
                                children: [
                                  const Text('Recently Added', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F382C))),
                                  const SizedBox(width: 4),
                                  const Icon(Icons.chevron_right_rounded, size: 18, color: Color(0xFF0F382C)),
                                  const Spacer(),
                                  ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF0F382C),
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    ),
                                    onPressed: _showAddModal,
                                    icon: const Icon(Icons.add, size: 16),
                                    label: const Text('Upload Document', style: TextStyle(fontSize: 12)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),

                              // Documents list grid
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 2.2,
                                  crossAxisSpacing: 14,
                                  mainAxisSpacing: 14,
                                ),
                                itemCount: _documents.length,
                                itemBuilder: (context, index) {
                                  final doc = _documents[index];
                                  return Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(color: const Color(0xFFE8EEEC)),
                                    ),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.asset(
                                            'assets/carddbg.png',
                                            width: 50,
                                            height: 60,
                                            fit: BoxFit.cover,
                                            errorBuilder: (_, __, ___) => Container(width: 50, color: const Color(0xFFE5EBEA), child: const Icon(Icons.description, color: Color(0xFF0F382C))),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(doc.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13), maxLines: 1, overflow: TextOverflow.ellipsis),
                                              const SizedBox(height: 2),
                                              Text(doc.fileSize, style: const TextStyle(fontSize: 11, color: Color(0xFF66716F))),
                                              const SizedBox(height: 4),
                                              Text('Added 2 hours ago', style: const TextStyle(fontSize: 10, color: Color(0xFF899391))),
                                            ],
                                          ),
                                        ),
                                        const Icon(Icons.more_vert_rounded, size: 16, color: Color(0xFF66716F)),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 24),

                        // RIGHT SIDEBAR PANEL
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Security Status Card
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: const Color(0xFFE8EEEC)),
                                ),
                                child: const Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Color(0xFFEAF4EE),
                                      child: Icon(Icons.shield_outlined, color: Colors.green, size: 20),
                                    ),
                                    SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Security Status', style: TextStyle(fontSize: 11, color: Color(0xFF66716F))),
                                          Text('Protected', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.green)),
                                        ],
                                      ),
                                    ),
                                    Icon(Icons.chevron_right_rounded, color: Color(0xFF66716F)),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Expiring Soon Card
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: const Color(0xFFE8EEEC)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      children: [
                                        Icon(Icons.access_time_rounded, color: Colors.orange, size: 18),
                                        SizedBox(width: 8),
                                        Text('2 Documents Expiring Soon', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                                        Spacer(),
                                        Icon(Icons.chevron_right_rounded, color: Color(0xFF66716F)),
                                      ],
                                    ),
                                    const SizedBox(height: 14),
                                    _buildExpiringItem('Passport', 'Expires in 45 days'),
                                    const Divider(height: 16, thickness: 0.5),
                                    _buildExpiringItem('Driving Licence', 'Expires in 68 days'),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Family Members
                              Row(
                                children: [
                                  const Text('Family', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                  const Spacer(),
                                  TextButton(onPressed: () {}, child: const Text('See all', style: TextStyle(fontSize: 11, color: Color(0xFF607A70)))),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildFamilyMember('Mom', '4 shared'),
                                  _buildFamilyMember('Dad', '6 shared'),
                                  _buildFamilyMember('Brother', '2 shared'),
                                  _buildAddMember(),
                                ],
                              ),
                              const SizedBox(height: 24),

                              // Bottom Right Motto Banner
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      'assets/right_bottom.png',
                                      height: 180,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) => Container(height: 180, color: const Color(0xFF0F382C)),
                                    ),
                                    Container(
                                      height: 180,
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [Colors.transparent, Colors.black.withOpacity(0.75)],
                                        ),
                                      ),
                                      child: const Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Important\ntoday. Priceless\ntomorrow.', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15, height: 1.2)),
                                          SizedBox(height: 6),
                                          Text('Cocoon keeps\nwhat matters, close.', style: TextStyle(color: Colors.white70, fontSize: 11)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label, {String? badge}) {
    final isActive = _activeNavIndex == index;
    return InkWell(
      onTap: () => setState(() => _activeNavIndex = index),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.only(bottom: 4),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFDCE6E1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: isActive ? const Color(0xFF0F382C) : const Color(0xFF66716F)),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                color: isActive ? const Color(0xFF0F382C) : const Color(0xFF4A5854),
              ),
            ),
            if (badge != null) ...[
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: const BoxDecoration(color: Color(0xFFDCE6E1), shape: BoxShape.circle),
                child: Text(badge, style: const TextStyle(color: Color(0xFF0F382C), fontSize: 10, fontWeight: FontWeight.bold)),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestionChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: const TextStyle(fontSize: 11, color: Color(0xFF0F382C), fontWeight: FontWeight.w500)),
    );
  }

  Widget _buildStatCard(String count, String label, IconData icon, Color bg) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Icon(icon, size: 22, color: const Color(0xFF0F382C)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(count, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F382C))),
                      const Spacer(),
                      const Icon(Icons.chevron_right_rounded, size: 16, color: Color(0xFF66716F)),
                    ],
                  ),
                  Text(label, style: const TextStyle(fontSize: 10, color: Color(0xFF4A5854)), maxLines: 1, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, String subtitle, IconData icon, Color bg) {
    return Container(
      width: 130,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFE8EEEC))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(10)), child: Icon(icon, size: 18, color: const Color(0xFF0F382C))),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          Text(subtitle, style: const TextStyle(fontSize: 10, color: Color(0xFF899391))),
        ],
      ),
    );
  }

  Widget _buildExpiringItem(String title, String expiry) {
    return Row(
      children: [
        const Icon(Icons.insert_drive_file_outlined, size: 16, color: Color(0xFF66716F)),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              Text(expiry, style: const TextStyle(fontSize: 10, color: Colors.orange)),
            ],
          ),
        ),
        const Icon(Icons.more_vert_rounded, size: 16, color: Color(0xFF66716F)),
      ],
    );
  }

  Widget _buildFamilyMember(String name, String shared) {
    return Column(
      children: [
        const CircleAvatar(radius: 18, backgroundColor: Color(0xFFDCE6E1), child: Icon(Icons.person, size: 18, color: Color(0xFF0F382C))),
        const SizedBox(height: 4),
        Text(name, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
        Text(shared, style: const TextStyle(fontSize: 9, color: Color(0xFF899391))),
      ],
    );
  }

  Widget _buildAddMember() {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(border: Border.all(color: const Color(0xFF0F382C)), shape: BoxShape.circle),
          child: const Icon(Icons.add, size: 18, color: Color(0xFF0F382C)),
        ),
        const SizedBox(height: 4),
        const Text('Add', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
        const Text('member', style: TextStyle(fontSize: 9, color: Color(0xFF899391))),
      ],
    );
  }
}
