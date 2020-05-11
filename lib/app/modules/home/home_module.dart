import 'package:pokeapp/app/modules/home/pages/pokemon/pokemon_controller.dart';
import 'package:dio/dio.dart';
import 'package:pokeapp/app/modules/home/pages/pokemon/pokemon_page.dart';
import 'package:pokeapp/app/modules/home/repositories/pokemon_repository_interface.dart';
import 'package:pokeapp/app/modules/home/services/pokemon_service.dart';
import 'package:pokeapp/app/modules/home/repositories/pokemon_repository.dart';
import 'package:pokeapp/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokeapp/app/modules/home/home_page.dart';
import 'package:pokeapp/app/modules/home/services/pokemon_service_interface.dart';
import 'package:pokeapp/app/shared/configs/api.dart';
import 'package:pokeapp/app/shared/constants/api.dart';
import 'package:pokeapp/app/shared/constants/routes.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PokemonController(i.get<IPokemonService>())),
        Bind((i) => PokemonService(i.get<IPokemonRepository>())),
        Bind((i) => PokemonRepository()),
        Bind((i) => HomeController(i.get<IPokemonService>())),
        Bind((i) => Api(i.get<Dio>(), URL_BASE)),
        Bind((i) => Dio()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router('/$POKEMON_ROUTE', child: (_, arg) => PokemonPage(paramets: arg.data)),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
