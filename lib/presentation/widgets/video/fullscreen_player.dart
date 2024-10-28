import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class FullscreenPlayer extends StatefulWidget {

  final String videoUrl;
  final String caption;

  const FullscreenPlayer({super.key, required this.videoUrl, required this.caption});

  @override
  State<FullscreenPlayer> createState() => _FullscreenPlayerState();
}

//Los StatefullWidget poseen un ciclo de vida, se le debe proporcionar un InitSatate para controlarlos
class _FullscreenPlayerState extends State<FullscreenPlayer> {

 late VideoPlayerController controller;

@override
//Iniciamos el ciclo
  void initState() {
    //se inicia el estado de la siguiente forma. NOTA: se debe colocar la inicialziacion al principio (recomendable)
    super.initState();
    //si queremos acceder a las variables del metodo del que extiende el Statefull se debe usar widget. para ello.
    controller = VideoPlayerController.asset(widget.videoUrl)
    ..setVolume(0)//esto es para quitarle el volumen a los videos.
    ..setLooping(true)//esto es para que se reproduzcan en loop o ciclo, que empiecen de nuevo solos.
    ..play();
  }

  @override
  //Destruimos el ciclo
  void dispose() {
    //Se limpia el controler antes de destruirlo para evitar que el video se siga reproduciendo aunque no lo veamos
    controller.dispose();
    //Se destruye o finaliza el estado de la siguiente forma. NOTA: se debe colocar la destruccion al final (recomendable)
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    /*retornamos un FutureBuilder que es un builder que va a estar pendiente del estado del video
     si esta listo para poder reproducirlo o si esta cargando para poner un circulito de carga*/
    return FutureBuilder(
      future: controller.initialize(),
      // El snapshot es el estado de este future
      builder: (context, snapshot) {
        return const Center(
          child: CircularProgressIndicator(strokeWidth: 2,),
        );
      },
    );
  }
}