import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(MyApp());

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final String productId = state.pathParameters['id']!;
        final Map<String, String> queryParams = state.uri.queryParameters;
        return ProductDetailScreen(
          productId: productId,
          queryParams: queryParams,
        );
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Demo 02 – Params',
      routerConfig: _router,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.push('/product/42?ref=homepage&campaign=spring'),
          child: Text('View Product 42'),
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