import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final discoverProvider = context.watch<DiscoverProvider>();

    return  Scaffold(
      //verificamos si estan cargando videos para mostrar un circulo de carga
      body: discoverProvider.initialLoading
      ? const Center(child:CircularProgressIndicator(strokeWidth: 2,),)
      : VideoScrollableView(videos: discoverProvider.videos)
    );
  }
}