// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $GameEnginesTable extends GameEngines
    with TableInfo<$GameEnginesTable, GameEngine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameEnginesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, name, description, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_engines';
  @override
  VerificationContext validateIntegrity(Insertable<GameEngine> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameEngine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameEngine(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $GameEnginesTable createAlias(String alias) {
    return $GameEnginesTable(attachedDatabase, alias);
  }
}

class GameEngine extends DataClass implements Insertable<GameEngine> {
  final int id;
  final String name;
  final String description;
  final DateTime createdAt;
  const GameEngine(
      {required this.id,
      required this.name,
      required this.description,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  GameEnginesCompanion toCompanion(bool nullToAbsent) {
    return GameEnginesCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      createdAt: Value(createdAt),
    );
  }

  factory GameEngine.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameEngine(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  GameEngine copyWith(
          {int? id, String? name, String? description, DateTime? createdAt}) =>
      GameEngine(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
      );
  GameEngine copyWithCompanion(GameEnginesCompanion data) {
    return GameEngine(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameEngine(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameEngine &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.createdAt == this.createdAt);
}

class GameEnginesCompanion extends UpdateCompanion<GameEngine> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<DateTime> createdAt;
  const GameEnginesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  GameEnginesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    this.createdAt = const Value.absent(),
  })  : name = Value(name),
        description = Value(description);
  static Insertable<GameEngine> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  GameEnginesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<DateTime>? createdAt}) {
    return GameEnginesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameEnginesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ImagesTable extends Images with TableInfo<$ImagesTable, Image> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ImagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _localPathMeta =
      const VerificationMeta('localPath');
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
      'local_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _engineIdMeta =
      const VerificationMeta('engineId');
  @override
  late final GeneratedColumn<int> engineId = GeneratedColumn<int>(
      'engine_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, url, localPath, engineId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'images';
  @override
  VerificationContext validateIntegrity(Insertable<Image> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('local_path')) {
      context.handle(_localPathMeta,
          localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta));
    }
    if (data.containsKey('engine_id')) {
      context.handle(_engineIdMeta,
          engineId.isAcceptableOrUnknown(data['engine_id']!, _engineIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Image map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Image(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      localPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}local_path']),
      engineId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}engine_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ImagesTable createAlias(String alias) {
    return $ImagesTable(attachedDatabase, alias);
  }
}

class Image extends DataClass implements Insertable<Image> {
  final int id;
  final String url;
  final String? localPath;
  final int? engineId;
  final DateTime createdAt;
  const Image(
      {required this.id,
      required this.url,
      this.localPath,
      this.engineId,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['url'] = Variable<String>(url);
    if (!nullToAbsent || localPath != null) {
      map['local_path'] = Variable<String>(localPath);
    }
    if (!nullToAbsent || engineId != null) {
      map['engine_id'] = Variable<int>(engineId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ImagesCompanion toCompanion(bool nullToAbsent) {
    return ImagesCompanion(
      id: Value(id),
      url: Value(url),
      localPath: localPath == null && nullToAbsent
          ? const Value.absent()
          : Value(localPath),
      engineId: engineId == null && nullToAbsent
          ? const Value.absent()
          : Value(engineId),
      createdAt: Value(createdAt),
    );
  }

  factory Image.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Image(
      id: serializer.fromJson<int>(json['id']),
      url: serializer.fromJson<String>(json['url']),
      localPath: serializer.fromJson<String?>(json['localPath']),
      engineId: serializer.fromJson<int?>(json['engineId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'url': serializer.toJson<String>(url),
      'localPath': serializer.toJson<String?>(localPath),
      'engineId': serializer.toJson<int?>(engineId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Image copyWith(
          {int? id,
          String? url,
          Value<String?> localPath = const Value.absent(),
          Value<int?> engineId = const Value.absent(),
          DateTime? createdAt}) =>
      Image(
        id: id ?? this.id,
        url: url ?? this.url,
        localPath: localPath.present ? localPath.value : this.localPath,
        engineId: engineId.present ? engineId.value : this.engineId,
        createdAt: createdAt ?? this.createdAt,
      );
  Image copyWithCompanion(ImagesCompanion data) {
    return Image(
      id: data.id.present ? data.id.value : this.id,
      url: data.url.present ? data.url.value : this.url,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
      engineId: data.engineId.present ? data.engineId.value : this.engineId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Image(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('localPath: $localPath, ')
          ..write('engineId: $engineId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, url, localPath, engineId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Image &&
          other.id == this.id &&
          other.url == this.url &&
          other.localPath == this.localPath &&
          other.engineId == this.engineId &&
          other.createdAt == this.createdAt);
}

class ImagesCompanion extends UpdateCompanion<Image> {
  final Value<int> id;
  final Value<String> url;
  final Value<String?> localPath;
  final Value<int?> engineId;
  final Value<DateTime> createdAt;
  const ImagesCompanion({
    this.id = const Value.absent(),
    this.url = const Value.absent(),
    this.localPath = const Value.absent(),
    this.engineId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ImagesCompanion.insert({
    this.id = const Value.absent(),
    required String url,
    this.localPath = const Value.absent(),
    this.engineId = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : url = Value(url);
  static Insertable<Image> custom({
    Expression<int>? id,
    Expression<String>? url,
    Expression<String>? localPath,
    Expression<int>? engineId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (url != null) 'url': url,
      if (localPath != null) 'local_path': localPath,
      if (engineId != null) 'engine_id': engineId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ImagesCompanion copyWith(
      {Value<int>? id,
      Value<String>? url,
      Value<String?>? localPath,
      Value<int?>? engineId,
      Value<DateTime>? createdAt}) {
    return ImagesCompanion(
      id: id ?? this.id,
      url: url ?? this.url,
      localPath: localPath ?? this.localPath,
      engineId: engineId ?? this.engineId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    if (engineId.present) {
      map['engine_id'] = Variable<int>(engineId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImagesCompanion(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('localPath: $localPath, ')
          ..write('engineId: $engineId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $FeaturesTable extends Features with TableInfo<$FeaturesTable, Feature> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeaturesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _leadingIconMeta =
      const VerificationMeta('leadingIcon');
  @override
  late final GeneratedColumn<String> leadingIcon = GeneratedColumn<String>(
      'leading_icon', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('🎮'));
  static const VerificationMeta _trailingIconMeta =
      const VerificationMeta('trailingIcon');
  @override
  late final GeneratedColumn<String> trailingIcon = GeneratedColumn<String>(
      'trailing_icon', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('➡️'));
  static const VerificationMeta _engineIdMeta =
      const VerificationMeta('engineId');
  @override
  late final GeneratedColumn<int> engineId = GeneratedColumn<int>(
      'engine_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, leadingIcon, trailingIcon, engineId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'features';
  @override
  VerificationContext validateIntegrity(Insertable<Feature> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('leading_icon')) {
      context.handle(
          _leadingIconMeta,
          leadingIcon.isAcceptableOrUnknown(
              data['leading_icon']!, _leadingIconMeta));
    }
    if (data.containsKey('trailing_icon')) {
      context.handle(
          _trailingIconMeta,
          trailingIcon.isAcceptableOrUnknown(
              data['trailing_icon']!, _trailingIconMeta));
    }
    if (data.containsKey('engine_id')) {
      context.handle(_engineIdMeta,
          engineId.isAcceptableOrUnknown(data['engine_id']!, _engineIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Feature map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Feature(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      leadingIcon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}leading_icon'])!,
      trailingIcon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trailing_icon'])!,
      engineId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}engine_id']),
    );
  }

  @override
  $FeaturesTable createAlias(String alias) {
    return $FeaturesTable(attachedDatabase, alias);
  }
}

class Feature extends DataClass implements Insertable<Feature> {
  final int id;
  final String title;
  final String description;
  final String leadingIcon;
  final String trailingIcon;
  final int? engineId;
  const Feature(
      {required this.id,
      required this.title,
      required this.description,
      required this.leadingIcon,
      required this.trailingIcon,
      this.engineId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['leading_icon'] = Variable<String>(leadingIcon);
    map['trailing_icon'] = Variable<String>(trailingIcon);
    if (!nullToAbsent || engineId != null) {
      map['engine_id'] = Variable<int>(engineId);
    }
    return map;
  }

  FeaturesCompanion toCompanion(bool nullToAbsent) {
    return FeaturesCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      leadingIcon: Value(leadingIcon),
      trailingIcon: Value(trailingIcon),
      engineId: engineId == null && nullToAbsent
          ? const Value.absent()
          : Value(engineId),
    );
  }

  factory Feature.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Feature(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      leadingIcon: serializer.fromJson<String>(json['leadingIcon']),
      trailingIcon: serializer.fromJson<String>(json['trailingIcon']),
      engineId: serializer.fromJson<int?>(json['engineId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'leadingIcon': serializer.toJson<String>(leadingIcon),
      'trailingIcon': serializer.toJson<String>(trailingIcon),
      'engineId': serializer.toJson<int?>(engineId),
    };
  }

  Feature copyWith(
          {int? id,
          String? title,
          String? description,
          String? leadingIcon,
          String? trailingIcon,
          Value<int?> engineId = const Value.absent()}) =>
      Feature(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        leadingIcon: leadingIcon ?? this.leadingIcon,
        trailingIcon: trailingIcon ?? this.trailingIcon,
        engineId: engineId.present ? engineId.value : this.engineId,
      );
  Feature copyWithCompanion(FeaturesCompanion data) {
    return Feature(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      leadingIcon:
          data.leadingIcon.present ? data.leadingIcon.value : this.leadingIcon,
      trailingIcon: data.trailingIcon.present
          ? data.trailingIcon.value
          : this.trailingIcon,
      engineId: data.engineId.present ? data.engineId.value : this.engineId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Feature(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('leadingIcon: $leadingIcon, ')
          ..write('trailingIcon: $trailingIcon, ')
          ..write('engineId: $engineId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, description, leadingIcon, trailingIcon, engineId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Feature &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.leadingIcon == this.leadingIcon &&
          other.trailingIcon == this.trailingIcon &&
          other.engineId == this.engineId);
}

class FeaturesCompanion extends UpdateCompanion<Feature> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> leadingIcon;
  final Value<String> trailingIcon;
  final Value<int?> engineId;
  const FeaturesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.leadingIcon = const Value.absent(),
    this.trailingIcon = const Value.absent(),
    this.engineId = const Value.absent(),
  });
  FeaturesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    this.leadingIcon = const Value.absent(),
    this.trailingIcon = const Value.absent(),
    this.engineId = const Value.absent(),
  })  : title = Value(title),
        description = Value(description);
  static Insertable<Feature> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? leadingIcon,
    Expression<String>? trailingIcon,
    Expression<int>? engineId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (leadingIcon != null) 'leading_icon': leadingIcon,
      if (trailingIcon != null) 'trailing_icon': trailingIcon,
      if (engineId != null) 'engine_id': engineId,
    });
  }

  FeaturesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<String>? leadingIcon,
      Value<String>? trailingIcon,
      Value<int?>? engineId}) {
    return FeaturesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      leadingIcon: leadingIcon ?? this.leadingIcon,
      trailingIcon: trailingIcon ?? this.trailingIcon,
      engineId: engineId ?? this.engineId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (leadingIcon.present) {
      map['leading_icon'] = Variable<String>(leadingIcon.value);
    }
    if (trailingIcon.present) {
      map['trailing_icon'] = Variable<String>(trailingIcon.value);
    }
    if (engineId.present) {
      map['engine_id'] = Variable<int>(engineId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeaturesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('leadingIcon: $leadingIcon, ')
          ..write('trailingIcon: $trailingIcon, ')
          ..write('engineId: $engineId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $GameEnginesTable gameEngines = $GameEnginesTable(this);
  late final $ImagesTable images = $ImagesTable(this);
  late final $FeaturesTable features = $FeaturesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [gameEngines, images, features];
}

typedef $$GameEnginesTableCreateCompanionBuilder = GameEnginesCompanion
    Function({
  Value<int> id,
  required String name,
  required String description,
  Value<DateTime> createdAt,
});
typedef $$GameEnginesTableUpdateCompanionBuilder = GameEnginesCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String> description,
  Value<DateTime> createdAt,
});

class $$GameEnginesTableFilterComposer
    extends Composer<_$AppDatabase, $GameEnginesTable> {
  $$GameEnginesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$GameEnginesTableOrderingComposer
    extends Composer<_$AppDatabase, $GameEnginesTable> {
  $$GameEnginesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$GameEnginesTableAnnotationComposer
    extends Composer<_$AppDatabase, $GameEnginesTable> {
  $$GameEnginesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$GameEnginesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GameEnginesTable,
    GameEngine,
    $$GameEnginesTableFilterComposer,
    $$GameEnginesTableOrderingComposer,
    $$GameEnginesTableAnnotationComposer,
    $$GameEnginesTableCreateCompanionBuilder,
    $$GameEnginesTableUpdateCompanionBuilder,
    (GameEngine, BaseReferences<_$AppDatabase, $GameEnginesTable, GameEngine>),
    GameEngine,
    PrefetchHooks Function()> {
  $$GameEnginesTableTableManager(_$AppDatabase db, $GameEnginesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GameEnginesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GameEnginesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GameEnginesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              GameEnginesCompanion(
            id: id,
            name: name,
            description: description,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String description,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              GameEnginesCompanion.insert(
            id: id,
            name: name,
            description: description,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GameEnginesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GameEnginesTable,
    GameEngine,
    $$GameEnginesTableFilterComposer,
    $$GameEnginesTableOrderingComposer,
    $$GameEnginesTableAnnotationComposer,
    $$GameEnginesTableCreateCompanionBuilder,
    $$GameEnginesTableUpdateCompanionBuilder,
    (GameEngine, BaseReferences<_$AppDatabase, $GameEnginesTable, GameEngine>),
    GameEngine,
    PrefetchHooks Function()>;
typedef $$ImagesTableCreateCompanionBuilder = ImagesCompanion Function({
  Value<int> id,
  required String url,
  Value<String?> localPath,
  Value<int?> engineId,
  Value<DateTime> createdAt,
});
typedef $$ImagesTableUpdateCompanionBuilder = ImagesCompanion Function({
  Value<int> id,
  Value<String> url,
  Value<String?> localPath,
  Value<int?> engineId,
  Value<DateTime> createdAt,
});

class $$ImagesTableFilterComposer
    extends Composer<_$AppDatabase, $ImagesTable> {
  $$ImagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get localPath => $composableBuilder(
      column: $table.localPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get engineId => $composableBuilder(
      column: $table.engineId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$ImagesTableOrderingComposer
    extends Composer<_$AppDatabase, $ImagesTable> {
  $$ImagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get localPath => $composableBuilder(
      column: $table.localPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get engineId => $composableBuilder(
      column: $table.engineId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$ImagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ImagesTable> {
  $$ImagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get localPath =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<int> get engineId =>
      $composableBuilder(column: $table.engineId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ImagesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ImagesTable,
    Image,
    $$ImagesTableFilterComposer,
    $$ImagesTableOrderingComposer,
    $$ImagesTableAnnotationComposer,
    $$ImagesTableCreateCompanionBuilder,
    $$ImagesTableUpdateCompanionBuilder,
    (Image, BaseReferences<_$AppDatabase, $ImagesTable, Image>),
    Image,
    PrefetchHooks Function()> {
  $$ImagesTableTableManager(_$AppDatabase db, $ImagesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ImagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ImagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ImagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> url = const Value.absent(),
            Value<String?> localPath = const Value.absent(),
            Value<int?> engineId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ImagesCompanion(
            id: id,
            url: url,
            localPath: localPath,
            engineId: engineId,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String url,
            Value<String?> localPath = const Value.absent(),
            Value<int?> engineId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ImagesCompanion.insert(
            id: id,
            url: url,
            localPath: localPath,
            engineId: engineId,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ImagesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ImagesTable,
    Image,
    $$ImagesTableFilterComposer,
    $$ImagesTableOrderingComposer,
    $$ImagesTableAnnotationComposer,
    $$ImagesTableCreateCompanionBuilder,
    $$ImagesTableUpdateCompanionBuilder,
    (Image, BaseReferences<_$AppDatabase, $ImagesTable, Image>),
    Image,
    PrefetchHooks Function()>;
typedef $$FeaturesTableCreateCompanionBuilder = FeaturesCompanion Function({
  Value<int> id,
  required String title,
  required String description,
  Value<String> leadingIcon,
  Value<String> trailingIcon,
  Value<int?> engineId,
});
typedef $$FeaturesTableUpdateCompanionBuilder = FeaturesCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> description,
  Value<String> leadingIcon,
  Value<String> trailingIcon,
  Value<int?> engineId,
});

class $$FeaturesTableFilterComposer
    extends Composer<_$AppDatabase, $FeaturesTable> {
  $$FeaturesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get leadingIcon => $composableBuilder(
      column: $table.leadingIcon, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get trailingIcon => $composableBuilder(
      column: $table.trailingIcon, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get engineId => $composableBuilder(
      column: $table.engineId, builder: (column) => ColumnFilters(column));
}

class $$FeaturesTableOrderingComposer
    extends Composer<_$AppDatabase, $FeaturesTable> {
  $$FeaturesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get leadingIcon => $composableBuilder(
      column: $table.leadingIcon, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get trailingIcon => $composableBuilder(
      column: $table.trailingIcon,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get engineId => $composableBuilder(
      column: $table.engineId, builder: (column) => ColumnOrderings(column));
}

class $$FeaturesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FeaturesTable> {
  $$FeaturesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get leadingIcon => $composableBuilder(
      column: $table.leadingIcon, builder: (column) => column);

  GeneratedColumn<String> get trailingIcon => $composableBuilder(
      column: $table.trailingIcon, builder: (column) => column);

  GeneratedColumn<int> get engineId =>
      $composableBuilder(column: $table.engineId, builder: (column) => column);
}

class $$FeaturesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FeaturesTable,
    Feature,
    $$FeaturesTableFilterComposer,
    $$FeaturesTableOrderingComposer,
    $$FeaturesTableAnnotationComposer,
    $$FeaturesTableCreateCompanionBuilder,
    $$FeaturesTableUpdateCompanionBuilder,
    (Feature, BaseReferences<_$AppDatabase, $FeaturesTable, Feature>),
    Feature,
    PrefetchHooks Function()> {
  $$FeaturesTableTableManager(_$AppDatabase db, $FeaturesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FeaturesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FeaturesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FeaturesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> leadingIcon = const Value.absent(),
            Value<String> trailingIcon = const Value.absent(),
            Value<int?> engineId = const Value.absent(),
          }) =>
              FeaturesCompanion(
            id: id,
            title: title,
            description: description,
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon,
            engineId: engineId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String description,
            Value<String> leadingIcon = const Value.absent(),
            Value<String> trailingIcon = const Value.absent(),
            Value<int?> engineId = const Value.absent(),
          }) =>
              FeaturesCompanion.insert(
            id: id,
            title: title,
            description: description,
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon,
            engineId: engineId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FeaturesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FeaturesTable,
    Feature,
    $$FeaturesTableFilterComposer,
    $$FeaturesTableOrderingComposer,
    $$FeaturesTableAnnotationComposer,
    $$FeaturesTableCreateCompanionBuilder,
    $$FeaturesTableUpdateCompanionBuilder,
    (Feature, BaseReferences<_$AppDatabase, $FeaturesTable, Feature>),
    Feature,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$GameEnginesTableTableManager get gameEngines =>
      $$GameEnginesTableTableManager(_db, _db.gameEngines);
  $$ImagesTableTableManager get images =>
      $$ImagesTableTableManager(_db, _db.images);
  $$FeaturesTableTableManager get features =>
      $$FeaturesTableTableManager(_db, _db.features);
}
