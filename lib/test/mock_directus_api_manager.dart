import 'package:directus_api_manager/src/filter.dart';
import 'package:directus_api_manager/src/idirectus_api_manager.dart';
import 'package:directus_api_manager/src/sort_property.dart';
import 'package:directus_api_manager/src/model/directus_user.dart';
import 'package:directus_api_manager/src/model/directus_login_result.dart';
import 'package:directus_api_manager/src/model/directus_item_creation_result.dart';
import 'package:directus_api_manager/src/model/directus_file.dart';
import 'package:directus_api_manager/src/model/directus_data.dart';
import 'package:extension_dart_tools/extension_tools.dart';
import 'package:http/http.dart';

class MockDirectusApiManager extends IDirectusApiManager with MockMixin {
  @override
  Future<bool> confirmPasswordReset(
      {required String token, required String password}) {
    addCalledFunction(named: "confirmPasswordReset");
    addReceivedObject(token, name: "token");
    addReceivedObject(password, name: "password");
    return Future.value(popNextReturnedObject());
  }

  @override
  Future<DirectusItemCreationResult<Type>>
      createMultipleItems<Type extends DirectusData>(
          {String? fields, required Iterable<Type> objectList}) {
    addCalledFunction(named: "createMultipleItems");
    addReceivedObject(fields, name: "fields");
    addReceivedObject(objectList, name: "objectList");
    return Future.value(popNextReturnedObject());
  }

  @override
  Future<DirectusItemCreationResult<Type>>
      createNewItem<Type extends DirectusData>(
          {required Type objectToCreate, String? fields}) {
    addCalledFunction(named: "createNewItem");
    addReceivedObject(objectToCreate, name: "objectToCreate");
    addReceivedObject(fields, name: "fields");
    return Future.value(popNextReturnedObject());
  }

  @override
  Future<DirectusUser?> currentDirectusUser(
      {String fields = "*",
      bool canUseCacheForResponse = false,
      bool canSaveResponseToCache = true,
      bool canUseOldCachedResponseAsFallback = true,
      Duration maxCacheAge = const Duration(days: 1)}) {
    addCalledFunction(named: "currentDirectusUser");
    addReceivedObject(fields, name: "fields");
    addReceivedObject(canUseCacheForResponse, name: "canUseCacheForResponse");
    addReceivedObject(canSaveResponseToCache, name: "canSaveResponseToCache");
    addReceivedObject(canUseOldCachedResponseAsFallback,
        name: "canUseOldCachedResponseAsFallback");
    addReceivedObject(maxCacheAge, name: "maxCacheAge");
    return Future.value(popNextReturnedObject());
  }

  @override
  Future<bool> deleteFile({required String fileId}) {
    addCalledFunction(named: "deleteFile");
    addReceivedObject(fileId, name: "fileId");
    return Future.value(popNextReturnedObject());
  }

  @override
  Future<bool> deleteItem<Type extends DirectusData>(
      {required String objectId, bool mustBeAuthenticated = true}) {
    addCalledFunction(named: "deleteItem");
    addReceivedObject(objectId, name: "objectId");
    addReceivedObject(mustBeAuthenticated, name: "mustBeAuthenticated");
    return Future.value(popNextReturnedObject());
  }

  @override
  Future<bool> deleteMultipleItems<Type extends DirectusData>(
      {required Iterable objectIdsToDelete, bool mustBeAuthenticated = true}) {
    addCalledFunction(named: "deleteMultipleItems");
    addReceivedObject(objectIdsToDelete, name: "objectIdsToDelete");
    addReceivedObject(mustBeAuthenticated, name: "mustBeAuthenticated");
    return Future.value(popNextReturnedObject());
  }

  @override
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
      List<String> extraTags = const [],
      Duration maxCacheAge = const Duration(days: 1)}) {
    addCalledFunction(named: "findListOfItems");
    addReceivedObject(filter, name: "filter");
    addReceivedObject(sortBy, name: "sortBy");
    addReceivedObject(fields, name: "fields");
    addReceivedObject(limit, name: "limit");
    addReceivedObject(offset, name: "offset");
    addReceivedObject(requestIdentifier, name: "requestIdentifier");
    addReceivedObject(canUseCacheForResponse, name: "canUseCacheForResponse");
    addReceivedObject(canSaveResponseToCache, name: "canSaveResponseToCache");
    addReceivedObject(canUseOldCachedResponseAsFallback,
        name: "canUseOldCachedResponseAsFallback");
    addReceivedObject(extraTags, name: "extraTags");
    addReceivedObject(maxCacheAge, name: "maxCacheAge");
    return Future.value(popNextReturnedObject());
  }

  @override
  Future<Type?> getSpecificItem<Type extends DirectusData>(
      {required String id,
      String? fields,
      String? requestIdentifier,
      bool canUseCacheForResponse = false,
      bool canSaveResponseToCache = true,
      bool canUseOldCachedResponseAsFallback = true,
      List<String> extraTags = const [],
      Duration maxCacheAge = const Duration(days: 1)}) {
    addCalledFunction(named: "getSpecificItem");
    addReceivedObject(id, name: "id");
    addReceivedObject(fields, name: "fields");
    addReceivedObject(requestIdentifier, name: "requestIdentifier");
    addReceivedObject(canUseCacheForResponse, name: "canUseCacheForResponse");
    addReceivedObject(canSaveResponseToCache, name: "canSaveResponseToCache");
    addReceivedObject(canUseOldCachedResponseAsFallback,
        name: "canUseOldCachedResponseAsFallback");
    addReceivedObject(extraTags, name: "extraTags");
    addReceivedObject(maxCacheAge, name: "maxCacheAge");
    return Future.value(popNextReturnedObject());
  }

  @override
  Future<bool> hasLoggedInUser() {
    addCalledFunction(named: "hasLoggedInUser");
    return Future.value(popNextReturnedObject());
  }

  @override
  Future<DirectusLoginResult> loginDirectusUser(
      String username, String password,
      {String? oneTimePassword}) {
    addCalledFunction(named: "loginDirectusUser");
    addReceivedObject(username, name: "username");
    addReceivedObject(password, name: "password");
    if (oneTimePassword != null) {
      addReceivedObject(oneTimePassword, name: "otp");
    }
    return Future.value(popNextReturnedObject());
  }

  @override
  Future<bool> logoutDirectusUser() {
    addCalledFunction(named: "logoutDirectusUser");
    return Future.value(popNextReturnedObject());
  }

  @override
  Future<bool> requestPasswordReset({required String email, String? resetUrl}) {
    addCalledFunction(named: "requestPasswordReset");
    addReceivedObject(email, name: "email");
    addReceivedObject(resetUrl, name: "resetUrl");
    return Future.value(popNextReturnedObject());
  }

  @override
  Future<T> sendRequestToEndpoint<T>(
      {required BaseRequest Function() prepareRequest,
      required T Function(Response p1) jsonConverter}) {
    addCalledFunction(named: "sendRequestToEndpoint");
    addReceivedObject(prepareRequest, name: "prepareRequest");
    addReceivedObject(jsonConverter, name: "jsonConverter");
    return Future.value(popNextReturnedObject());
  }

  @override
  Future<DirectusFile> updateExistingFile(
      {required List<int> fileBytes,
      required String fileId,
      required String filename,
      String? contentType}) {
    addCalledFunction(named: "updateExistingFile");
    addReceivedObject(fileBytes, name: "fileBytes");
    addReceivedObject(fileId, name: "fileId");
    addReceivedObject(filename, name: "filename");
    addReceivedObject(contentType, name: "contentType");
    return Future.value(popNextReturnedObject());
  }

  @override
  Future<Type> updateItem<Type extends DirectusData>(
      {required Type objectToUpdate, String? fields, bool force = false}) {
    addCalledFunction(named: "updateItem");
    addReceivedObject(objectToUpdate, name: "objectToUpdate");
    addReceivedObject(fields, name: "fields");
    return Future.value(popNextReturnedObject());
  }

  @override
  Future<DirectusFile> uploadFile(
      {required List<int> fileBytes,
      required String filename,
      String? title,
      String? contentType,
      String? folder,
      String storage = "local",
      Map<String, dynamic>? additionalFields}) {
    addCalledFunction(named: "uploadFile");
    addReceivedObject(fileBytes, name: "fileBytes");
    addReceivedObject(filename, name: "filename");
    addReceivedObject(title, name: "title");
    addReceivedObject(contentType, name: "contentType");
    addReceivedObject(folder, name: "folder");
    addReceivedObject(additionalFields, name: "additionalFields");
    return Future.value(popNextReturnedObject());
  }

  @override
  Future<DirectusFile> uploadFileFromUrl(
      {required String remoteUrl, String? title, String? folder}) {
    addCalledFunction(named: "uploadFileFromUrl");
    addReceivedObject(remoteUrl, name: "remoteUrl");
    addReceivedObject(title, name: "title");
    addReceivedObject(folder, name: "folder");
    return Future.value(popNextReturnedObject());
  }

  @override
  String? get accessToken => "ABCD.1234.ABCD";

  @override
  bool get shouldRefreshToken => false;

  @override
  Future<bool> tryAndRefreshToken() {
    return Future.value(true);
  }

  @override
  String? get refreshToken => "refreshToken";

  @override
  String get webSocketBaseUrl => throw UnimplementedError();

  @override
  String get baseUrl => "http://api.com:8055";

  @override
  Future<bool> registerDirectusUser(
      {required String email,
      required String password,
      String? firstname,
      String? lastname}) {
    addCall(named: "registerDirectusUser", arguments: {
      "email": email,
      "password": password,
      "firstname": firstname,
      "lastname": lastname
    });
    return Future.value(popNextReturnedObject());
  }

  @override
  Future<void> clearCacheWithKey(String cacheEntryKey) {
    addCall(
        named: "clearCacheWithKey",
        arguments: {"cacheEntryKey": cacheEntryKey});
    return Future.value();
  }

  @override
  void discardCurrentUserCache() {
    addCall(named: "discardCurrentUserCache");
  }
}
