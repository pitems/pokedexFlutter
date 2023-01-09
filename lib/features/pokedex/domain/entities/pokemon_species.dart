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
    this.evolvesFromSpecies,
    required this.flavorTextEntries,
    required this.genderRate,
    required this.genera,
    required this.growthRate,
    required this.hatchCounter,
    required this.id,
    required this.isBaby,
    required this.isLegendary,
    required this.isMythical,
    required this.name,
    required this.order,
    required this.shape,
  });

  final int baseHappiness;
  final int captureRate;
  final Color color;
  final List<EggGroups> eggGroups;
  final EvolutionChain evolutionChain;
  final EvolvesFromSpecies? evolvesFromSpecies;
  final List<FlavorTextEntries> flavorTextEntries;
  final int genderRate;
  final List<Genera> genera;
  final GrowthRate growthRate;
  final int hatchCounter;
  final int id;
  final bool isBaby;
  final bool isLegendary;
  final bool isMythical;
  final String name;
  final int order;
  final Shape shape;

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
        'evolves_from_species': evolvesFromSpecies,
        'flavor_text_entries': flavorTextEntries,
        'gender_rate': genderRate,
        'genera': genera,
        'growth_rate': growthRate,
        'hatch_counter': hatchCounter,
        'id': id,
        'is_baby': isBaby,
        'is_legendary': isLegendary,
        'is_mythical': isMythical,
        'name': name,
        'order': order,
        'shape': shape,
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

class EvolvesFromSpecies {
  const EvolvesFromSpecies({
    required this.name,
    required this.url,
  });

  factory EvolvesFromSpecies.fromJson(Map<String, dynamic> json) => EvolvesFromSpecies(
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

class FlavorTextEntries {
  const FlavorTextEntries({
    required this.flavorText,
    required this.language,
    required this.version,
  });

  factory FlavorTextEntries.fromJson(Map<String, dynamic> json) => FlavorTextEntries(
        flavorText: asT<String>(json['flavor_text'])!,
        language: Languages.fromJson(asT<Map<String, dynamic>>(json['language'])!),
        version: Version.fromJson(asT<Map<String, dynamic>>(json['version'])!),
      );

  final String flavorText;
  final Languages language;
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

class Languages {
  const Languages({
    required this.name,
    required this.url,
  });

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
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
        language: Language.fromJson(asT<Map<String, dynamic>>(json['language'])!),
      );

  final String genus;
  final Language language;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'genus': genus,
        'language': language,
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
