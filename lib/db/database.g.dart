// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Word extends DataClass implements Insertable<Word> {
  final String toDay;
  final String strMorning;
  final String strNoon;
  final String strNight;
  final String strSnack;
  final String strMemo;
  Word(
      {@required this.toDay,
      @required this.strMorning,
      @required this.strNoon,
      @required this.strNight,
      @required this.strSnack,
      @required this.strMemo});
  factory Word.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return Word(
      toDay:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}to_day']),
      strMorning: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}str_morning']),
      strNoon: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}str_noon']),
      strNight: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}str_night']),
      strSnack: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}str_snack']),
      strMemo: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}str_memo']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || toDay != null) {
      map['to_day'] = Variable<String>(toDay);
    }
    if (!nullToAbsent || strMorning != null) {
      map['str_morning'] = Variable<String>(strMorning);
    }
    if (!nullToAbsent || strNoon != null) {
      map['str_noon'] = Variable<String>(strNoon);
    }
    if (!nullToAbsent || strNight != null) {
      map['str_night'] = Variable<String>(strNight);
    }
    if (!nullToAbsent || strSnack != null) {
      map['str_snack'] = Variable<String>(strSnack);
    }
    if (!nullToAbsent || strMemo != null) {
      map['str_memo'] = Variable<String>(strMemo);
    }
    return map;
  }

  WordsCompanion toCompanion(bool nullToAbsent) {
    return WordsCompanion(
      toDay:
          toDay == null && nullToAbsent ? const Value.absent() : Value(toDay),
      strMorning: strMorning == null && nullToAbsent
          ? const Value.absent()
          : Value(strMorning),
      strNoon: strNoon == null && nullToAbsent
          ? const Value.absent()
          : Value(strNoon),
      strNight: strNight == null && nullToAbsent
          ? const Value.absent()
          : Value(strNight),
      strSnack: strSnack == null && nullToAbsent
          ? const Value.absent()
          : Value(strSnack),
      strMemo: strMemo == null && nullToAbsent
          ? const Value.absent()
          : Value(strMemo),
    );
  }

  factory Word.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Word(
      toDay: serializer.fromJson<String>(json['toDay']),
      strMorning: serializer.fromJson<String>(json['strMorning']),
      strNoon: serializer.fromJson<String>(json['strNoon']),
      strNight: serializer.fromJson<String>(json['strNight']),
      strSnack: serializer.fromJson<String>(json['strSnack']),
      strMemo: serializer.fromJson<String>(json['strMemo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'toDay': serializer.toJson<String>(toDay),
      'strMorning': serializer.toJson<String>(strMorning),
      'strNoon': serializer.toJson<String>(strNoon),
      'strNight': serializer.toJson<String>(strNight),
      'strSnack': serializer.toJson<String>(strSnack),
      'strMemo': serializer.toJson<String>(strMemo),
    };
  }

  Word copyWith(
          {String toDay,
          String strMorning,
          String strNoon,
          String strNight,
          String strSnack,
          String strMemo}) =>
      Word(
        toDay: toDay ?? this.toDay,
        strMorning: strMorning ?? this.strMorning,
        strNoon: strNoon ?? this.strNoon,
        strNight: strNight ?? this.strNight,
        strSnack: strSnack ?? this.strSnack,
        strMemo: strMemo ?? this.strMemo,
      );
  @override
  String toString() {
    return (StringBuffer('Word(')
          ..write('toDay: $toDay, ')
          ..write('strMorning: $strMorning, ')
          ..write('strNoon: $strNoon, ')
          ..write('strNight: $strNight, ')
          ..write('strSnack: $strSnack, ')
          ..write('strMemo: $strMemo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      toDay.hashCode,
      $mrjc(
          strMorning.hashCode,
          $mrjc(
              strNoon.hashCode,
              $mrjc(strNight.hashCode,
                  $mrjc(strSnack.hashCode, strMemo.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Word &&
          other.toDay == this.toDay &&
          other.strMorning == this.strMorning &&
          other.strNoon == this.strNoon &&
          other.strNight == this.strNight &&
          other.strSnack == this.strSnack &&
          other.strMemo == this.strMemo);
}

class WordsCompanion extends UpdateCompanion<Word> {
  final Value<String> toDay;
  final Value<String> strMorning;
  final Value<String> strNoon;
  final Value<String> strNight;
  final Value<String> strSnack;
  final Value<String> strMemo;
  const WordsCompanion({
    this.toDay = const Value.absent(),
    this.strMorning = const Value.absent(),
    this.strNoon = const Value.absent(),
    this.strNight = const Value.absent(),
    this.strSnack = const Value.absent(),
    this.strMemo = const Value.absent(),
  });
  WordsCompanion.insert({
    @required String toDay,
    @required String strMorning,
    @required String strNoon,
    @required String strNight,
    @required String strSnack,
    @required String strMemo,
  })  : toDay = Value(toDay),
        strMorning = Value(strMorning),
        strNoon = Value(strNoon),
        strNight = Value(strNight),
        strSnack = Value(strSnack),
        strMemo = Value(strMemo);
  static Insertable<Word> custom({
    Expression<String> toDay,
    Expression<String> strMorning,
    Expression<String> strNoon,
    Expression<String> strNight,
    Expression<String> strSnack,
    Expression<String> strMemo,
  }) {
    return RawValuesInsertable({
      if (toDay != null) 'to_day': toDay,
      if (strMorning != null) 'str_morning': strMorning,
      if (strNoon != null) 'str_noon': strNoon,
      if (strNight != null) 'str_night': strNight,
      if (strSnack != null) 'str_snack': strSnack,
      if (strMemo != null) 'str_memo': strMemo,
    });
  }

  WordsCompanion copyWith(
      {Value<String> toDay,
      Value<String> strMorning,
      Value<String> strNoon,
      Value<String> strNight,
      Value<String> strSnack,
      Value<String> strMemo}) {
    return WordsCompanion(
      toDay: toDay ?? this.toDay,
      strMorning: strMorning ?? this.strMorning,
      strNoon: strNoon ?? this.strNoon,
      strNight: strNight ?? this.strNight,
      strSnack: strSnack ?? this.strSnack,
      strMemo: strMemo ?? this.strMemo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (toDay.present) {
      map['to_day'] = Variable<String>(toDay.value);
    }
    if (strMorning.present) {
      map['str_morning'] = Variable<String>(strMorning.value);
    }
    if (strNoon.present) {
      map['str_noon'] = Variable<String>(strNoon.value);
    }
    if (strNight.present) {
      map['str_night'] = Variable<String>(strNight.value);
    }
    if (strSnack.present) {
      map['str_snack'] = Variable<String>(strSnack.value);
    }
    if (strMemo.present) {
      map['str_memo'] = Variable<String>(strMemo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordsCompanion(')
          ..write('toDay: $toDay, ')
          ..write('strMorning: $strMorning, ')
          ..write('strNoon: $strNoon, ')
          ..write('strNight: $strNight, ')
          ..write('strSnack: $strSnack, ')
          ..write('strMemo: $strMemo')
          ..write(')'))
        .toString();
  }
}

class $WordsTable extends Words with TableInfo<$WordsTable, Word> {
  final GeneratedDatabase _db;
  final String _alias;
  $WordsTable(this._db, [this._alias]);
  final VerificationMeta _toDayMeta = const VerificationMeta('toDay');
  GeneratedTextColumn _toDay;
  @override
  GeneratedTextColumn get toDay => _toDay ??= _constructToDay();
  GeneratedTextColumn _constructToDay() {
    return GeneratedTextColumn(
      'to_day',
      $tableName,
      false,
    );
  }

  final VerificationMeta _strMorningMeta = const VerificationMeta('strMorning');
  GeneratedTextColumn _strMorning;
  @override
  GeneratedTextColumn get strMorning => _strMorning ??= _constructStrMorning();
  GeneratedTextColumn _constructStrMorning() {
    return GeneratedTextColumn(
      'str_morning',
      $tableName,
      false,
    );
  }

  final VerificationMeta _strNoonMeta = const VerificationMeta('strNoon');
  GeneratedTextColumn _strNoon;
  @override
  GeneratedTextColumn get strNoon => _strNoon ??= _constructStrNoon();
  GeneratedTextColumn _constructStrNoon() {
    return GeneratedTextColumn(
      'str_noon',
      $tableName,
      false,
    );
  }

  final VerificationMeta _strNightMeta = const VerificationMeta('strNight');
  GeneratedTextColumn _strNight;
  @override
  GeneratedTextColumn get strNight => _strNight ??= _constructStrNight();
  GeneratedTextColumn _constructStrNight() {
    return GeneratedTextColumn(
      'str_night',
      $tableName,
      false,
    );
  }

  final VerificationMeta _strSnackMeta = const VerificationMeta('strSnack');
  GeneratedTextColumn _strSnack;
  @override
  GeneratedTextColumn get strSnack => _strSnack ??= _constructStrSnack();
  GeneratedTextColumn _constructStrSnack() {
    return GeneratedTextColumn(
      'str_snack',
      $tableName,
      false,
    );
  }

  final VerificationMeta _strMemoMeta = const VerificationMeta('strMemo');
  GeneratedTextColumn _strMemo;
  @override
  GeneratedTextColumn get strMemo => _strMemo ??= _constructStrMemo();
  GeneratedTextColumn _constructStrMemo() {
    return GeneratedTextColumn(
      'str_memo',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [toDay, strMorning, strNoon, strNight, strSnack, strMemo];
  @override
  $WordsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'words';
  @override
  final String actualTableName = 'words';
  @override
  VerificationContext validateIntegrity(Insertable<Word> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('to_day')) {
      context.handle(
          _toDayMeta, toDay.isAcceptableOrUnknown(data['to_day'], _toDayMeta));
    } else if (isInserting) {
      context.missing(_toDayMeta);
    }
    if (data.containsKey('str_morning')) {
      context.handle(
          _strMorningMeta,
          strMorning.isAcceptableOrUnknown(
              data['str_morning'], _strMorningMeta));
    } else if (isInserting) {
      context.missing(_strMorningMeta);
    }
    if (data.containsKey('str_noon')) {
      context.handle(_strNoonMeta,
          strNoon.isAcceptableOrUnknown(data['str_noon'], _strNoonMeta));
    } else if (isInserting) {
      context.missing(_strNoonMeta);
    }
    if (data.containsKey('str_night')) {
      context.handle(_strNightMeta,
          strNight.isAcceptableOrUnknown(data['str_night'], _strNightMeta));
    } else if (isInserting) {
      context.missing(_strNightMeta);
    }
    if (data.containsKey('str_snack')) {
      context.handle(_strSnackMeta,
          strSnack.isAcceptableOrUnknown(data['str_snack'], _strSnackMeta));
    } else if (isInserting) {
      context.missing(_strSnackMeta);
    }
    if (data.containsKey('str_memo')) {
      context.handle(_strMemoMeta,
          strMemo.isAcceptableOrUnknown(data['str_memo'], _strMemoMeta));
    } else if (isInserting) {
      context.missing(_strMemoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {toDay};
  @override
  Word map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Word.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $WordsTable createAlias(String alias) {
    return $WordsTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $WordsTable _words;
  $WordsTable get words => _words ??= $WordsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [words];
}
