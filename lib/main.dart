import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nerdy_health/routing/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: NerdyHealth(),
    ),
  );
}

class NerdyHealth extends ConsumerStatefulWidget {
  const NerdyHealth({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NerdyHealthState();
}

class _NerdyHealthState extends ConsumerState<NerdyHealth> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NerdyHealth',
      routerConfig: ref.watch(goRouterProvider),
      debugShowCheckedModeBanner: true,
    );
  }
}