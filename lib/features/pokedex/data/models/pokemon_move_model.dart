import 'package:pokedex/features/pokedex/domain/entities/pokemon_move.dart';

class PokemonMoveModel extends PokemonMove {
  PokemonMoveModel(
      {required ContestEffect contestEffect,
      required ContestType contestType,
      required DamageClass damageClass,
      required List<Object> effectChanges,
      required List<EffectEntries> effectEntries,
      required List<FlavorTextEntries> flavorTextEntries,
      required Generation generation,
      required int id,
      required List<LearnedByPokemon> learnedByPokemon,
      required List<Machines> machines,
      required Meta meta,
      required String name,
      required List<Names> names,
      required List<Object> pastValues,
      required int pp,
      required int priority,
      required List<Object> statChanges,
      required SuperContestEffect superContestEffect,
      required Target target,
      required Type type,
      int? accuracy,
      int? effectChance,
      int? power,
      ContestCombos? contestCombos})
      : super(
            contestEffect: contestEffect,
            contestType: contestType,
            damageClass: damageClass,
            effectChanges: effectChanges,
            effectEntries: effectEntries,
            flavorTextEntries: flavorTextEntries,
            generation: generation,
            id: id,
            learnedByPokemon: learnedByPokemon,
            machines: machines,
            meta: meta,
            name: name,
            names: names,
            pastValues: pastValues,
            pp: pp,
            power: power,
            accuracy: accuracy,
            effectChance: effectChance,
            contestCombos: contestCombos,
            priority: priority,
            statChanges: statChanges,
            superContestEffect: superContestEffect,
            target: target,
            type: type);

  factory PokemonMoveModel.fromJson(Map<String, dynamic> json) {
    final List<Object>? effectChanges = json['effect_changes'] is List ? <Object>[] : null;
    if (effectChanges != null) {
      for (final dynamic item in json['effect_changes']!) {
        if (item != null) {
          tryCatch(() {
            effectChanges.add(asT<Object>(item)!);
          });
        }
      }
    }

    final List<EffectEntries>? effectEntries =
        json['effect_entries'] is List ? <EffectEntries>[] : null;
    if (effectEntries != null) {
      for (final dynamic item in json['effect_entries']!) {
        if (item != null) {
          tryCatch(() {
            effectEntries.add(EffectEntries.fromJson(asT<Map<String, dynamic>>(item)!));
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

    final List<LearnedByPokemon>? learnedByPokemon =
        json['learned_by_pokemon'] is List ? <LearnedByPokemon>[] : null;
    if (learnedByPokemon != null) {
      for (final dynamic item in json['learned_by_pokemon']!) {
        if (item != null) {
          tryCatch(() {
            learnedByPokemon.add(LearnedByPokemon.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }

    final List<Machines>? machines = json['machines'] is List ? <Machines>[] : null;
    if (machines != null) {
      for (final dynamic item in json['machines']!) {
        if (item != null) {
          tryCatch(() {
            machines.add(Machines.fromJson(asT<Map<String, dynamic>>(item)!));
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

    final List<Object>? pastValues = json['past_values'] is List ? <Object>[] : null;
    if (pastValues != null) {
      for (final dynamic item in json['past_values']!) {
        if (item != null) {
          tryCatch(() {
            pastValues.add(asT<Object>(item)!);
          });
        }
      }
    }

    final List<Object>? statChanges = json['stat_changes'] is List ? <Object>[] : null;
    if (statChanges != null) {
      for (final dynamic item in json['stat_changes']!) {
        if (item != null) {
          tryCatch(() {
            statChanges.add(asT<Object>(item)!);
          });
        }
      }
    }
    return PokemonMoveModel(
      accuracy: asT<int?>(json['accuracy']),
      contestCombos: json['contest_combos'] == null
          ? null
          : ContestCombos.fromJson(asT<Map<String, dynamic>>(json['contest_combos'])!),
      contestEffect: ContestEffect.fromJson(asT<Map<String, dynamic>>(json['contest_effect'])!),
      contestType: ContestType.fromJson(asT<Map<String, dynamic>>(json['contest_type'])!),
      damageClass: DamageClass.fromJson(asT<Map<String, dynamic>>(json['damage_class'])!),
      effectChance: asT<int?>(json['effect_chance']),
      effectChanges: effectChanges!,
      effectEntries: effectEntries!,
      flavorTextEntries: flavorTextEntries!,
      generation: Generation.fromJson(asT<Map<String, dynamic>>(json['generation'])!),
      id: asT<int>(json['id'])!,
      learnedByPokemon: learnedByPokemon!,
      machines: machines!,
      meta: Meta.fromJson(asT<Map<String, dynamic>>(json['meta'])!),
      name: asT<String>(json['name'])!,
      names: names!,
      pastValues: pastValues!,
      power: asT<int?>(json['power']),
      pp: asT<int>(json['pp'])!,
      priority: asT<int>(json['priority'])!,
      statChanges: statChanges!,
      superContestEffect:
          SuperContestEffect.fromJson(asT<Map<String, dynamic>>(json['super_contest_effect'])!),
      target: Target.fromJson(asT<Map<String, dynamic>>(json['target'])!),
      type: Type.fromJson(asT<Map<String, dynamic>>(json['type'])!),
    );
  }
}
