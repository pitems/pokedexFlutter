import 'package:pokedex/features/pokedex/domain/entities/pokemon_species.dart';

class PokemonSpeciesModel extends PokemonSpecies {
  PokemonSpeciesModel(
      {required int baseHappiness,
      required int captureRate,
      required Color color,
      required List<EggGroups> eggGroups,
      required EvolutionChain evolutionChain,
      required List<FlavorTextEntries> flavorTextEntries,
      required int genderRate,
      required List<Genera> genera,
      required GrowthRate growthRate,
      required int hatchCounter,
      required int id,
      required bool isBaby,
      required bool isLegendary,
      required bool isMythical,
      required String name,
      required int order,
      required Shape shape,
      EvolvesFromSpecies? evolvesFromSpecies})
      : super(
            baseHappiness: baseHappiness,
            captureRate: captureRate,
            color: color,
            eggGroups: eggGroups,
            evolutionChain: evolutionChain,
            flavorTextEntries: flavorTextEntries,
            genderRate: genderRate,
            genera: genera,
            growthRate: growthRate,
            hatchCounter: hatchCounter,
            id: id,
            isBaby: isBaby,
            isLegendary: isLegendary,
            isMythical: isMythical,
            name: name,
            order: order,
            shape: shape,
            evolvesFromSpecies: evolvesFromSpecies);
  factory PokemonSpeciesModel.fromJson(Map<String, dynamic> json) {
    final List<EggGroups>? eggGroups = json['egg_groups'] is List ? <EggGroups>[] : null;
    if (eggGroups != null) {
      for (final dynamic item in json['egg_groups']!) {
        if (item != null) {
          tryCatch(() {
            eggGroups.add(EggGroups.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }

    final List<FlavorTextEntries>? flavorTextEntries =
        json['flavor_text_entries'] is List ? <FlavorTextEntries>[] : null;
    if (flavorTextEntries != null) {
      for (final dynamic item in json['flavor_text_entries']!) {
        if (item != null) {
          tryCatch(() {
            flavorTextEntries.add(FlavorTextEntries.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }

    final List<Genera>? genera = json['genera'] is List ? <Genera>[] : null;
    if (genera != null) {
      for (final dynamic item in json['genera']!) {
        if (item != null) {
          tryCatch(() {
            genera.add(Genera.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }
    return PokemonSpeciesModel(
      baseHappiness: asT<int>(json['base_happiness'])!,
      captureRate: asT<int>(json['capture_rate'])!,
      color: Color.fromJson(asT<Map<String, dynamic>>(json['color'])!),
      eggGroups: eggGroups!,
      evolutionChain: EvolutionChain.fromJson(asT<Map<String, dynamic>>(json['evolution_chain'])!),
      evolvesFromSpecies: json['evolves_from_species'] == null
          ? null
          : EvolvesFromSpecies.fromJson(asT<Map<String, dynamic>>(json['evolves_from_species'])!),
      flavorTextEntries: flavorTextEntries!,
      genderRate: asT<int>(json['gender_rate'])!,
      genera: genera!,
      growthRate: GrowthRate.fromJson(asT<Map<String, dynamic>>(json['growth_rate'])!),
      hatchCounter: asT<int>(json['hatch_counter'])!,
      id: asT<int>(json['id'])!,
      isBaby: asT<bool>(json['is_baby'])!,
      isLegendary: asT<bool>(json['is_legendary'])!,
      isMythical: asT<bool>(json['is_mythical'])!,
      name: asT<String>(json['name'])!,
      order: asT<int>(json['order'])!,
      shape: Shape.fromJson(asT<Map<String, dynamic>>(json['shape'])!),
    );
  }
}
