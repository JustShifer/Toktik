import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infracstructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier{

bool initialLoading = true;
List<VideoPost> videos = [];

Future<void> loadingNextPage() async{

//todo: Repository, Datasource

  await  Future.delayed(const Duration(seconds: 2));

  /* Creamos uan lista de tipo VideoPost que es la que posee la estructura de un video.
  Luego traemos la variable que contiene los videos llamada videoPost, esta variable es una lista de mapas
  pero necesitaremos transformarla a uan lista comun, por lo que usamos map() para recorrerla y 
  asignar la estructura json a el mapa para que agarre cada entdad dentro del json y cree un nuevo mapa
  a su vez le pasamos el toVideoPostEntity que posee los parametros a sen susttuidos y usados por nosotros
  despues se ser arregladas las asignaciones en cuanto a los nombren en dicho metodo */
  final List<VideoPost> newVideos = videoPosts.map(
    (video) => LocalVideoModel.fromJson(video).toVideoPostEntity()
  ).toList();

  videos.addAll(newVideos);
  initialLoading = false;

  notifyListeners();
}

}