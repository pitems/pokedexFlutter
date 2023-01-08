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

class PokemonMove {
  const PokemonMove({
    this.accuracy,
    this.contestCombos,
    required this.contestEffect,
    required this.contestType,
    required this.damageClass,
    this.effectChance,
    required this.effectChanges,
    required this.effectEntries,
    required this.flavorTextEntries,
    required this.generation,
    required this.id,
    required this.learnedByPokemon,
    required this.machines,
    required this.meta,
    required this.name,
    required this.names,
    required this.pastValues,
    this.power,
    required this.pp,
    required this.priority,
    required this.statChanges,
    required this.superContestEffect,
    required this.target,
    required this.type,
  });

  final int? accuracy;
  final ContestCombos? contestCombos;
  final ContestEffect contestEffect;
  final ContestType contestType;
  final DamageClass damageClass;
  final int? effectChance;
  final List<Object> effectChanges;
  final List<EffectEntries> effectEntries;
  final List<FlavorTextEntries> flavorTextEntries;
  final Generation generation;
  final int id;
  final List<LearnedByPokemon> learnedByPokemon;
  final List<Machines> machines;
  final Meta meta;
  final String name;
  final List<Names> names;
  final List<Object> pastValues;
  final int? power;
  final int pp;
  final int priority;
  final List<Object> statChanges;
  final SuperContestEffect superContestEffect;
  final Target target;
  final Type type;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accuracy': accuracy,
        'contest_combos': contestCombos,
        'contest_effect': contestEffect,
        'contest_type': contestType,
        'damage_class': damageClass,
        'effect_chance': effectChance,
        'effect_changes': effectChanges,
        'effect_entries': effectEntries,
        'flavor_text_entries': flavorTextEntries,
        'generation': generation,
        'id': id,
        'learned_by_pokemon': learnedByPokemon,
        'machines': machines,
        'meta': meta,
        'name': name,
        'names': names,
        'past_values': pastValues,
        'power': power,
        'pp': pp,
        'priority': priority,
        'stat_changes': statChanges,
        'super_contest_effect': superContestEffect,
        'target': target,
        'type': type,
      };
}

class ContestCombos {
  const ContestCombos({
    this.normal,
    required this.super1673178815556738,
  });

  factory ContestCombos.fromJson(Map<String, dynamic> json) => ContestCombos(
        normal: json['normal'] == null
            ? null
            : Normal.fromJson(asT<Map<String, dynamic>>(json['normal'])!),
        super1673178815556738: Super.fromJson(asT<Map<String, dynamic>>(json['super'])!),
      );

  final Normal? normal;
  final Super super1673178815556738;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'normal': normal,
        'super': super1673178815556738,
      };
}

class Normal {
  const Normal({
    this.useAfter,
    this.useBefore,
  });

  factory Normal.fromJson(Map<String, dynamic> json) {
    final List<UseAfter>? useAfter = json['use_after'] is List ? <UseAfter>[] : null;
    if (useAfter != null) {
      for (final dynamic item in json['use_after']!) {
        if (item != null) {
          tryCatch(() {
            useAfter.add(UseAfter.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }
    return Normal(
      useAfter: useAfter,
      useBefore: asT<Object?>(json['use_before']),
    );
  }

  final List<UseAfter>? useAfter;
  final Object? useBefore;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'use_after': useAfter,
        'use_before': useBefore,
      };
}

class UseAfter {
  const UseAfter({
    required this.name,
    required this.url,
  });

  factory UseAfter.fromJson(Map<String, dynamic> json) => UseAfter(
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

class Super {
  const Super({
    this.useAfter,
    this.useBefore,
  });

  factory Super.fromJson(Map<String, dynamic> json) => Super(
        useAfter: asT<Object?>(json['use_after']),
        useBefore: asT<Object?>(json['use_before']),
      );

  final Object? useAfter;
  final Object? useBefore;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'use_after': useAfter,
        'use_before': useBefore,
      };
}

class ContestEffect {
  const ContestEffect({
    required this.url,
  });

  factory ContestEffect.fromJson(Map<String, dynamic> json) => ContestEffect(
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

class ContestType {
  const ContestType({
    required this.name,
    required this.url,
  });

  factory ContestType.fromJson(Map<String, dynamic> json) => ContestType(
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

class DamageClass {
  const DamageClass({
    required this.name,
    required this.url,
  });

  factory DamageClass.fromJson(Map<String, dynamic> json) => DamageClass(
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

class EffectEntries {
  const EffectEntries({
    required this.effect,
    required this.language,
    required this.shortEffect,
  });

  factory EffectEntries.fromJson(Map<String, dynamic> json) => EffectEntries(
        effect: asT<String>(json['effect'])!,
        language: LanguageEffect.fromJson(asT<Map<String, dynamic>>(json['language'])!),
        shortEffect: asT<String>(json['short_effect'])!,
      );

  final String effect;
  final LanguageEffect language;
  final String shortEffect;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'effect': effect,
        'language': language,
        'short_effect': shortEffect,
      };
}

class LanguageEffect {
  const LanguageEffect({
    required this.name,
    required this.url,
  });

  factory LanguageEffect.fromJson(Map<String, dynamic> json) => LanguageEffect(
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
    required this.versionGroup,
  });

  factory FlavorTextEntries.fromJson(Map<String, dynamic> json) => FlavorTextEntries(
        flavorText: asT<String>(json['flavor_text'])!,
        language: LanguageFlavor.fromJson(asT<Map<String, dynamic>>(json['language'])!),
        versionGroup:
            VersionGroupFlavor.fromJson(asT<Map<String, dynamic>>(json['version_group'])!),
      );

  final String flavorText;
  final LanguageFlavor language;
  final VersionGroupFlavor versionGroup;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'flavor_text': flavorText,
        'language': language,
        'version_group': versionGroup,
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

class VersionGroupFlavor {
  const VersionGroupFlavor({
    required this.name,
    required this.url,
  });

  factory VersionGroupFlavor.fromJson(Map<String, dynamic> json) => VersionGroupFlavor(
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

class LearnedByPokemon {
  const LearnedByPokemon({
    required this.name,
    required this.url,
  });

  factory LearnedByPokemon.fromJson(Map<String, dynamic> json) => LearnedByPokemon(
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

class Machines {
  const Machines({
    required this.machine,
    required this.versionGroup,
  });

  factory Machines.fromJson(Map<String, dynamic> json) => Machines(
        machine: Machine.fromJson(asT<Map<String, dynamic>>(json['machine'])!),
        versionGroup: VersionGroup.fromJson(asT<Map<String, dynamic>>(json['version_group'])!),
      );

  final Machine machine;
  final VersionGroup versionGroup;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'machine': machine,
        'version_group': versionGroup,
      };
}

class Machine {
  const Machine({
    required this.url,
  });

  factory Machine.fromJson(Map<String, dynamic> json) => Machine(
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

class VersionGroup {
  const VersionGroup({
    required this.name,
    required this.url,
  });

  factory VersionGroup.fromJson(Map<String, dynamic> json) => VersionGroup(
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

class Meta {
  const Meta({
    required this.ailment,
    required this.ailmentChance,
    required this.category,
    required this.critRate,
    required this.drain,
    required this.flinchChance,
    required this.healing,
    this.maxHits,
    this.maxTurns,
    this.minHits,
    this.minTurns,
    required this.statChance,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        ailment: Ailment.fromJson(asT<Map<String, dynamic>>(json['ailment'])!),
        ailmentChance: asT<int>(json['ailment_chance'])!,
        category: Category.fromJson(asT<Map<String, dynamic>>(json['category'])!),
        critRate: asT<int>(json['crit_rate'])!,
        drain: asT<int>(json['drain'])!,
        flinchChance: asT<int>(json['flinch_chance'])!,
        healing: asT<int>(json['healing'])!,
        maxHits: asT<Object?>(json['max_hits']),
        maxTurns: asT<Object?>(json['max_turns']),
        minHits: asT<Object?>(json['min_hits']),
        minTurns: asT<Object?>(json['min_turns']),
        statChance: asT<int>(json['stat_chance'])!,
      );

  final Ailment ailment;
  final int ailmentChance;
  final Category category;
  final int critRate;
  final int drain;
  final int flinchChance;
  final int healing;
  final Object? maxHits;
  final Object? maxTurns;
  final Object? minHits;
  final Object? minTurns;
  final int statChance;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'ailment': ailment,
        'ailment_chance': ailmentChance,
        'category': category,
        'crit_rate': critRate,
        'drain': drain,
        'flinch_chance': flinchChance,
        'healing': healing,
        'max_hits': maxHits,
        'max_turns': maxTurns,
        'min_hits': minHits,
        'min_turns': minTurns,
        'stat_chance': statChance,
      };
}

class Ailment {
  const Ailment({
    required this.name,
    required this.url,
  });

  factory Ailment.fromJson(Map<String, dynamic> json) => Ailment(
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

class Category {
  const Category({
    required this.name,
    required this.url,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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

class SuperContestEffect {
  const SuperContestEffect({
    required this.url,
  });

  factory SuperContestEffect.fromJson(Map<String, dynamic> json) => SuperContestEffect(
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

class Target {
  const Target({
    required this.name,
    required this.url,
  });

  factory Target.fromJson(Map<String, dynamic> json) => Target(
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

class Type {
  const Type({
    required this.name,
    required this.url,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
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
