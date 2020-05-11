
import 'package:pokeapp/app/modules/home/models/pokemon_detail.model.dart';
import 'package:pokeapp/app/modules/home/models/pokemon_model.dart';
import 'package:pokeapp/app/shared/repositories/repository_interface.dart';

abstract class IPokemonRepository implements IRepository<PokemonModel> {
   Future<PokemonDetailsModel> getByName(String name);
}
