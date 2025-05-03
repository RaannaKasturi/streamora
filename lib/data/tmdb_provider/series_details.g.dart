// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_details.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$seriesDetailsHash() => r'a2aa7b8c06349f97d50fc7bc672d3c752126cd1e';

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

/// See also [seriesDetails].
@ProviderFor(seriesDetails)
const seriesDetailsProvider = SeriesDetailsFamily();

/// See also [seriesDetails].
class SeriesDetailsFamily extends Family<AsyncValue<SeriesDetailsData>> {
  /// See also [seriesDetails].
  const SeriesDetailsFamily();

  /// See also [seriesDetails].
  SeriesDetailsProvider call(
    int seriesId,
  ) {
    return SeriesDetailsProvider(
      seriesId,
    );
  }

  @override
  SeriesDetailsProvider getProviderOverride(
    covariant SeriesDetailsProvider provider,
  ) {
    return call(
      provider.seriesId,
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
  String? get name => r'seriesDetailsProvider';
}

/// See also [seriesDetails].
class SeriesDetailsProvider
    extends AutoDisposeFutureProvider<SeriesDetailsData> {
  /// See also [seriesDetails].
  SeriesDetailsProvider(
    int seriesId,
  ) : this._internal(
          (ref) => seriesDetails(
            ref as SeriesDetailsRef,
            seriesId,
          ),
          from: seriesDetailsProvider,
          name: r'seriesDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$seriesDetailsHash,
          dependencies: SeriesDetailsFamily._dependencies,
          allTransitiveDependencies:
              SeriesDetailsFamily._allTransitiveDependencies,
          seriesId: seriesId,
        );

  SeriesDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.seriesId,
  }) : super.internal();

  final int seriesId;

  @override
  Override overrideWith(
    FutureOr<SeriesDetailsData> Function(SeriesDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SeriesDetailsProvider._internal(
        (ref) => create(ref as SeriesDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        seriesId: seriesId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SeriesDetailsData> createElement() {
    return _SeriesDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SeriesDetailsProvider && other.seriesId == seriesId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, seriesId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SeriesDetailsRef on AutoDisposeFutureProviderRef<SeriesDetailsData> {
  /// The parameter `seriesId` of this provider.
  int get seriesId;
}

class _SeriesDetailsProviderElement
    extends AutoDisposeFutureProviderElement<SeriesDetailsData>
    with SeriesDetailsRef {
  _SeriesDetailsProviderElement(super.provider);

  @override
  int get seriesId => (origin as SeriesDetailsProvider).seriesId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
