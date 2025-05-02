// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'x_prime_appolo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$xPrimeAppoloStreamHash() =>
    r'bbd17ab52faa80963e73a1db7dd190c8e290420c';

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

/// See also [xPrimeAppoloStream].
@ProviderFor(xPrimeAppoloStream)
const xPrimeAppoloStreamProvider = XPrimeAppoloStreamFamily();

/// See also [xPrimeAppoloStream].
class XPrimeAppoloStreamFamily extends Family<AsyncValue<List<VideoData>>> {
  /// See also [xPrimeAppoloStream].
  const XPrimeAppoloStreamFamily();

  /// See also [xPrimeAppoloStream].
  XPrimeAppoloStreamProvider call({
    required StreamSearchData movieData,
  }) {
    return XPrimeAppoloStreamProvider(
      movieData: movieData,
    );
  }

  @override
  XPrimeAppoloStreamProvider getProviderOverride(
    covariant XPrimeAppoloStreamProvider provider,
  ) {
    return call(
      movieData: provider.movieData,
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
  String? get name => r'xPrimeAppoloStreamProvider';
}

/// See also [xPrimeAppoloStream].
class XPrimeAppoloStreamProvider
    extends AutoDisposeFutureProvider<List<VideoData>> {
  /// See also [xPrimeAppoloStream].
  XPrimeAppoloStreamProvider({
    required StreamSearchData movieData,
  }) : this._internal(
          (ref) => xPrimeAppoloStream(
            ref as XPrimeAppoloStreamRef,
            movieData: movieData,
          ),
          from: xPrimeAppoloStreamProvider,
          name: r'xPrimeAppoloStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$xPrimeAppoloStreamHash,
          dependencies: XPrimeAppoloStreamFamily._dependencies,
          allTransitiveDependencies:
              XPrimeAppoloStreamFamily._allTransitiveDependencies,
          movieData: movieData,
        );

  XPrimeAppoloStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieData,
  }) : super.internal();

  final StreamSearchData movieData;

  @override
  Override overrideWith(
    FutureOr<List<VideoData>> Function(XPrimeAppoloStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: XPrimeAppoloStreamProvider._internal(
        (ref) => create(ref as XPrimeAppoloStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieData: movieData,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<VideoData>> createElement() {
    return _XPrimeAppoloStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is XPrimeAppoloStreamProvider && other.movieData == movieData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieData.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin XPrimeAppoloStreamRef on AutoDisposeFutureProviderRef<List<VideoData>> {
  /// The parameter `movieData` of this provider.
  StreamSearchData get movieData;
}

class _XPrimeAppoloStreamProviderElement
    extends AutoDisposeFutureProviderElement<List<VideoData>>
    with XPrimeAppoloStreamRef {
  _XPrimeAppoloStreamProviderElement(super.provider);

  @override
  StreamSearchData get movieData =>
      (origin as XPrimeAppoloStreamProvider).movieData;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
