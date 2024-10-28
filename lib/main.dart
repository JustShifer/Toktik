import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          /* Con lazy: false, evita la carga perezosa, lo que significa que no va a tener que esperar que sea necesario llamar
           el provider para poder tener las paginas cargadas, en otras palabras es como tener un metodo asincrono
           que cargara el provider aunque no lo estemos llamando en ese momento y asi estara preparado*/
          lazy: false,
          create: (_) => DiscoverProvider()..loadingNextPage())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        title: 'TokTik',
        home: const DiscoverScreen()
      ),
    );
  }
}