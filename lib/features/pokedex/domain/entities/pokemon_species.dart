//Felipe Rudloff (9/03/2022)
import 'dart:convert';
import 'dart:developer';

void tryCatch(Function? f) {
  try {
    f?.call();
  } catch (e, stack) {
    log('$e');
    log('$stack');
  }
}

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class PokemonSpecies {
  const PokemonSpecies({
    required this.baseHappiness,
    required this.captureRate,
    required this.color,
    required this.eggGroups,
    required this.evolutionChain,
    required this.flavorTextEntries,
    required this.formDescriptions,
    required this.formsSwitchable,
    required this.genderRate,
    required this.genera,
    required this.generation,
    required this.growthRate,
    required this.habitat,
    required this.hasGenderDifferences,
    required this.hatchCounter,
    required this.id,
    required this.isBaby,
    required this.isLegendary,
    required this.isMythical,
    required this.name,
    required this.names,
    required this.order,
    required this.palParkEncounters,
    required this.pokedexNumbers,
    required this.shape,
    required this.varieties,
  });

  final int baseHappiness;
  final int captureRate;
  final Color color;
  final List<EggGroups> eggGroups;
  final EvolutionChain evolutionChain;
  final List<FlavorTextEntries> flavorTextEntries;
  final List<Object> formDescriptions;
  final bool formsSwitchable;
  final int genderRate;
  final List<Genera> genera;
  final Generation generation;
  final GrowthRate growthRate;
  final Habitat habitat;
  final bool hasGenderDifferences;
  final int hatchCounter;
  final int id;
  final bool isBaby;
  final bool isLegendary;
  final bool isMythical;
  final String name;
  final List<Names> names;
  final int order;
  final List<PalParkEncounters> palParkEncounters;
  final List<PokedexNumbers> pokedexNumbers;
  final Shape shape;
  final List<Varieties> varieties;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'base_happiness': baseHappiness,
        'capture_rate': captureRate,
        'color': color,
        'egg_groups': eggGroups,
        'evolution_chain': evolutionChain,
        'flavor_text_entries': flavorTextEntries,
        'form_descriptions': formDescriptions,
        'forms_switchable': formsSwitchable,
        'gender_rate': genderRate,
        'genera': genera,
        'generation': generation,
        'growth_rate': growthRate,
        'habitat': habitat,
        'has_gender_differences': hasGenderDifferences,
        'hatch_counter': hatchCounter,
        'id': id,
        'is_baby': isBaby,
        'is_legendary': isLegendary,
        'is_mythical': isMythical,
        'name': name,
        'names': names,
        'order': order,
        'pal_park_encounters': palParkEncounters,
        'pokedex_numbers': pokedexNumbers,
        'shape': shape,
        'varieties': varieties,
      };
}

class Color {
  const Color({
    required this.name,
    required this.url,
  });

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        name: asT<String>(json['name'])!,
        url: asT<String>(json['url'])!,
      );

  final String name;
  final String url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'url': url,
      };
}

class EggGroups {
  const EggGroups({
    required this.name,
    required this.url,
  });

  factory EggGroups.fromJson(Map<String, dynamic> json) => EggGroups(
        name: asT<String>(json['name'])!,
        url: asT<String>(json['url'])!,
      );

  final String name;
  final String url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'url': url,
      };
}

class EvolutionChain {
  const EvolutionChain({
    required this.url,
  });

  factory EvolutionChain.fromJson(Map<String, dynamic> json) => EvolutionChain(
        url: asT<String>(json['url'])!,
      );

  final String url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'url': url,
      };
}

class FlavorTextEntries {
  const FlavorTextEntries({
    required this.flavorText,
    required this.language,
    required this.version,
  });

  factory FlavorTextEntries.fromJson(Map<String, dynamic> json) => FlavorTextEntries(
        flavorText: asT<String>(json['flavor_text'])!,
        language: LanguageFlavor.fromJson(asT<Map<String, dynamic>>(json['language'])!),
        version: Version.fromJson(asT<Map<String, dynamic>>(json['version'])!),
      );

  final String flavorText;
  final LanguageFlavor language;
  final Version version;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'flavor_text': flavorText,
        'language': language,
        'version': version,
      };
}

class LanguageFlavor {
  const LanguageFlavor({
    required this.name,
    required this.url,
  });

  factory LanguageFlavor.fromJson(Map<String, dynamic> json) => LanguageFlavor(
        name: asT<String>(json['name'])!,
        url: asT<String>(json['url'])!,
      );

  final String name;
  final String url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'url': url,
      };
}

class Version {
  const Version({
    required this.name,
    required this.url,
  });

  factory Version.fromJson(Map<String, dynamic> json) => Version(
        name: asT<String>(json['name'])!,
        url: asT<String>(json['url'])!,
      );

  final String name;
  final String url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'url': url,
      };
}

class Genera {
  const Genera({
    required this.genus,
    required this.language,
  });

  factory Genera.fromJson(Map<String, dynamic> json) => Genera(
        genus: asT<String>(json['genus'])!,
        language: LanguageGenera.fromJson(asT<Map<String, dynamic>>(json['language'])!),
      );

  final String genus;
  final LanguageGenera language;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'genus': genus,
        'language': language,
      };
}

class LanguageGenera {
  const LanguageGenera({
    required this.name,
    required this.url,
  });

  factory LanguageGenera.fromJson(Map<String, dynamic> json) => LanguageGenera(
        name: asT<String>(json['name'])!,
        url: asT<String>(json['url'])!,
      );

  final String name;
  final String url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'url': url,
      };
}

class Generation {
  const Generation({
    required this.name,
    required this.url,
  });

  factory Generation.fromJson(Map<String, dynamic> json) => Generation(
        name: asT<String>(json['name'])!,
        url: asT<String>(json['url'])!,
      );

  final String name;
  final String url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'url': url,
      };
}

class GrowthRate {
  const GrowthRate({
    required this.name,
    required this.url,
  });

  factory GrowthRate.fromJson(Map<String, dynamic> json) => GrowthRate(
        name: asT<String>(json['name'])!,
        url: asT<String>(json['url'])!,
      );

  final String name;
  final String url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'url': url,
      };
}

class Habitat {
  const Habitat({
    required this.name,
    required this.url,
  });

  factory Habitat.fromJson(Map<String, dynamic> json) => Habitat(
        name: asT<String>(json['name'])!,
        url: asT<String>(json['url'])!,
      );

  final String name;
  final String url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'url': url,
      };
}

class Names {
  const Names({
    required this.language,
    required this.name,
  });

  factory Names.fromJson(Map<String, dynamic> json) => Names(
        language: Language.fromJson(asT<Map<String, dynamic>>(json['language'])!),
        name: asT<String>(json['name'])!,
      );

  final Language language;
  final String name;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'language': language,
        'name': name,
      };
}

class Language {
  const Language({
    required this.name,
    required this.url,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        name: asT<String>(json['name'])!,
        url: asT<String>(json['url'])!,
      );

  final String name;
  final String url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'url': url,
      };
}

class PalParkEncounters {
  const PalParkEncounters({
    required this.area,
    required this.baseScore,
    required this.rate,
  });

  factory PalParkEncounters.fromJson(Map<String, dynamic> json) => PalParkEncounters(
        area: Area.fromJson(asT<Map<String, dynamic>>(json['area'])!),
        baseScore: asT<int>(json['base_score'])!,
        rate: asT<int>(json['rate'])!,
      );

  final Area area;
  final int baseScore;
  final int rate;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'area': area,
        'base_score': baseScore,
        'rate': rate,
      };
}

class Area {
  const Area({
    required this.name,
    required this.url,
  });

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        name: asT<String>(json['name'])!,
        url: asT<String>(json['url'])!,
      );

  final String name;
  final String url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'url': url,
      };
}

class PokedexNumbers {
  const PokedexNumbers({
    required this.entryNumber,
    required this.pokedex,
  });

  factory PokedexNumbers.fromJson(Map<String, dynamic> json) => PokedexNumbers(
        entryNumber: asT<int>(json['entry_number'])!,
        pokedex: Pokedex.fromJson(asT<Map<String, dynamic>>(json['pokedex'])!),
      );

  final int entryNumber;
  final Pokedex pokedex;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'entry_number': entryNumber,
        'pokedex': pokedex,
      };
}

class Pokedex {
  const Pokedex({
    required this.name,
    required this.url,
  });

  factory Pokedex.fromJson(Map<String, dynamic> json) => Pokedex(
        name: asT<String>(json['name'])!,
        url: asT<String>(json['url'])!,
      );

  final String name;
  final String url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'url': url,
      };
}

class Shape {
  const Shape({
    required this.name,
    required this.url,
  });

  factory Shape.fromJson(Map<String, dynamic> json) => Shape(
        name: asT<String>(json['name'])!,
        url: asT<String>(json['url'])!,
      );

  final String name;
  final String url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'url': url,
      };
}

class Varieties {
  const Varieties({
    required this.isDefault,
    required this.pokemon,
  });

  factory Varieties.fromJson(Map<String, dynamic> json) => Varieties(
        isDefault: asT<bool>(json['is_default'])!,
        pokemon: Pokemon.fromJson(asT<Map<String, dynamic>>(json['pokemon'])!),
      );

  final bool isDefault;
  final Pokemon pokemon;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'is_default': isDefault,
        'pokemon': pokemon,
      };
}

class Pokemon {
  const Pokemon({
    required this.name,
    required this.url,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: asT<String>(json['name'])!,
        url: asT<String>(json['url'])!,
      );

  final String name;
  final String url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'url': url,
      };
}
