import 'package:pokeapp/app/modules/home/models/pokemon_detail.model.dart';
import 'package:pokeapp/app/modules/home/models/pokemon_model.dart';
import 'package:pokeapp/app/shared/services/service_interface.dart';

abstract class IPokemonService implements IService<PokemonModel> {
  Future<PokemonDetailsModel> getByName(String name);
}
