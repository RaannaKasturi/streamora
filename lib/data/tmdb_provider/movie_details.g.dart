// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$movieDetailsHash() => r'07cabba97932c9e7d5dacc9a719e0ded2a6268a7';

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

/// See also [movieDetails].
@ProviderFor(movieDetails)
const movieDetailsProvider = MovieDetailsFamily();

/// See also [movieDetails].
class MovieDetailsFamily extends Family<AsyncValue<MovieDetailsData>> {
  /// See also [movieDetails].
  const MovieDetailsFamily();

  /// See also [movieDetails].
  MovieDetailsProvider call(
    int movieID,
  ) {
    return MovieDetailsProvider(
      movieID,
    );
  }

  @override
  MovieDetailsProvider getProviderOverride(
    covariant MovieDetailsProvider provider,
  ) {
    return call(
      provider.movieID,
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
  String? get name => r'movieDetailsProvider';
}

/// See also [movieDetails].
class MovieDetailsProvider extends AutoDisposeFutureProvider<MovieDetailsData> {
  /// See also [movieDetails].
  MovieDetailsProvider(
    int movieID,
  ) : this._internal(
          (ref) => movieDetails(
            ref as MovieDetailsRef,
            movieID,
          ),
          from: movieDetailsProvider,
          name: r'movieDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movieDetailsHash,
          dependencies: MovieDetailsFamily._dependencies,
          allTransitiveDependencies:
              MovieDetailsFamily._allTransitiveDependencies,
          movieID: movieID,
        );

  MovieDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieID,
  }) : super.internal();

  final int movieID;

  @override
  Override overrideWith(
    FutureOr<MovieDetailsData> Function(MovieDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MovieDetailsProvider._internal(
        (ref) => create(ref as MovieDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieID: movieID,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MovieDetailsData> createElement() {
    return _MovieDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieDetailsProvider && other.movieID == movieID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieID.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MovieDetailsRef on AutoDisposeFutureProviderRef<MovieDetailsData> {
  /// The parameter `movieID` of this provider.
  int get movieID;
}

class _MovieDetailsProviderElement
    extends AutoDisposeFutureProviderElement<MovieDetailsData>
    with MovieDetailsRef {
  _MovieDetailsProviderElement(super.provider);

  @override
  int get movieID => (origin as MovieDetailsProvider).movieID;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
