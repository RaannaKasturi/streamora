// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streamora_streams.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$streamoraStreamsHash() => r'c4f2101a8f5daa8d295b944f925f968ab5cb5122';

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

/// See also [streamoraStreams].
@ProviderFor(streamoraStreams)
const streamoraStreamsProvider = StreamoraStreamsFamily();

/// See also [streamoraStreams].
class StreamoraStreamsFamily extends Family<AsyncValue<List<VideoData>>> {
  /// See also [streamoraStreams].
  const StreamoraStreamsFamily();

  /// See also [streamoraStreams].
  StreamoraStreamsProvider call({
    required ScrapeStreamsData movieData,
    required BuildContext context,
  }) {
    return StreamoraStreamsProvider(
      movieData: movieData,
      context: context,
    );
  }

  @override
  StreamoraStreamsProvider getProviderOverride(
    covariant StreamoraStreamsProvider provider,
  ) {
    return call(
      movieData: provider.movieData,
      context: provider.context,
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
  String? get name => r'streamoraStreamsProvider';
}

/// See also [streamoraStreams].
class StreamoraStreamsProvider extends FutureProvider<List<VideoData>> {
  /// See also [streamoraStreams].
  StreamoraStreamsProvider({
    required ScrapeStreamsData movieData,
    required BuildContext context,
  }) : this._internal(
          (ref) => streamoraStreams(
            ref as StreamoraStreamsRef,
            movieData: movieData,
            context: context,
          ),
          from: streamoraStreamsProvider,
          name: r'streamoraStreamsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$streamoraStreamsHash,
          dependencies: StreamoraStreamsFamily._dependencies,
          allTransitiveDependencies:
              StreamoraStreamsFamily._allTransitiveDependencies,
          movieData: movieData,
          context: context,
        );

  StreamoraStreamsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieData,
    required this.context,
  }) : super.internal();

  final ScrapeStreamsData movieData;
  final BuildContext context;

  @override
  Override overrideWith(
    FutureOr<List<VideoData>> Function(StreamoraStreamsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StreamoraStreamsProvider._internal(
        (ref) => create(ref as StreamoraStreamsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieData: movieData,
        context: context,
      ),
    );
  }

  @override
  FutureProviderElement<List<VideoData>> createElement() {
    return _StreamoraStreamsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StreamoraStreamsProvider &&
        other.movieData == movieData &&
        other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieData.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StreamoraStreamsRef on FutureProviderRef<List<VideoData>> {
  /// The parameter `movieData` of this provider.
  ScrapeStreamsData get movieData;

  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _StreamoraStreamsProviderElement
    extends FutureProviderElement<List<VideoData>> with StreamoraStreamsRef {
  _StreamoraStreamsProviderElement(super.provider);

  @override
  ScrapeStreamsData get movieData =>
      (origin as StreamoraStreamsProvider).movieData;
  @override
  BuildContext get context => (origin as StreamoraStreamsProvider).context;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
