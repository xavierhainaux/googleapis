library googleapis.people.v1.test;

import "dart:core" as core;
import "dart:collection" as collection;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:http/testing.dart' as http_testing;
import 'package:unittest/unittest.dart' as unittest;

import 'package:googleapis/people/v1.dart' as api;

class HttpServerMock extends http.BaseClient {
  core.Function _callback;
  core.bool _expectJson;

  void register(core.Function callback, core.bool expectJson) {
    _callback = callback;
    _expectJson = expectJson;
  }

  async.Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (_expectJson) {
      return request.finalize()
          .transform(convert.UTF8.decoder)
          .join('')
          .then((core.String jsonString) {
        if (jsonString.isEmpty) {
          return _callback(request, null);
        } else {
          return _callback(request, convert.JSON.decode(jsonString));
        }
      });
    } else {
      var stream = request.finalize();
      if (stream == null) {
        return _callback(request, []);
      } else {
        return stream.toBytes().then((data) {
          return _callback(request, data);
        });
      }
    }
  }
}

http.StreamedResponse stringResponse(
    core.int status, core.Map headers, core.String body) {
  var stream = new async.Stream.fromIterable([convert.UTF8.encode(body)]);
  return new http.StreamedResponse(stream, status, headers: headers);
}

core.int buildCounterAddress = 0;
buildAddress() {
  var o = new api.Address();
  buildCounterAddress++;
  if (buildCounterAddress < 3) {
    o.city = "foo";
    o.country = "foo";
    o.countryCode = "foo";
    o.extendedAddress = "foo";
    o.formattedType = "foo";
    o.formattedValue = "foo";
    o.metadata = buildFieldMetadata();
    o.poBox = "foo";
    o.postalCode = "foo";
    o.region = "foo";
    o.streetAddress = "foo";
    o.type = "foo";
  }
  buildCounterAddress--;
  return o;
}

checkAddress(api.Address o) {
  buildCounterAddress++;
  if (buildCounterAddress < 3) {
    unittest.expect(o.city, unittest.equals('foo'));
    unittest.expect(o.country, unittest.equals('foo'));
    unittest.expect(o.countryCode, unittest.equals('foo'));
    unittest.expect(o.extendedAddress, unittest.equals('foo'));
    unittest.expect(o.formattedType, unittest.equals('foo'));
    unittest.expect(o.formattedValue, unittest.equals('foo'));
    checkFieldMetadata(o.metadata);
    unittest.expect(o.poBox, unittest.equals('foo'));
    unittest.expect(o.postalCode, unittest.equals('foo'));
    unittest.expect(o.region, unittest.equals('foo'));
    unittest.expect(o.streetAddress, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterAddress--;
}

core.int buildCounterBiography = 0;
buildBiography() {
  var o = new api.Biography();
  buildCounterBiography++;
  if (buildCounterBiography < 3) {
    o.metadata = buildFieldMetadata();
    o.value = "foo";
  }
  buildCounterBiography--;
  return o;
}

checkBiography(api.Biography o) {
  buildCounterBiography++;
  if (buildCounterBiography < 3) {
    checkFieldMetadata(o.metadata);
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterBiography--;
}

core.int buildCounterBirthday = 0;
buildBirthday() {
  var o = new api.Birthday();
  buildCounterBirthday++;
  if (buildCounterBirthday < 3) {
    o.date = buildDate();
    o.metadata = buildFieldMetadata();
    o.text = "foo";
  }
  buildCounterBirthday--;
  return o;
}

checkBirthday(api.Birthday o) {
  buildCounterBirthday++;
  if (buildCounterBirthday < 3) {
    checkDate(o.date);
    checkFieldMetadata(o.metadata);
    unittest.expect(o.text, unittest.equals('foo'));
  }
  buildCounterBirthday--;
}

core.int buildCounterBraggingRights = 0;
buildBraggingRights() {
  var o = new api.BraggingRights();
  buildCounterBraggingRights++;
  if (buildCounterBraggingRights < 3) {
    o.metadata = buildFieldMetadata();
    o.value = "foo";
  }
  buildCounterBraggingRights--;
  return o;
}

checkBraggingRights(api.BraggingRights o) {
  buildCounterBraggingRights++;
  if (buildCounterBraggingRights < 3) {
    checkFieldMetadata(o.metadata);
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterBraggingRights--;
}

core.int buildCounterContactGroupMembership = 0;
buildContactGroupMembership() {
  var o = new api.ContactGroupMembership();
  buildCounterContactGroupMembership++;
  if (buildCounterContactGroupMembership < 3) {
    o.contactGroupId = "foo";
  }
  buildCounterContactGroupMembership--;
  return o;
}

checkContactGroupMembership(api.ContactGroupMembership o) {
  buildCounterContactGroupMembership++;
  if (buildCounterContactGroupMembership < 3) {
    unittest.expect(o.contactGroupId, unittest.equals('foo'));
  }
  buildCounterContactGroupMembership--;
}

core.int buildCounterCoverPhoto = 0;
buildCoverPhoto() {
  var o = new api.CoverPhoto();
  buildCounterCoverPhoto++;
  if (buildCounterCoverPhoto < 3) {
    o.default_ = true;
    o.metadata = buildFieldMetadata();
    o.url = "foo";
  }
  buildCounterCoverPhoto--;
  return o;
}

checkCoverPhoto(api.CoverPhoto o) {
  buildCounterCoverPhoto++;
  if (buildCounterCoverPhoto < 3) {
    unittest.expect(o.default_, unittest.isTrue);
    checkFieldMetadata(o.metadata);
    unittest.expect(o.url, unittest.equals('foo'));
  }
  buildCounterCoverPhoto--;
}

core.int buildCounterDate = 0;
buildDate() {
  var o = new api.Date();
  buildCounterDate++;
  if (buildCounterDate < 3) {
    o.day = 42;
    o.month = 42;
    o.year = 42;
  }
  buildCounterDate--;
  return o;
}

checkDate(api.Date o) {
  buildCounterDate++;
  if (buildCounterDate < 3) {
    unittest.expect(o.day, unittest.equals(42));
    unittest.expect(o.month, unittest.equals(42));
    unittest.expect(o.year, unittest.equals(42));
  }
  buildCounterDate--;
}

core.int buildCounterDomainMembership = 0;
buildDomainMembership() {
  var o = new api.DomainMembership();
  buildCounterDomainMembership++;
  if (buildCounterDomainMembership < 3) {
    o.inViewerDomain = true;
  }
  buildCounterDomainMembership--;
  return o;
}

checkDomainMembership(api.DomainMembership o) {
  buildCounterDomainMembership++;
  if (buildCounterDomainMembership < 3) {
    unittest.expect(o.inViewerDomain, unittest.isTrue);
  }
  buildCounterDomainMembership--;
}

core.int buildCounterEmailAddress = 0;
buildEmailAddress() {
  var o = new api.EmailAddress();
  buildCounterEmailAddress++;
  if (buildCounterEmailAddress < 3) {
    o.formattedType = "foo";
    o.metadata = buildFieldMetadata();
    o.type = "foo";
    o.value = "foo";
  }
  buildCounterEmailAddress--;
  return o;
}

checkEmailAddress(api.EmailAddress o) {
  buildCounterEmailAddress++;
  if (buildCounterEmailAddress < 3) {
    unittest.expect(o.formattedType, unittest.equals('foo'));
    checkFieldMetadata(o.metadata);
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterEmailAddress--;
}

core.int buildCounterEvent = 0;
buildEvent() {
  var o = new api.Event();
  buildCounterEvent++;
  if (buildCounterEvent < 3) {
    o.date = buildDate();
    o.formattedType = "foo";
    o.metadata = buildFieldMetadata();
    o.type = "foo";
  }
  buildCounterEvent--;
  return o;
}

checkEvent(api.Event o) {
  buildCounterEvent++;
  if (buildCounterEvent < 3) {
    checkDate(o.date);
    unittest.expect(o.formattedType, unittest.equals('foo'));
    checkFieldMetadata(o.metadata);
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterEvent--;
}

core.int buildCounterFieldMetadata = 0;
buildFieldMetadata() {
  var o = new api.FieldMetadata();
  buildCounterFieldMetadata++;
  if (buildCounterFieldMetadata < 3) {
    o.primary = true;
    o.source = buildSource();
    o.verified = true;
  }
  buildCounterFieldMetadata--;
  return o;
}

checkFieldMetadata(api.FieldMetadata o) {
  buildCounterFieldMetadata++;
  if (buildCounterFieldMetadata < 3) {
    unittest.expect(o.primary, unittest.isTrue);
    checkSource(o.source);
    unittest.expect(o.verified, unittest.isTrue);
  }
  buildCounterFieldMetadata--;
}

core.int buildCounterGender = 0;
buildGender() {
  var o = new api.Gender();
  buildCounterGender++;
  if (buildCounterGender < 3) {
    o.formattedValue = "foo";
    o.metadata = buildFieldMetadata();
    o.value = "foo";
  }
  buildCounterGender--;
  return o;
}

checkGender(api.Gender o) {
  buildCounterGender++;
  if (buildCounterGender < 3) {
    unittest.expect(o.formattedValue, unittest.equals('foo'));
    checkFieldMetadata(o.metadata);
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterGender--;
}

buildUnnamed1305() {
  var o = new core.List<api.PersonResponse>();
  o.add(buildPersonResponse());
  o.add(buildPersonResponse());
  return o;
}

checkUnnamed1305(core.List<api.PersonResponse> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPersonResponse(o[0]);
  checkPersonResponse(o[1]);
}

core.int buildCounterGetPeopleResponse = 0;
buildGetPeopleResponse() {
  var o = new api.GetPeopleResponse();
  buildCounterGetPeopleResponse++;
  if (buildCounterGetPeopleResponse < 3) {
    o.responses = buildUnnamed1305();
  }
  buildCounterGetPeopleResponse--;
  return o;
}

checkGetPeopleResponse(api.GetPeopleResponse o) {
  buildCounterGetPeopleResponse++;
  if (buildCounterGetPeopleResponse < 3) {
    checkUnnamed1305(o.responses);
  }
  buildCounterGetPeopleResponse--;
}

core.int buildCounterImClient = 0;
buildImClient() {
  var o = new api.ImClient();
  buildCounterImClient++;
  if (buildCounterImClient < 3) {
    o.formattedProtocol = "foo";
    o.formattedType = "foo";
    o.metadata = buildFieldMetadata();
    o.protocol = "foo";
    o.type = "foo";
    o.username = "foo";
  }
  buildCounterImClient--;
  return o;
}

checkImClient(api.ImClient o) {
  buildCounterImClient++;
  if (buildCounterImClient < 3) {
    unittest.expect(o.formattedProtocol, unittest.equals('foo'));
    unittest.expect(o.formattedType, unittest.equals('foo'));
    checkFieldMetadata(o.metadata);
    unittest.expect(o.protocol, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.username, unittest.equals('foo'));
  }
  buildCounterImClient--;
}

core.int buildCounterInterest = 0;
buildInterest() {
  var o = new api.Interest();
  buildCounterInterest++;
  if (buildCounterInterest < 3) {
    o.metadata = buildFieldMetadata();
    o.value = "foo";
  }
  buildCounterInterest--;
  return o;
}

checkInterest(api.Interest o) {
  buildCounterInterest++;
  if (buildCounterInterest < 3) {
    checkFieldMetadata(o.metadata);
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterInterest--;
}

buildUnnamed1306() {
  var o = new core.List<api.Person>();
  o.add(buildPerson());
  o.add(buildPerson());
  return o;
}

checkUnnamed1306(core.List<api.Person> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPerson(o[0]);
  checkPerson(o[1]);
}

core.int buildCounterListConnectionsResponse = 0;
buildListConnectionsResponse() {
  var o = new api.ListConnectionsResponse();
  buildCounterListConnectionsResponse++;
  if (buildCounterListConnectionsResponse < 3) {
    o.connections = buildUnnamed1306();
    o.nextPageToken = "foo";
    o.nextSyncToken = "foo";
  }
  buildCounterListConnectionsResponse--;
  return o;
}

checkListConnectionsResponse(api.ListConnectionsResponse o) {
  buildCounterListConnectionsResponse++;
  if (buildCounterListConnectionsResponse < 3) {
    checkUnnamed1306(o.connections);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.nextSyncToken, unittest.equals('foo'));
  }
  buildCounterListConnectionsResponse--;
}

core.int buildCounterLocale = 0;
buildLocale() {
  var o = new api.Locale();
  buildCounterLocale++;
  if (buildCounterLocale < 3) {
    o.metadata = buildFieldMetadata();
    o.value = "foo";
  }
  buildCounterLocale--;
  return o;
}

checkLocale(api.Locale o) {
  buildCounterLocale++;
  if (buildCounterLocale < 3) {
    checkFieldMetadata(o.metadata);
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterLocale--;
}

core.int buildCounterMembership = 0;
buildMembership() {
  var o = new api.Membership();
  buildCounterMembership++;
  if (buildCounterMembership < 3) {
    o.contactGroupMembership = buildContactGroupMembership();
    o.domainMembership = buildDomainMembership();
    o.metadata = buildFieldMetadata();
  }
  buildCounterMembership--;
  return o;
}

checkMembership(api.Membership o) {
  buildCounterMembership++;
  if (buildCounterMembership < 3) {
    checkContactGroupMembership(o.contactGroupMembership);
    checkDomainMembership(o.domainMembership);
    checkFieldMetadata(o.metadata);
  }
  buildCounterMembership--;
}

core.int buildCounterName = 0;
buildName() {
  var o = new api.Name();
  buildCounterName++;
  if (buildCounterName < 3) {
    o.displayName = "foo";
    o.familyName = "foo";
    o.givenName = "foo";
    o.honorificPrefix = "foo";
    o.honorificSuffix = "foo";
    o.metadata = buildFieldMetadata();
    o.middleName = "foo";
    o.phoneticFamilyName = "foo";
    o.phoneticGivenName = "foo";
    o.phoneticHonorificPrefix = "foo";
    o.phoneticHonorificSuffix = "foo";
    o.phoneticMiddleName = "foo";
  }
  buildCounterName--;
  return o;
}

checkName(api.Name o) {
  buildCounterName++;
  if (buildCounterName < 3) {
    unittest.expect(o.displayName, unittest.equals('foo'));
    unittest.expect(o.familyName, unittest.equals('foo'));
    unittest.expect(o.givenName, unittest.equals('foo'));
    unittest.expect(o.honorificPrefix, unittest.equals('foo'));
    unittest.expect(o.honorificSuffix, unittest.equals('foo'));
    checkFieldMetadata(o.metadata);
    unittest.expect(o.middleName, unittest.equals('foo'));
    unittest.expect(o.phoneticFamilyName, unittest.equals('foo'));
    unittest.expect(o.phoneticGivenName, unittest.equals('foo'));
    unittest.expect(o.phoneticHonorificPrefix, unittest.equals('foo'));
    unittest.expect(o.phoneticHonorificSuffix, unittest.equals('foo'));
    unittest.expect(o.phoneticMiddleName, unittest.equals('foo'));
  }
  buildCounterName--;
}

core.int buildCounterNickname = 0;
buildNickname() {
  var o = new api.Nickname();
  buildCounterNickname++;
  if (buildCounterNickname < 3) {
    o.metadata = buildFieldMetadata();
    o.type = "foo";
    o.value = "foo";
  }
  buildCounterNickname--;
  return o;
}

checkNickname(api.Nickname o) {
  buildCounterNickname++;
  if (buildCounterNickname < 3) {
    checkFieldMetadata(o.metadata);
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterNickname--;
}

core.int buildCounterOccupation = 0;
buildOccupation() {
  var o = new api.Occupation();
  buildCounterOccupation++;
  if (buildCounterOccupation < 3) {
    o.metadata = buildFieldMetadata();
    o.value = "foo";
  }
  buildCounterOccupation--;
  return o;
}

checkOccupation(api.Occupation o) {
  buildCounterOccupation++;
  if (buildCounterOccupation < 3) {
    checkFieldMetadata(o.metadata);
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterOccupation--;
}

core.int buildCounterOrganization = 0;
buildOrganization() {
  var o = new api.Organization();
  buildCounterOrganization++;
  if (buildCounterOrganization < 3) {
    o.current = true;
    o.department = "foo";
    o.domain = "foo";
    o.endDate = buildDate();
    o.formattedType = "foo";
    o.jobDescription = "foo";
    o.location = "foo";
    o.metadata = buildFieldMetadata();
    o.name = "foo";
    o.phoneticName = "foo";
    o.startDate = buildDate();
    o.symbol = "foo";
    o.title = "foo";
    o.type = "foo";
  }
  buildCounterOrganization--;
  return o;
}

checkOrganization(api.Organization o) {
  buildCounterOrganization++;
  if (buildCounterOrganization < 3) {
    unittest.expect(o.current, unittest.isTrue);
    unittest.expect(o.department, unittest.equals('foo'));
    unittest.expect(o.domain, unittest.equals('foo'));
    checkDate(o.endDate);
    unittest.expect(o.formattedType, unittest.equals('foo'));
    unittest.expect(o.jobDescription, unittest.equals('foo'));
    unittest.expect(o.location, unittest.equals('foo'));
    checkFieldMetadata(o.metadata);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.phoneticName, unittest.equals('foo'));
    checkDate(o.startDate);
    unittest.expect(o.symbol, unittest.equals('foo'));
    unittest.expect(o.title, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterOrganization--;
}

buildUnnamed1307() {
  var o = new core.List<api.Address>();
  o.add(buildAddress());
  o.add(buildAddress());
  return o;
}

checkUnnamed1307(core.List<api.Address> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAddress(o[0]);
  checkAddress(o[1]);
}

buildUnnamed1308() {
  var o = new core.List<api.Biography>();
  o.add(buildBiography());
  o.add(buildBiography());
  return o;
}

checkUnnamed1308(core.List<api.Biography> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkBiography(o[0]);
  checkBiography(o[1]);
}

buildUnnamed1309() {
  var o = new core.List<api.Birthday>();
  o.add(buildBirthday());
  o.add(buildBirthday());
  return o;
}

checkUnnamed1309(core.List<api.Birthday> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkBirthday(o[0]);
  checkBirthday(o[1]);
}

buildUnnamed1310() {
  var o = new core.List<api.BraggingRights>();
  o.add(buildBraggingRights());
  o.add(buildBraggingRights());
  return o;
}

checkUnnamed1310(core.List<api.BraggingRights> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkBraggingRights(o[0]);
  checkBraggingRights(o[1]);
}

buildUnnamed1311() {
  var o = new core.List<api.CoverPhoto>();
  o.add(buildCoverPhoto());
  o.add(buildCoverPhoto());
  return o;
}

checkUnnamed1311(core.List<api.CoverPhoto> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCoverPhoto(o[0]);
  checkCoverPhoto(o[1]);
}

buildUnnamed1312() {
  var o = new core.List<api.EmailAddress>();
  o.add(buildEmailAddress());
  o.add(buildEmailAddress());
  return o;
}

checkUnnamed1312(core.List<api.EmailAddress> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkEmailAddress(o[0]);
  checkEmailAddress(o[1]);
}

buildUnnamed1313() {
  var o = new core.List<api.Event>();
  o.add(buildEvent());
  o.add(buildEvent());
  return o;
}

checkUnnamed1313(core.List<api.Event> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkEvent(o[0]);
  checkEvent(o[1]);
}

buildUnnamed1314() {
  var o = new core.List<api.Gender>();
  o.add(buildGender());
  o.add(buildGender());
  return o;
}

checkUnnamed1314(core.List<api.Gender> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkGender(o[0]);
  checkGender(o[1]);
}

buildUnnamed1315() {
  var o = new core.List<api.ImClient>();
  o.add(buildImClient());
  o.add(buildImClient());
  return o;
}

checkUnnamed1315(core.List<api.ImClient> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkImClient(o[0]);
  checkImClient(o[1]);
}

buildUnnamed1316() {
  var o = new core.List<api.Interest>();
  o.add(buildInterest());
  o.add(buildInterest());
  return o;
}

checkUnnamed1316(core.List<api.Interest> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInterest(o[0]);
  checkInterest(o[1]);
}

buildUnnamed1317() {
  var o = new core.List<api.Locale>();
  o.add(buildLocale());
  o.add(buildLocale());
  return o;
}

checkUnnamed1317(core.List<api.Locale> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkLocale(o[0]);
  checkLocale(o[1]);
}

buildUnnamed1318() {
  var o = new core.List<api.Membership>();
  o.add(buildMembership());
  o.add(buildMembership());
  return o;
}

checkUnnamed1318(core.List<api.Membership> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMembership(o[0]);
  checkMembership(o[1]);
}

buildUnnamed1319() {
  var o = new core.List<api.Name>();
  o.add(buildName());
  o.add(buildName());
  return o;
}

checkUnnamed1319(core.List<api.Name> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkName(o[0]);
  checkName(o[1]);
}

buildUnnamed1320() {
  var o = new core.List<api.Nickname>();
  o.add(buildNickname());
  o.add(buildNickname());
  return o;
}

checkUnnamed1320(core.List<api.Nickname> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkNickname(o[0]);
  checkNickname(o[1]);
}

buildUnnamed1321() {
  var o = new core.List<api.Occupation>();
  o.add(buildOccupation());
  o.add(buildOccupation());
  return o;
}

checkUnnamed1321(core.List<api.Occupation> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOccupation(o[0]);
  checkOccupation(o[1]);
}

buildUnnamed1322() {
  var o = new core.List<api.Organization>();
  o.add(buildOrganization());
  o.add(buildOrganization());
  return o;
}

checkUnnamed1322(core.List<api.Organization> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOrganization(o[0]);
  checkOrganization(o[1]);
}

buildUnnamed1323() {
  var o = new core.List<api.PhoneNumber>();
  o.add(buildPhoneNumber());
  o.add(buildPhoneNumber());
  return o;
}

checkUnnamed1323(core.List<api.PhoneNumber> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPhoneNumber(o[0]);
  checkPhoneNumber(o[1]);
}

buildUnnamed1324() {
  var o = new core.List<api.Photo>();
  o.add(buildPhoto());
  o.add(buildPhoto());
  return o;
}

checkUnnamed1324(core.List<api.Photo> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPhoto(o[0]);
  checkPhoto(o[1]);
}

buildUnnamed1325() {
  var o = new core.List<api.Relation>();
  o.add(buildRelation());
  o.add(buildRelation());
  return o;
}

checkUnnamed1325(core.List<api.Relation> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRelation(o[0]);
  checkRelation(o[1]);
}

buildUnnamed1326() {
  var o = new core.List<api.RelationshipInterest>();
  o.add(buildRelationshipInterest());
  o.add(buildRelationshipInterest());
  return o;
}

checkUnnamed1326(core.List<api.RelationshipInterest> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRelationshipInterest(o[0]);
  checkRelationshipInterest(o[1]);
}

buildUnnamed1327() {
  var o = new core.List<api.RelationshipStatus>();
  o.add(buildRelationshipStatus());
  o.add(buildRelationshipStatus());
  return o;
}

checkUnnamed1327(core.List<api.RelationshipStatus> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRelationshipStatus(o[0]);
  checkRelationshipStatus(o[1]);
}

buildUnnamed1328() {
  var o = new core.List<api.Residence>();
  o.add(buildResidence());
  o.add(buildResidence());
  return o;
}

checkUnnamed1328(core.List<api.Residence> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkResidence(o[0]);
  checkResidence(o[1]);
}

buildUnnamed1329() {
  var o = new core.List<api.Skill>();
  o.add(buildSkill());
  o.add(buildSkill());
  return o;
}

checkUnnamed1329(core.List<api.Skill> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSkill(o[0]);
  checkSkill(o[1]);
}

buildUnnamed1330() {
  var o = new core.List<api.Tagline>();
  o.add(buildTagline());
  o.add(buildTagline());
  return o;
}

checkUnnamed1330(core.List<api.Tagline> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTagline(o[0]);
  checkTagline(o[1]);
}

buildUnnamed1331() {
  var o = new core.List<api.Url>();
  o.add(buildUrl());
  o.add(buildUrl());
  return o;
}

checkUnnamed1331(core.List<api.Url> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUrl(o[0]);
  checkUrl(o[1]);
}

core.int buildCounterPerson = 0;
buildPerson() {
  var o = new api.Person();
  buildCounterPerson++;
  if (buildCounterPerson < 3) {
    o.addresses = buildUnnamed1307();
    o.ageRange = "foo";
    o.biographies = buildUnnamed1308();
    o.birthdays = buildUnnamed1309();
    o.braggingRights = buildUnnamed1310();
    o.coverPhotos = buildUnnamed1311();
    o.emailAddresses = buildUnnamed1312();
    o.etag = "foo";
    o.events = buildUnnamed1313();
    o.genders = buildUnnamed1314();
    o.imClients = buildUnnamed1315();
    o.interests = buildUnnamed1316();
    o.locales = buildUnnamed1317();
    o.memberships = buildUnnamed1318();
    o.metadata = buildPersonMetadata();
    o.names = buildUnnamed1319();
    o.nicknames = buildUnnamed1320();
    o.occupations = buildUnnamed1321();
    o.organizations = buildUnnamed1322();
    o.phoneNumbers = buildUnnamed1323();
    o.photos = buildUnnamed1324();
    o.relations = buildUnnamed1325();
    o.relationshipInterests = buildUnnamed1326();
    o.relationshipStatuses = buildUnnamed1327();
    o.residences = buildUnnamed1328();
    o.resourceName = "foo";
    o.skills = buildUnnamed1329();
    o.taglines = buildUnnamed1330();
    o.urls = buildUnnamed1331();
  }
  buildCounterPerson--;
  return o;
}

checkPerson(api.Person o) {
  buildCounterPerson++;
  if (buildCounterPerson < 3) {
    checkUnnamed1307(o.addresses);
    unittest.expect(o.ageRange, unittest.equals('foo'));
    checkUnnamed1308(o.biographies);
    checkUnnamed1309(o.birthdays);
    checkUnnamed1310(o.braggingRights);
    checkUnnamed1311(o.coverPhotos);
    checkUnnamed1312(o.emailAddresses);
    unittest.expect(o.etag, unittest.equals('foo'));
    checkUnnamed1313(o.events);
    checkUnnamed1314(o.genders);
    checkUnnamed1315(o.imClients);
    checkUnnamed1316(o.interests);
    checkUnnamed1317(o.locales);
    checkUnnamed1318(o.memberships);
    checkPersonMetadata(o.metadata);
    checkUnnamed1319(o.names);
    checkUnnamed1320(o.nicknames);
    checkUnnamed1321(o.occupations);
    checkUnnamed1322(o.organizations);
    checkUnnamed1323(o.phoneNumbers);
    checkUnnamed1324(o.photos);
    checkUnnamed1325(o.relations);
    checkUnnamed1326(o.relationshipInterests);
    checkUnnamed1327(o.relationshipStatuses);
    checkUnnamed1328(o.residences);
    unittest.expect(o.resourceName, unittest.equals('foo'));
    checkUnnamed1329(o.skills);
    checkUnnamed1330(o.taglines);
    checkUnnamed1331(o.urls);
  }
  buildCounterPerson--;
}

buildUnnamed1332() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed1332(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed1333() {
  var o = new core.List<api.Source>();
  o.add(buildSource());
  o.add(buildSource());
  return o;
}

checkUnnamed1333(core.List<api.Source> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSource(o[0]);
  checkSource(o[1]);
}

core.int buildCounterPersonMetadata = 0;
buildPersonMetadata() {
  var o = new api.PersonMetadata();
  buildCounterPersonMetadata++;
  if (buildCounterPersonMetadata < 3) {
    o.deleted = true;
    o.objectType = "foo";
    o.previousResourceNames = buildUnnamed1332();
    o.sources = buildUnnamed1333();
  }
  buildCounterPersonMetadata--;
  return o;
}

checkPersonMetadata(api.PersonMetadata o) {
  buildCounterPersonMetadata++;
  if (buildCounterPersonMetadata < 3) {
    unittest.expect(o.deleted, unittest.isTrue);
    unittest.expect(o.objectType, unittest.equals('foo'));
    checkUnnamed1332(o.previousResourceNames);
    checkUnnamed1333(o.sources);
  }
  buildCounterPersonMetadata--;
}

core.int buildCounterPersonResponse = 0;
buildPersonResponse() {
  var o = new api.PersonResponse();
  buildCounterPersonResponse++;
  if (buildCounterPersonResponse < 3) {
    o.httpStatusCode = 42;
    o.person = buildPerson();
    o.requestedResourceName = "foo";
  }
  buildCounterPersonResponse--;
  return o;
}

checkPersonResponse(api.PersonResponse o) {
  buildCounterPersonResponse++;
  if (buildCounterPersonResponse < 3) {
    unittest.expect(o.httpStatusCode, unittest.equals(42));
    checkPerson(o.person);
    unittest.expect(o.requestedResourceName, unittest.equals('foo'));
  }
  buildCounterPersonResponse--;
}

core.int buildCounterPhoneNumber = 0;
buildPhoneNumber() {
  var o = new api.PhoneNumber();
  buildCounterPhoneNumber++;
  if (buildCounterPhoneNumber < 3) {
    o.canonicalForm = "foo";
    o.formattedType = "foo";
    o.metadata = buildFieldMetadata();
    o.type = "foo";
    o.value = "foo";
  }
  buildCounterPhoneNumber--;
  return o;
}

checkPhoneNumber(api.PhoneNumber o) {
  buildCounterPhoneNumber++;
  if (buildCounterPhoneNumber < 3) {
    unittest.expect(o.canonicalForm, unittest.equals('foo'));
    unittest.expect(o.formattedType, unittest.equals('foo'));
    checkFieldMetadata(o.metadata);
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterPhoneNumber--;
}

core.int buildCounterPhoto = 0;
buildPhoto() {
  var o = new api.Photo();
  buildCounterPhoto++;
  if (buildCounterPhoto < 3) {
    o.metadata = buildFieldMetadata();
    o.url = "foo";
  }
  buildCounterPhoto--;
  return o;
}

checkPhoto(api.Photo o) {
  buildCounterPhoto++;
  if (buildCounterPhoto < 3) {
    checkFieldMetadata(o.metadata);
    unittest.expect(o.url, unittest.equals('foo'));
  }
  buildCounterPhoto--;
}

core.int buildCounterRelation = 0;
buildRelation() {
  var o = new api.Relation();
  buildCounterRelation++;
  if (buildCounterRelation < 3) {
    o.formattedType = "foo";
    o.metadata = buildFieldMetadata();
    o.person = "foo";
    o.type = "foo";
  }
  buildCounterRelation--;
  return o;
}

checkRelation(api.Relation o) {
  buildCounterRelation++;
  if (buildCounterRelation < 3) {
    unittest.expect(o.formattedType, unittest.equals('foo'));
    checkFieldMetadata(o.metadata);
    unittest.expect(o.person, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterRelation--;
}

core.int buildCounterRelationshipInterest = 0;
buildRelationshipInterest() {
  var o = new api.RelationshipInterest();
  buildCounterRelationshipInterest++;
  if (buildCounterRelationshipInterest < 3) {
    o.formattedValue = "foo";
    o.metadata = buildFieldMetadata();
    o.value = "foo";
  }
  buildCounterRelationshipInterest--;
  return o;
}

checkRelationshipInterest(api.RelationshipInterest o) {
  buildCounterRelationshipInterest++;
  if (buildCounterRelationshipInterest < 3) {
    unittest.expect(o.formattedValue, unittest.equals('foo'));
    checkFieldMetadata(o.metadata);
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterRelationshipInterest--;
}

core.int buildCounterRelationshipStatus = 0;
buildRelationshipStatus() {
  var o = new api.RelationshipStatus();
  buildCounterRelationshipStatus++;
  if (buildCounterRelationshipStatus < 3) {
    o.formattedValue = "foo";
    o.metadata = buildFieldMetadata();
    o.value = "foo";
  }
  buildCounterRelationshipStatus--;
  return o;
}

checkRelationshipStatus(api.RelationshipStatus o) {
  buildCounterRelationshipStatus++;
  if (buildCounterRelationshipStatus < 3) {
    unittest.expect(o.formattedValue, unittest.equals('foo'));
    checkFieldMetadata(o.metadata);
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterRelationshipStatus--;
}

core.int buildCounterResidence = 0;
buildResidence() {
  var o = new api.Residence();
  buildCounterResidence++;
  if (buildCounterResidence < 3) {
    o.current = true;
    o.metadata = buildFieldMetadata();
    o.value = "foo";
  }
  buildCounterResidence--;
  return o;
}

checkResidence(api.Residence o) {
  buildCounterResidence++;
  if (buildCounterResidence < 3) {
    unittest.expect(o.current, unittest.isTrue);
    checkFieldMetadata(o.metadata);
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterResidence--;
}

core.int buildCounterSkill = 0;
buildSkill() {
  var o = new api.Skill();
  buildCounterSkill++;
  if (buildCounterSkill < 3) {
    o.metadata = buildFieldMetadata();
    o.value = "foo";
  }
  buildCounterSkill--;
  return o;
}

checkSkill(api.Skill o) {
  buildCounterSkill++;
  if (buildCounterSkill < 3) {
    checkFieldMetadata(o.metadata);
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterSkill--;
}

core.int buildCounterSource = 0;
buildSource() {
  var o = new api.Source();
  buildCounterSource++;
  if (buildCounterSource < 3) {
    o.id = "foo";
    o.type = "foo";
  }
  buildCounterSource--;
  return o;
}

checkSource(api.Source o) {
  buildCounterSource++;
  if (buildCounterSource < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterSource--;
}

core.int buildCounterTagline = 0;
buildTagline() {
  var o = new api.Tagline();
  buildCounterTagline++;
  if (buildCounterTagline < 3) {
    o.metadata = buildFieldMetadata();
    o.value = "foo";
  }
  buildCounterTagline--;
  return o;
}

checkTagline(api.Tagline o) {
  buildCounterTagline++;
  if (buildCounterTagline < 3) {
    checkFieldMetadata(o.metadata);
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterTagline--;
}

core.int buildCounterUrl = 0;
buildUrl() {
  var o = new api.Url();
  buildCounterUrl++;
  if (buildCounterUrl < 3) {
    o.formattedType = "foo";
    o.metadata = buildFieldMetadata();
    o.type = "foo";
    o.value = "foo";
  }
  buildCounterUrl--;
  return o;
}

checkUrl(api.Url o) {
  buildCounterUrl++;
  if (buildCounterUrl < 3) {
    unittest.expect(o.formattedType, unittest.equals('foo'));
    checkFieldMetadata(o.metadata);
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterUrl--;
}

buildUnnamed1334() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed1334(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}


main() {
  unittest.group("obj-schema-Address", () {
    unittest.test("to-json--from-json", () {
      var o = buildAddress();
      var od = new api.Address.fromJson(o.toJson());
      checkAddress(od);
    });
  });


  unittest.group("obj-schema-Biography", () {
    unittest.test("to-json--from-json", () {
      var o = buildBiography();
      var od = new api.Biography.fromJson(o.toJson());
      checkBiography(od);
    });
  });


  unittest.group("obj-schema-Birthday", () {
    unittest.test("to-json--from-json", () {
      var o = buildBirthday();
      var od = new api.Birthday.fromJson(o.toJson());
      checkBirthday(od);
    });
  });


  unittest.group("obj-schema-BraggingRights", () {
    unittest.test("to-json--from-json", () {
      var o = buildBraggingRights();
      var od = new api.BraggingRights.fromJson(o.toJson());
      checkBraggingRights(od);
    });
  });


  unittest.group("obj-schema-ContactGroupMembership", () {
    unittest.test("to-json--from-json", () {
      var o = buildContactGroupMembership();
      var od = new api.ContactGroupMembership.fromJson(o.toJson());
      checkContactGroupMembership(od);
    });
  });


  unittest.group("obj-schema-CoverPhoto", () {
    unittest.test("to-json--from-json", () {
      var o = buildCoverPhoto();
      var od = new api.CoverPhoto.fromJson(o.toJson());
      checkCoverPhoto(od);
    });
  });


  unittest.group("obj-schema-Date", () {
    unittest.test("to-json--from-json", () {
      var o = buildDate();
      var od = new api.Date.fromJson(o.toJson());
      checkDate(od);
    });
  });


  unittest.group("obj-schema-DomainMembership", () {
    unittest.test("to-json--from-json", () {
      var o = buildDomainMembership();
      var od = new api.DomainMembership.fromJson(o.toJson());
      checkDomainMembership(od);
    });
  });


  unittest.group("obj-schema-EmailAddress", () {
    unittest.test("to-json--from-json", () {
      var o = buildEmailAddress();
      var od = new api.EmailAddress.fromJson(o.toJson());
      checkEmailAddress(od);
    });
  });


  unittest.group("obj-schema-Event", () {
    unittest.test("to-json--from-json", () {
      var o = buildEvent();
      var od = new api.Event.fromJson(o.toJson());
      checkEvent(od);
    });
  });


  unittest.group("obj-schema-FieldMetadata", () {
    unittest.test("to-json--from-json", () {
      var o = buildFieldMetadata();
      var od = new api.FieldMetadata.fromJson(o.toJson());
      checkFieldMetadata(od);
    });
  });


  unittest.group("obj-schema-Gender", () {
    unittest.test("to-json--from-json", () {
      var o = buildGender();
      var od = new api.Gender.fromJson(o.toJson());
      checkGender(od);
    });
  });


  unittest.group("obj-schema-GetPeopleResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildGetPeopleResponse();
      var od = new api.GetPeopleResponse.fromJson(o.toJson());
      checkGetPeopleResponse(od);
    });
  });


  unittest.group("obj-schema-ImClient", () {
    unittest.test("to-json--from-json", () {
      var o = buildImClient();
      var od = new api.ImClient.fromJson(o.toJson());
      checkImClient(od);
    });
  });


  unittest.group("obj-schema-Interest", () {
    unittest.test("to-json--from-json", () {
      var o = buildInterest();
      var od = new api.Interest.fromJson(o.toJson());
      checkInterest(od);
    });
  });


  unittest.group("obj-schema-ListConnectionsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListConnectionsResponse();
      var od = new api.ListConnectionsResponse.fromJson(o.toJson());
      checkListConnectionsResponse(od);
    });
  });


  unittest.group("obj-schema-Locale", () {
    unittest.test("to-json--from-json", () {
      var o = buildLocale();
      var od = new api.Locale.fromJson(o.toJson());
      checkLocale(od);
    });
  });


  unittest.group("obj-schema-Membership", () {
    unittest.test("to-json--from-json", () {
      var o = buildMembership();
      var od = new api.Membership.fromJson(o.toJson());
      checkMembership(od);
    });
  });


  unittest.group("obj-schema-Name", () {
    unittest.test("to-json--from-json", () {
      var o = buildName();
      var od = new api.Name.fromJson(o.toJson());
      checkName(od);
    });
  });


  unittest.group("obj-schema-Nickname", () {
    unittest.test("to-json--from-json", () {
      var o = buildNickname();
      var od = new api.Nickname.fromJson(o.toJson());
      checkNickname(od);
    });
  });


  unittest.group("obj-schema-Occupation", () {
    unittest.test("to-json--from-json", () {
      var o = buildOccupation();
      var od = new api.Occupation.fromJson(o.toJson());
      checkOccupation(od);
    });
  });


  unittest.group("obj-schema-Organization", () {
    unittest.test("to-json--from-json", () {
      var o = buildOrganization();
      var od = new api.Organization.fromJson(o.toJson());
      checkOrganization(od);
    });
  });


  unittest.group("obj-schema-Person", () {
    unittest.test("to-json--from-json", () {
      var o = buildPerson();
      var od = new api.Person.fromJson(o.toJson());
      checkPerson(od);
    });
  });


  unittest.group("obj-schema-PersonMetadata", () {
    unittest.test("to-json--from-json", () {
      var o = buildPersonMetadata();
      var od = new api.PersonMetadata.fromJson(o.toJson());
      checkPersonMetadata(od);
    });
  });


  unittest.group("obj-schema-PersonResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildPersonResponse();
      var od = new api.PersonResponse.fromJson(o.toJson());
      checkPersonResponse(od);
    });
  });


  unittest.group("obj-schema-PhoneNumber", () {
    unittest.test("to-json--from-json", () {
      var o = buildPhoneNumber();
      var od = new api.PhoneNumber.fromJson(o.toJson());
      checkPhoneNumber(od);
    });
  });


  unittest.group("obj-schema-Photo", () {
    unittest.test("to-json--from-json", () {
      var o = buildPhoto();
      var od = new api.Photo.fromJson(o.toJson());
      checkPhoto(od);
    });
  });


  unittest.group("obj-schema-Relation", () {
    unittest.test("to-json--from-json", () {
      var o = buildRelation();
      var od = new api.Relation.fromJson(o.toJson());
      checkRelation(od);
    });
  });


  unittest.group("obj-schema-RelationshipInterest", () {
    unittest.test("to-json--from-json", () {
      var o = buildRelationshipInterest();
      var od = new api.RelationshipInterest.fromJson(o.toJson());
      checkRelationshipInterest(od);
    });
  });


  unittest.group("obj-schema-RelationshipStatus", () {
    unittest.test("to-json--from-json", () {
      var o = buildRelationshipStatus();
      var od = new api.RelationshipStatus.fromJson(o.toJson());
      checkRelationshipStatus(od);
    });
  });


  unittest.group("obj-schema-Residence", () {
    unittest.test("to-json--from-json", () {
      var o = buildResidence();
      var od = new api.Residence.fromJson(o.toJson());
      checkResidence(od);
    });
  });


  unittest.group("obj-schema-Skill", () {
    unittest.test("to-json--from-json", () {
      var o = buildSkill();
      var od = new api.Skill.fromJson(o.toJson());
      checkSkill(od);
    });
  });


  unittest.group("obj-schema-Source", () {
    unittest.test("to-json--from-json", () {
      var o = buildSource();
      var od = new api.Source.fromJson(o.toJson());
      checkSource(od);
    });
  });


  unittest.group("obj-schema-Tagline", () {
    unittest.test("to-json--from-json", () {
      var o = buildTagline();
      var od = new api.Tagline.fromJson(o.toJson());
      checkTagline(od);
    });
  });


  unittest.group("obj-schema-Url", () {
    unittest.test("to-json--from-json", () {
      var o = buildUrl();
      var od = new api.Url.fromJson(o.toJson());
      checkUrl(od);
    });
  });


  unittest.group("resource-PeopleResourceApi", () {
    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.PeopleResourceApi res = new api.PeopleApi(mock).people;
      var arg_resourceName = "foo";
      var arg_requestMask_includeField = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["requestMask.includeField"].first, unittest.equals(arg_requestMask_includeField));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildPerson());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_resourceName, requestMask_includeField: arg_requestMask_includeField).then(unittest.expectAsync(((api.Person response) {
        checkPerson(response);
      })));
    });

    unittest.test("method--getBatchGet", () {

      var mock = new HttpServerMock();
      api.PeopleResourceApi res = new api.PeopleApi(mock).people;
      var arg_resourceNames = buildUnnamed1334();
      var arg_requestMask_includeField = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18), unittest.equals("v1/people:batchGet"));
        pathOffset += 18;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["resourceNames"], unittest.equals(arg_resourceNames));
        unittest.expect(queryMap["requestMask.includeField"].first, unittest.equals(arg_requestMask_includeField));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildGetPeopleResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.getBatchGet(resourceNames: arg_resourceNames, requestMask_includeField: arg_requestMask_includeField).then(unittest.expectAsync(((api.GetPeopleResponse response) {
        checkGetPeopleResponse(response);
      })));
    });

  });


  unittest.group("resource-PeopleConnectionsResourceApi", () {
    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.PeopleConnectionsResourceApi res = new api.PeopleApi(mock).people.connections;
      var arg_resourceName = "foo";
      var arg_pageToken = "foo";
      var arg_pageSize = 42;
      var arg_sortOrder = "foo";
      var arg_syncToken = "foo";
      var arg_requestMask_includeField = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 3), unittest.equals("v1/"));
        pathOffset += 3;
        // NOTE: We cannot test reserved expansions due to the inability to reverse the operation;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first), unittest.equals(arg_pageSize));
        unittest.expect(queryMap["sortOrder"].first, unittest.equals(arg_sortOrder));
        unittest.expect(queryMap["syncToken"].first, unittest.equals(arg_syncToken));
        unittest.expect(queryMap["requestMask.includeField"].first, unittest.equals(arg_requestMask_includeField));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListConnectionsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_resourceName, pageToken: arg_pageToken, pageSize: arg_pageSize, sortOrder: arg_sortOrder, syncToken: arg_syncToken, requestMask_includeField: arg_requestMask_includeField).then(unittest.expectAsync(((api.ListConnectionsResponse response) {
        checkListConnectionsResponse(response);
      })));
    });

  });


}

