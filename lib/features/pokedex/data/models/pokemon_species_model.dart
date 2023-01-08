import 'package:pokedex/features/pokedex/domain/entities/pokemon_species.dart';

class PokemonSpeciesModel extends PokemonSpecies {
  PokemonSpeciesModel(
      {required int baseHappiness,
      required int captureRate,
      required Color color,
      required List<EggGroups> eggGroups,
      required EvolutionChain evolutionChain,
      required List<FlavorTextEntries> flavorTextEntries,
      required List<Object> formDescriptions,
      required bool formsSwitchable,
      required int genderRate,
      required List<Genera> genera,
      required Generation generation,
      required GrowthRate growthRate,
      required Habitat habitat,
      required bool hasGenderDifferences,
      required int hatchCounter,
      required int id,
      required bool isBaby,
      required bool isLegendary,
      required bool isMythical,
      required String name,
      required List<Names> names,
      required int order,
      required List<PalParkEncounters> palParkEncounters,
      required List<PokedexNumbers> pokedexNumbers,
      required Shape shape,
      required List<Varieties> varieties})
      : super(
            baseHappiness: baseHappiness,
            captureRate: captureRate,
            color: color,
            eggGroups: eggGroups,
            evolutionChain: evolutionChain,
            flavorTextEntries: flavorTextEntries,
            formDescriptions: formDescriptions,
            formsSwitchable: formsSwitchable,
            genderRate: genderRate,
            genera: genera,
            generation: generation,
            growthRate: growthRate,
            habitat: habitat,
            hasGenderDifferences: hasGenderDifferences,
            hatchCounter: hatchCounter,
            id: id,
            isBaby: isBaby,
            isLegendary: isLegendary,
            isMythical: isMythical,
            name: name,
            names: names,
            order: order,
            palParkEncounters: palParkEncounters,
            pokedexNumbers: pokedexNumbers,
            shape: shape,
            varieties: varieties);

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

    final List<Object>? formDescriptions = json['form_descriptions'] is List ? <Object>[] : null;
    if (formDescriptions != null) {
      for (final dynamic item in json['form_descriptions']!) {
        if (item != null) {
          tryCatch(() {
            formDescriptions.add(asT<Object>(item)!);
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

    final List<Names>? names = json['names'] is List ? <Names>[] : null;
    if (names != null) {
      for (final dynamic item in json['names']!) {
        if (item != null) {
          tryCatch(() {
            names.add(Names.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }

    final List<PalParkEncounters>? palParkEncounters =
        json['pal_park_encounters'] is List ? <PalParkEncounters>[] : null;
    if (palParkEncounters != null) {
      for (final dynamic item in json['pal_park_encounters']!) {
        if (item != null) {
          tryCatch(() {
            palParkEncounters.add(PalParkEncounters.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }

    final List<PokedexNumbers>? pokedexNumbers =
        json['pokedex_numbers'] is List ? <PokedexNumbers>[] : null;
    if (pokedexNumbers != null) {
      for (final dynamic item in json['pokedex_numbers']!) {
        if (item != null) {
          tryCatch(() {
            pokedexNumbers.add(PokedexNumbers.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }

    final List<Varieties>? varieties = json['varieties'] is List ? <Varieties>[] : null;
    if (varieties != null) {
      for (final dynamic item in json['varieties']!) {
        if (item != null) {
          tryCatch(() {
            varieties.add(Varieties.fromJson(asT<Map<String, dynamic>>(item)!));
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
      flavorTextEntries: flavorTextEntries!,
      formDescriptions: formDescriptions!,
      formsSwitchable: asT<bool>(json['forms_switchable'])!,
      genderRate: asT<int>(json['gender_rate'])!,
      genera: genera!,
      generation: Generation.fromJson(asT<Map<String, dynamic>>(json['generation'])!),
      growthRate: GrowthRate.fromJson(asT<Map<String, dynamic>>(json['growth_rate'])!),
      habitat: Habitat.fromJson(asT<Map<String, dynamic>>(json['habitat'])!),
      hasGenderDifferences: asT<bool>(json['has_gender_differences'])!,
      hatchCounter: asT<int>(json['hatch_counter'])!,
      id: asT<int>(json['id'])!,
      isBaby: asT<bool>(json['is_baby'])!,
      isLegendary: asT<bool>(json['is_legendary'])!,
      isMythical: asT<bool>(json['is_mythical'])!,
      name: asT<String>(json['name'])!,
      names: names!,
      order: asT<int>(json['order'])!,
      palParkEncounters: palParkEncounters!,
      pokedexNumbers: pokedexNumbers!,
      shape: Shape.fromJson(asT<Map<String, dynamic>>(json['shape'])!),
      varieties: varieties!,
    );
  }
}
