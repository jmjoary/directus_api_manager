import 'package:directus_api_manager/directus_api_manager.dart';
import 'package:http/http.dart';

abstract class IDirectusApiManager {
  Future<DirectusLoginResult> loginDirectusUser(
      String username, String password,
      {String? oneTimePassword});
  Future<bool> logoutDirectusUser();
  Future<bool> registerDirectusUser(
      {required String email,
      required String password,
      String? firstname,
      String? lastname});
  Future<bool> hasLoggedInUser();
  Future<DirectusUser?> currentDirectusUser(
      {String fields = "*",
      bool canUseCacheForResponse = false,
      bool canSaveResponseToCache = true,
      bool canUseOldCachedResponseAsFallback = true,
      Duration maxCacheAge = const Duration(days: 1)});

  Future<bool> requestPasswordReset({required String email, String? resetUrl});
  Future<bool> confirmPasswordReset(
      {required String token, required String password});

  Future<Iterable<Type>> findListOfItems<Type extends DirectusData>(
      {Filter? filter,
      List<SortProperty>? sortBy,
      String? fields,
      int? limit,
      int? offset,
      String? requestIdentifier,
      bool canUseCacheForResponse = false,
      bool canSaveResponseToCache = true,
      bool canUseOldCachedResponseAsFallback = true,

      /// Extra tags to associate with the cache entry
      List<String> extraTags = const [],
      Duration maxCacheAge = const Duration(days: 1)});
  Future<Type?> getSpecificItem<Type extends DirectusData>(
      {required String id,
      String? fields,
      String? requestIdentifier,
      bool canUseCacheForResponse = false,
      bool canSaveResponseToCache = true,
      bool canUseOldCachedResponseAsFallback = true,

      /// Extra tags to associate with the cache entry
      List<String> extraTags = const [],
      Duration maxCacheAge = const Duration(days: 1)});

  Future<DirectusItemCreationResult<Type>>
      createNewItem<Type extends DirectusData>({
    required Type objectToCreate,
    String? fields,
  });
  Future<DirectusItemCreationResult<Type>>
      createMultipleItems<Type extends DirectusData>(
          {String? fields, required Iterable<Type> objectList});

  Future<Type> updateItem<Type extends DirectusData>(
      {required Type objectToUpdate, String? fields, bool force = false});
  Future<bool> deleteItem<Type extends DirectusData>(
      {required String objectId, bool mustBeAuthenticated = true});
  Future<bool> deleteMultipleItems<Type extends DirectusData>(
      {required Iterable<dynamic> objectIdsToDelete,
      bool mustBeAuthenticated = true});
  Future<DirectusFile> uploadFileFromUrl(
      {required String remoteUrl, String? title, String? folder});
  Future<DirectusFile> uploadFile(
      {required List<int> fileBytes,
      required String filename,
      String? title,
      String? contentType,
      String? folder,
      String storage = "local",
      Map<String, dynamic>? additionalFields});
  Future<DirectusFile> updateExistingFile(
      {required List<int> fileBytes,
      required String fileId,
      required String filename,
      String? contentType});
  Future<bool> deleteFile({required String fileId});
  Future<T> sendRequestToEndpoint<T>(
      {required BaseRequest Function() prepareRequest,
      required T Function(Response) jsonConverter});
  bool get shouldRefreshToken;
  String? get accessToken;
  String? get refreshToken;
  Future<bool> tryAndRefreshToken();
  String get webSocketBaseUrl;
  String get baseUrl;
  Future<void> clearCacheWithKey(String cacheEntryKey);
  void discardCurrentUserCache();
}
