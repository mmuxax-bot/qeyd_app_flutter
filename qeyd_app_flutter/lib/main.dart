import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(const QeydApp());

class QeydApp extends StatelessWidget {
  const QeydApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qeyd App',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF03111E),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFDAB873),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    )..repeat(reverse: true);
    _fade = Tween<double>(begin: .62, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        PageRouteBuilder<void>(
          transitionDuration: const Duration(milliseconds: 650),
          pageBuilder: (_, animation, __) => FadeTransition(
            opacity: animation,
            child: const HomePage(),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0, -.35),
                radius: 1.15,
                colors: [Color(0xFF123653), Color(0xFF061827), Color(0xFF020A12)],
              ),
            ),
          ),
          CustomPaint(painter: MosquePainter()),
          SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 2),
                FadeTransition(
                  opacity: _fade,
                  child: const AppEmblem(size: 130),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Qeyd App',
                  style: TextStyle(
                    fontFamily: 'serif',
                    fontSize: 39,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .5,
                    color: Color(0xFFF5E6C8),
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 42, child: Divider(color: Color(0xFFB9965C))),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('K İ T A B L A R', style: TextStyle(color: Color(0xFFDAB873), letterSpacing: 5)),
                    ),
                    SizedBox(width: 42, child: Divider(color: Color(0xFFB9965C))),
                  ],
                ),
                const SizedBox(height: 35),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 42),
                  child: Text(
                    'Biliklərini oxu, qeydlərini saxla və istədiyin zaman yenidən nəzərdən keçir.',
                    textAlign: TextAlign.center,
                    style: TextStyle(height: 1.7, color: Color(0xFFC9D1D7), fontSize: 14),
                  ),
                ),
                const Spacer(),
                const SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Color(0xFFDAB873),
                    backgroundColor: Color(0xFF344453),
                  ),
                ),
                const SizedBox(height: 14),
                const Text('Yüklənir...', style: TextStyle(color: Color(0xFFD6DCE1))),
                const Spacer(),
                const Text('QEYD APP', style: TextStyle(color: Color(0xFF9CACB8), letterSpacing: 3, fontSize: 11)),
                const SizedBox(height: 22),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppEmblem extends StatelessWidget {
  const AppEmblem({super.key, this.size = 90});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: const Color(0xD9071A29),
        borderRadius: BorderRadius.circular(size * .26),
        border: Border.all(color: const Color(0xFFDAB873), width: 2),
        boxShadow: const [BoxShadow(color: Color(0x443AC4FF), blurRadius: 32)],
      ),
      child: Icon(Icons.auto_stories_rounded, size: size * .5, color: const Color(0xFFF1D59C)),
    );
  }
}

class MosquePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0x25000000);
    final path = Path()
      ..moveTo(0, size.height * .73)
      ..lineTo(size.width * .18, size.height * .67)
      ..quadraticBezierTo(size.width * .26, size.height * .55, size.width * .34, size.height * .67)
      ..lineTo(size.width * .48, size.height * .67)
      ..quadraticBezierTo(size.width * .62, size.height * .47, size.width * .76, size.height * .67)
      ..lineTo(size.width, size.height * .61)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final pages = const [BooksView(), Center(child: Text('Əlfəcinlər')), Center(child: Text('Axtarış')), Center(child: Text('Ayarlar'))];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Row(children: [AppEmblem(size: 38), SizedBox(width: 12), Text('Qeyd App', style: TextStyle(fontFamily: 'serif'))]),
        actions: [IconButton(onPressed: () => setState(() => index = 2), icon: const Icon(Icons.search))],
      ),
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() => index = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.menu_book_outlined), selectedIcon: Icon(Icons.menu_book), label: 'Kitablar'),
          NavigationDestination(icon: Icon(Icons.bookmark_border), selectedIcon: Icon(Icons.bookmark), label: 'Əlfəcinlər'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Axtarış'),
          NavigationDestination(icon: Icon(Icons.settings_outlined), label: 'Ayarlar'),
        ],
      ),
    );
  }
}

class BooksView extends StatelessWidget {
  const BooksView({super.key});

  @override
  Widget build(BuildContext context) {
    const books = [
      ('Riyazus-Salihin', 'Fəsillər və qeydlər', Icons.auto_stories),
      ('Seçilmiş qeydlər', 'Şəxsi qeyd dəftəri', Icons.edit_note),
      ('Oxu siyahısı', 'Sonra oxumaq üçün', Icons.library_books),
    ];
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFF163A54), Color(0xFF6B4826)]),
            borderRadius: BorderRadius.circular(22),
          ),
          child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('“Bilik qəlbin işığıdır.”', style: TextStyle(fontFamily: 'serif', fontSize: 23, color: Color(0xFFFFE5B1))),
            SizedBox(height: 8),
            Text('Oxu, qeyd et və yadda saxla.', style: TextStyle(color: Color(0xFFD3DDE4))),
          ]),
        ),
        const SizedBox(height: 26),
        const Text('Kitablar', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700)),
        const SizedBox(height: 10),
        ...books.map((book) => Card(
          color: const Color(0xFF0B2031),
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: Container(
              width: 52,
              height: 66,
              decoration: BoxDecoration(color: const Color(0xFF4A3520), borderRadius: BorderRadius.circular(8)),
              child: Icon(book.$3, color: const Color(0xFFDAB873)),
            ),
            title: Text(book.$1),
            subtitle: Text(book.$2),
            trailing: const Icon(Icons.chevron_right),
          ),
        )),
      ],
    );
  }
}
