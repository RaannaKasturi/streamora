// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtitles.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$subtitlesHash() => r'e447b2f40f4ea0e54427771c6460e2d1ad88eb4d';

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

/// See also [subtitles].
@ProviderFor(subtitles)
const subtitlesProvider = SubtitlesFamily();

/// See also [subtitles].
class SubtitlesFamily extends Family<AsyncValue<List<SubtitleData>>> {
  /// See also [subtitles].
  const SubtitlesFamily();

  /// See also [subtitles].
  SubtitlesProvider call({
    required String imdbId,
  }) {
    return SubtitlesProvider(
      imdbId: imdbId,
    );
  }

  @override
  SubtitlesProvider getProviderOverride(
    covariant SubtitlesProvider provider,
  ) {
    return call(
      imdbId: provider.imdbId,
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
  String? get name => r'subtitlesProvider';
}

/// See also [subtitles].
class SubtitlesProvider extends AutoDisposeFutureProvider<List<SubtitleData>> {
  /// See also [subtitles].
  SubtitlesProvider({
    required String imdbId,
  }) : this._internal(
          (ref) => subtitles(
            ref as SubtitlesRef,
            imdbId: imdbId,
          ),
          from: subtitlesProvider,
          name: r'subtitlesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$subtitlesHash,
          dependencies: SubtitlesFamily._dependencies,
          allTransitiveDependencies: SubtitlesFamily._allTransitiveDependencies,
          imdbId: imdbId,
        );

  SubtitlesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.imdbId,
  }) : super.internal();

  final String imdbId;

  @override
  Override overrideWith(
    FutureOr<List<SubtitleData>> Function(SubtitlesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubtitlesProvider._internal(
        (ref) => create(ref as SubtitlesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        imdbId: imdbId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<SubtitleData>> createElement() {
    return _SubtitlesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubtitlesProvider && other.imdbId == imdbId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, imdbId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SubtitlesRef on AutoDisposeFutureProviderRef<List<SubtitleData>> {
  /// The parameter `imdbId` of this provider.
  String get imdbId;
}

class _SubtitlesProviderElement
    extends AutoDisposeFutureProviderElement<List<SubtitleData>>
    with SubtitlesRef {
  _SubtitlesProviderElement(super.provider);

  @override
  String get imdbId => (origin as SubtitlesProvider).imdbId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
