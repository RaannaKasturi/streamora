// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtitles.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$subtitlesHash() => r'72646c0beb9714040614a4442a2412b9830e3b95';

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
    required String tmdbId,
  }) {
    return SubtitlesProvider(
      tmdbId: tmdbId,
    );
  }

  @override
  SubtitlesProvider getProviderOverride(
    covariant SubtitlesProvider provider,
  ) {
    return call(
      tmdbId: provider.tmdbId,
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
    required String tmdbId,
  }) : this._internal(
          (ref) => subtitles(
            ref as SubtitlesRef,
            tmdbId: tmdbId,
          ),
          from: subtitlesProvider,
          name: r'subtitlesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$subtitlesHash,
          dependencies: SubtitlesFamily._dependencies,
          allTransitiveDependencies: SubtitlesFamily._allTransitiveDependencies,
          tmdbId: tmdbId,
        );

  SubtitlesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tmdbId,
  }) : super.internal();

  final String tmdbId;

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
        tmdbId: tmdbId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<SubtitleData>> createElement() {
    return _SubtitlesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubtitlesProvider && other.tmdbId == tmdbId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tmdbId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SubtitlesRef on AutoDisposeFutureProviderRef<List<SubtitleData>> {
  /// The parameter `tmdbId` of this provider.
  String get tmdbId;
}

class _SubtitlesProviderElement
    extends AutoDisposeFutureProviderElement<List<SubtitleData>>
    with SubtitlesRef {
  _SubtitlesProviderElement(super.provider);

  @override
  String get tmdbId => (origin as SubtitlesProvider).tmdbId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
