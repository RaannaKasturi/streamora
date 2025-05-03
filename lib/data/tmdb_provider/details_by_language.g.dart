// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_by_language.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDetailsByLanguageHash() =>
    r'9385cf4b303c7abfce6ae901ed8d8a0e6ade9da3';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getDetailsByLanguage].
@ProviderFor(getDetailsByLanguage)
const getDetailsByLanguageProvider = GetDetailsByLanguageFamily();

/// See also [getDetailsByLanguage].
class GetDetailsByLanguageFamily
    extends Family<AsyncValue<List<MovieListData>>> {
  /// See also [getDetailsByLanguage].
  const GetDetailsByLanguageFamily();

  /// See also [getDetailsByLanguage].
  GetDetailsByLanguageProvider call({
    required String languageISO,
    required String mediaType,
  }) {
    return GetDetailsByLanguageProvider(
      languageISO: languageISO,
      mediaType: mediaType,
    );
  }

  @override
  GetDetailsByLanguageProvider getProviderOverride(
    covariant GetDetailsByLanguageProvider provider,
  ) {
    return call(
      languageISO: provider.languageISO,
      mediaType: provider.mediaType,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getDetailsByLanguageProvider';
}

/// See also [getDetailsByLanguage].
class GetDetailsByLanguageProvider extends FutureProvider<List<MovieListData>> {
  /// See also [getDetailsByLanguage].
  GetDetailsByLanguageProvider({
    required String languageISO,
    required String mediaType,
  }) : this._internal(
          (ref) => getDetailsByLanguage(
            ref as GetDetailsByLanguageRef,
            languageISO: languageISO,
            mediaType: mediaType,
          ),
          from: getDetailsByLanguageProvider,
          name: r'getDetailsByLanguageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getDetailsByLanguageHash,
          dependencies: GetDetailsByLanguageFamily._dependencies,
          allTransitiveDependencies:
              GetDetailsByLanguageFamily._allTransitiveDependencies,
          languageISO: languageISO,
          mediaType: mediaType,
        );

  GetDetailsByLanguageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.languageISO,
    required this.mediaType,
  }) : super.internal();

  final String languageISO;
  final String mediaType;

  @override
  Override overrideWith(
    FutureOr<List<MovieListData>> Function(GetDetailsByLanguageRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetDetailsByLanguageProvider._internal(
        (ref) => create(ref as GetDetailsByLanguageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        languageISO: languageISO,
        mediaType: mediaType,
      ),
    );
  }

  @override
  FutureProviderElement<List<MovieListData>> createElement() {
    return _GetDetailsByLanguageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetDetailsByLanguageProvider &&
        other.languageISO == languageISO &&
        other.mediaType == mediaType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, languageISO.hashCode);
    hash = _SystemHash.combine(hash, mediaType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetDetailsByLanguageRef on FutureProviderRef<List<MovieListData>> {
  /// The parameter `languageISO` of this provider.
  String get languageISO;

  /// The parameter `mediaType` of this provider.
  String get mediaType;
}

class _GetDetailsByLanguageProviderElement
    extends FutureProviderElement<List<MovieListData>>
    with GetDetailsByLanguageRef {
  _GetDetailsByLanguageProviderElement(super.provider);

  @override
  String get languageISO =>
      (origin as GetDetailsByLanguageProvider).languageISO;
  @override
  String get mediaType => (origin as GetDetailsByLanguageProvider).mediaType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
