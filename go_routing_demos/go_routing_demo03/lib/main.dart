import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(MyApp());

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/product/:id',
      name: 'product',
      builder: (context, state) {
        final String productId = state.pathParameters['id']!;
        final Map<String, String> queryParams = state.uri.queryParameters;
        return ProductDetailScreen(productId: productId, queryParams: queryParams);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Demo 03 – Named Routes',
      routerConfig: _router,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home (Named)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.pushNamed('product', pathParameters: {'id': '101'}, queryParameters: {'ref': 'named_nav'}),
              child: Text('View Product 101'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.pushNamed('product', pathParameters: {'id': '202'}, queryParameters: {'ref': 'second'}),
              child: Text('View Product 202'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final String productId;
  final Map<String, String> queryParams;

  const ProductDetailScreen({required this.productId, required this.queryParams});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product ID: $productId', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Query parameters:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...queryParams.entries.map((e) => Text('  • ${e.key} = ${e.value}')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => context.pop(), child: Text('Go Back')),
          ],
        ),
      ),
    );
  }
}