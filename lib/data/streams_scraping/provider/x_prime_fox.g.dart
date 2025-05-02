// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'x_prime_fox.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$xPrimeFoxStreamHash() => r'befeb01da1738bf3de9d6c49cfa8132963f184c8';

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

/// See also [xPrimeFoxStream].
@ProviderFor(xPrimeFoxStream)
const xPrimeFoxStreamProvider = XPrimeFoxStreamFamily();

/// See also [xPrimeFoxStream].
class XPrimeFoxStreamFamily extends Family<AsyncValue<List<VideoData>>> {
  /// See also [xPrimeFoxStream].
  const XPrimeFoxStreamFamily();

  /// See also [xPrimeFoxStream].
  XPrimeFoxStreamProvider call({
    required StreamSearchData movieData,
  }) {
    return XPrimeFoxStreamProvider(
      movieData: movieData,
    );
  }

  @override
  XPrimeFoxStreamProvider getProviderOverride(
    covariant XPrimeFoxStreamProvider provider,
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
  String? get name => r'xPrimeFoxStreamProvider';
}

/// See also [xPrimeFoxStream].
class XPrimeFoxStreamProvider
    extends AutoDisposeFutureProvider<List<VideoData>> {
  /// See also [xPrimeFoxStream].
  XPrimeFoxStreamProvider({
    required StreamSearchData movieData,
  }) : this._internal(
          (ref) => xPrimeFoxStream(
            ref as XPrimeFoxStreamRef,
            movieData: movieData,
          ),
          from: xPrimeFoxStreamProvider,
          name: r'xPrimeFoxStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$xPrimeFoxStreamHash,
          dependencies: XPrimeFoxStreamFamily._dependencies,
          allTransitiveDependencies:
              XPrimeFoxStreamFamily._allTransitiveDependencies,
          movieData: movieData,
        );

  XPrimeFoxStreamProvider._internal(
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
    FutureOr<List<VideoData>> Function(XPrimeFoxStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: XPrimeFoxStreamProvider._internal(
        (ref) => create(ref as XPrimeFoxStreamRef),
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
    return _XPrimeFoxStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is XPrimeFoxStreamProvider && other.movieData == movieData;
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
mixin XPrimeFoxStreamRef on AutoDisposeFutureProviderRef<List<VideoData>> {
  /// The parameter `movieData` of this provider.
  StreamSearchData get movieData;
}

class _XPrimeFoxStreamProviderElement
    extends AutoDisposeFutureProviderElement<List<VideoData>>
    with XPrimeFoxStreamRef {
  _XPrimeFoxStreamProviderElement(super.provider);

  @override
  StreamSearchData get movieData =>
      (origin as XPrimeFoxStreamProvider).movieData;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
