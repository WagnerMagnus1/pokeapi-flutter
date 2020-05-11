import 'package:pokeapp/app/modules/home/models/pokemon_detail.model.dart';
import 'package:pokeapp/app/modules/home/models/pokemon_model.dart';
import 'package:pokeapp/app/modules/home/repositories/pokemon_repository_interface.dart';
import 'package:pokeapp/app/modules/home/services/pokemon_service_interface.dart';

class PokemonService implements IPokemonService {
  final IPokemonRepository _repository;

  PokemonService(this._repository);

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future<List<PokemonModel>> getAll(int offset, int limit) async {
    List<PokemonModel> listPokemons = [];
    try {
      listPokemons =
          await _repository.getAll(offset.toString(), limit.toString());
    } catch (err) {
      print(err);
    }
    return listPokemons;
  }

  @override
  Future delete(key) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<PokemonModel> saveOrUpdate(PokemonModel dto) {
    // TODO: implement saveOrUpdate
    throw UnimplementedError();
  }

  @override
  Future<List<PokemonModel>> sync(bool getOrPost) {
    // TODO: implement sync
    throw UnimplementedError();
  }

  @override
  Future<PokemonDetailsModel> getByName(String name) async {
     PokemonDetailsModel pokemon;
    try {
      pokemon = await _repository.getByName(name);
    } catch (err) {
      print(err);
    }
    return pokemon;
  }

}
