import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokeapp/app/modules/home/models/pokemon_detail.model.dart';
import 'package:pokeapp/app/modules/home/models/pokemon_model.dart';
import 'package:pokeapp/app/modules/home/repositories/pokemon_repository_interface.dart';
import 'package:pokeapp/app/shared/configs/api.dart';

class PokemonRepository implements IPokemonRepository {
  @override
  Future<List<PokemonModel>> getAll(String offset, String limit) async {
    List<PokemonModel> pokemon = List();

    final response = await Modular.get<Api>()
        .dio
        .get('pokemon/?offset=' + offset + '&limit=' + limit);

    if (response.statusCode == 200) {
      for (var json in response.data['results']) {
        final data = jsonToModel(json);
        pokemon.add(data);
      }

      return pokemon;
    } else {
      throw Exception('${response.statusCode} - ${response.statusMessage}');
    }
  }

  @override
  Future delete(key) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future save(PokemonModel dto) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future update(key, PokemonModel dto) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<PokemonModel> getById(key) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<PokemonDetailsModel> getByName(String name) async {
    PokemonDetailsModel pokemon;

    final response = await Modular.get<Api>().dio.get('pokemon/' + name);

    if (response.statusCode == 200) {
        final data = jsonToPokemonDetailModel(response.data);
        pokemon = data;
      return pokemon;
    } else {
      throw Exception('${response.statusCode} - ${response.statusMessage}');
    }
  }

  static PokemonModel jsonToModel(Map<String, dynamic> json) {
    return PokemonModel(
      name: json['name'],
      url: json['url'],
    );
  }

  static Map<String, dynamic> jsonFromModel(PokemonModel model) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = model.name;
    data['url'] = model.url;
    return data;
  }

  static PokemonDetailsModel jsonToPokemonDetailModel(
      Map<String, dynamic> json) {
    return PokemonDetailsModel(
        name: json['name'],
        url: json['url'],
        baseExperience: json['base_experience'],
        height: json['height'],
        weight: json['weight'],
        order: json['order']);
  }
}
