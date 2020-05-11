import 'package:mobx/mobx.dart';
import 'package:pokeapp/app/modules/home/models/pokemon_detail.model.dart';
import 'package:pokeapp/app/modules/home/services/pokemon_service.dart';

part 'pokemon_controller.g.dart';

class PokemonController = _PokemonControllerBase with _$PokemonController;

abstract class _PokemonControllerBase with Store {
  PokemonService _service;

  @observable
  PokemonDetailsModel pokemon;


  _PokemonControllerBase(this._service);

  getDataPokemon(String name){
    this._service.getByName(name).then((value) => {
      this.pokemon = value,
    });
  }
}
