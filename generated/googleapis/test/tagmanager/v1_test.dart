library googleapis.tagmanager.v1.test;

import "dart:core" as core;
import "dart:collection" as collection;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:http/testing.dart' as http_testing;
import 'package:unittest/unittest.dart' as unittest;

import 'package:googleapis/tagmanager/v1.dart' as api;

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

core.int buildCounterAccount = 0;
buildAccount() {
  var o = new api.Account();
  buildCounterAccount++;
  if (buildCounterAccount < 3) {
    o.accountId = "foo";
    o.fingerprint = "foo";
    o.name = "foo";
    o.shareData = true;
  }
  buildCounterAccount--;
  return o;
}

checkAccount(api.Account o) {
  buildCounterAccount++;
  if (buildCounterAccount < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.shareData, unittest.isTrue);
  }
  buildCounterAccount--;
}

buildUnnamed2110() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2110(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterAccountAccess = 0;
buildAccountAccess() {
  var o = new api.AccountAccess();
  buildCounterAccountAccess++;
  if (buildCounterAccountAccess < 3) {
    o.permission = buildUnnamed2110();
  }
  buildCounterAccountAccess--;
  return o;
}

checkAccountAccess(api.AccountAccess o) {
  buildCounterAccountAccess++;
  if (buildCounterAccountAccess < 3) {
    checkUnnamed2110(o.permission);
  }
  buildCounterAccountAccess--;
}

buildUnnamed2111() {
  var o = new core.List<api.Parameter>();
  o.add(buildParameter());
  o.add(buildParameter());
  return o;
}

checkUnnamed2111(core.List<api.Parameter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkParameter(o[0]);
  checkParameter(o[1]);
}

core.int buildCounterCondition = 0;
buildCondition() {
  var o = new api.Condition();
  buildCounterCondition++;
  if (buildCounterCondition < 3) {
    o.parameter = buildUnnamed2111();
    o.type = "foo";
  }
  buildCounterCondition--;
  return o;
}

checkCondition(api.Condition o) {
  buildCounterCondition++;
  if (buildCounterCondition < 3) {
    checkUnnamed2111(o.parameter);
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterCondition--;
}

buildUnnamed2112() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2112(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2113() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2113(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2114() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2114(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterContainer = 0;
buildContainer() {
  var o = new api.Container();
  buildCounterContainer++;
  if (buildCounterContainer < 3) {
    o.accountId = "foo";
    o.containerId = "foo";
    o.domainName = buildUnnamed2112();
    o.enabledBuiltInVariable = buildUnnamed2113();
    o.fingerprint = "foo";
    o.name = "foo";
    o.notes = "foo";
    o.publicId = "foo";
    o.timeZoneCountryId = "foo";
    o.timeZoneId = "foo";
    o.usageContext = buildUnnamed2114();
  }
  buildCounterContainer--;
  return o;
}

checkContainer(api.Container o) {
  buildCounterContainer++;
  if (buildCounterContainer < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.containerId, unittest.equals('foo'));
    checkUnnamed2112(o.domainName);
    checkUnnamed2113(o.enabledBuiltInVariable);
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.notes, unittest.equals('foo'));
    unittest.expect(o.publicId, unittest.equals('foo'));
    unittest.expect(o.timeZoneCountryId, unittest.equals('foo'));
    unittest.expect(o.timeZoneId, unittest.equals('foo'));
    checkUnnamed2114(o.usageContext);
  }
  buildCounterContainer--;
}

buildUnnamed2115() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2115(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterContainerAccess = 0;
buildContainerAccess() {
  var o = new api.ContainerAccess();
  buildCounterContainerAccess++;
  if (buildCounterContainerAccess < 3) {
    o.containerId = "foo";
    o.permission = buildUnnamed2115();
  }
  buildCounterContainerAccess--;
  return o;
}

checkContainerAccess(api.ContainerAccess o) {
  buildCounterContainerAccess++;
  if (buildCounterContainerAccess < 3) {
    unittest.expect(o.containerId, unittest.equals('foo'));
    checkUnnamed2115(o.permission);
  }
  buildCounterContainerAccess--;
}

buildUnnamed2116() {
  var o = new core.List<api.Folder>();
  o.add(buildFolder());
  o.add(buildFolder());
  return o;
}

checkUnnamed2116(core.List<api.Folder> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFolder(o[0]);
  checkFolder(o[1]);
}

buildUnnamed2117() {
  var o = new core.List<api.Macro>();
  o.add(buildMacro());
  o.add(buildMacro());
  return o;
}

checkUnnamed2117(core.List<api.Macro> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMacro(o[0]);
  checkMacro(o[1]);
}

buildUnnamed2118() {
  var o = new core.List<api.Rule>();
  o.add(buildRule());
  o.add(buildRule());
  return o;
}

checkUnnamed2118(core.List<api.Rule> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRule(o[0]);
  checkRule(o[1]);
}

buildUnnamed2119() {
  var o = new core.List<api.Tag>();
  o.add(buildTag());
  o.add(buildTag());
  return o;
}

checkUnnamed2119(core.List<api.Tag> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTag(o[0]);
  checkTag(o[1]);
}

buildUnnamed2120() {
  var o = new core.List<api.Trigger>();
  o.add(buildTrigger());
  o.add(buildTrigger());
  return o;
}

checkUnnamed2120(core.List<api.Trigger> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTrigger(o[0]);
  checkTrigger(o[1]);
}

buildUnnamed2121() {
  var o = new core.List<api.Variable>();
  o.add(buildVariable());
  o.add(buildVariable());
  return o;
}

checkUnnamed2121(core.List<api.Variable> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkVariable(o[0]);
  checkVariable(o[1]);
}

core.int buildCounterContainerVersion = 0;
buildContainerVersion() {
  var o = new api.ContainerVersion();
  buildCounterContainerVersion++;
  if (buildCounterContainerVersion < 3) {
    o.accountId = "foo";
    o.container = buildContainer();
    o.containerId = "foo";
    o.containerVersionId = "foo";
    o.deleted = true;
    o.fingerprint = "foo";
    o.folder = buildUnnamed2116();
    o.macro = buildUnnamed2117();
    o.name = "foo";
    o.notes = "foo";
    o.rule = buildUnnamed2118();
    o.tag = buildUnnamed2119();
    o.trigger = buildUnnamed2120();
    o.variable = buildUnnamed2121();
  }
  buildCounterContainerVersion--;
  return o;
}

checkContainerVersion(api.ContainerVersion o) {
  buildCounterContainerVersion++;
  if (buildCounterContainerVersion < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    checkContainer(o.container);
    unittest.expect(o.containerId, unittest.equals('foo'));
    unittest.expect(o.containerVersionId, unittest.equals('foo'));
    unittest.expect(o.deleted, unittest.isTrue);
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    checkUnnamed2116(o.folder);
    checkUnnamed2117(o.macro);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.notes, unittest.equals('foo'));
    checkUnnamed2118(o.rule);
    checkUnnamed2119(o.tag);
    checkUnnamed2120(o.trigger);
    checkUnnamed2121(o.variable);
  }
  buildCounterContainerVersion--;
}

core.int buildCounterContainerVersionHeader = 0;
buildContainerVersionHeader() {
  var o = new api.ContainerVersionHeader();
  buildCounterContainerVersionHeader++;
  if (buildCounterContainerVersionHeader < 3) {
    o.accountId = "foo";
    o.containerId = "foo";
    o.containerVersionId = "foo";
    o.deleted = true;
    o.name = "foo";
    o.numMacros = "foo";
    o.numRules = "foo";
    o.numTags = "foo";
    o.numTriggers = "foo";
    o.numVariables = "foo";
  }
  buildCounterContainerVersionHeader--;
  return o;
}

checkContainerVersionHeader(api.ContainerVersionHeader o) {
  buildCounterContainerVersionHeader++;
  if (buildCounterContainerVersionHeader < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.containerId, unittest.equals('foo'));
    unittest.expect(o.containerVersionId, unittest.equals('foo'));
    unittest.expect(o.deleted, unittest.isTrue);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.numMacros, unittest.equals('foo'));
    unittest.expect(o.numRules, unittest.equals('foo'));
    unittest.expect(o.numTags, unittest.equals('foo'));
    unittest.expect(o.numTriggers, unittest.equals('foo'));
    unittest.expect(o.numVariables, unittest.equals('foo'));
  }
  buildCounterContainerVersionHeader--;
}

core.int buildCounterCreateContainerVersionRequestVersionOptions = 0;
buildCreateContainerVersionRequestVersionOptions() {
  var o = new api.CreateContainerVersionRequestVersionOptions();
  buildCounterCreateContainerVersionRequestVersionOptions++;
  if (buildCounterCreateContainerVersionRequestVersionOptions < 3) {
    o.name = "foo";
    o.notes = "foo";
    o.quickPreview = true;
  }
  buildCounterCreateContainerVersionRequestVersionOptions--;
  return o;
}

checkCreateContainerVersionRequestVersionOptions(api.CreateContainerVersionRequestVersionOptions o) {
  buildCounterCreateContainerVersionRequestVersionOptions++;
  if (buildCounterCreateContainerVersionRequestVersionOptions < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.notes, unittest.equals('foo'));
    unittest.expect(o.quickPreview, unittest.isTrue);
  }
  buildCounterCreateContainerVersionRequestVersionOptions--;
}

core.int buildCounterCreateContainerVersionResponse = 0;
buildCreateContainerVersionResponse() {
  var o = new api.CreateContainerVersionResponse();
  buildCounterCreateContainerVersionResponse++;
  if (buildCounterCreateContainerVersionResponse < 3) {
    o.compilerError = true;
    o.containerVersion = buildContainerVersion();
  }
  buildCounterCreateContainerVersionResponse--;
  return o;
}

checkCreateContainerVersionResponse(api.CreateContainerVersionResponse o) {
  buildCounterCreateContainerVersionResponse++;
  if (buildCounterCreateContainerVersionResponse < 3) {
    unittest.expect(o.compilerError, unittest.isTrue);
    checkContainerVersion(o.containerVersion);
  }
  buildCounterCreateContainerVersionResponse--;
}

core.int buildCounterFolder = 0;
buildFolder() {
  var o = new api.Folder();
  buildCounterFolder++;
  if (buildCounterFolder < 3) {
    o.accountId = "foo";
    o.containerId = "foo";
    o.fingerprint = "foo";
    o.folderId = "foo";
    o.name = "foo";
  }
  buildCounterFolder--;
  return o;
}

checkFolder(api.Folder o) {
  buildCounterFolder++;
  if (buildCounterFolder < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.containerId, unittest.equals('foo'));
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    unittest.expect(o.folderId, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterFolder--;
}

buildUnnamed2122() {
  var o = new core.List<api.Tag>();
  o.add(buildTag());
  o.add(buildTag());
  return o;
}

checkUnnamed2122(core.List<api.Tag> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTag(o[0]);
  checkTag(o[1]);
}

buildUnnamed2123() {
  var o = new core.List<api.Trigger>();
  o.add(buildTrigger());
  o.add(buildTrigger());
  return o;
}

checkUnnamed2123(core.List<api.Trigger> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTrigger(o[0]);
  checkTrigger(o[1]);
}

buildUnnamed2124() {
  var o = new core.List<api.Variable>();
  o.add(buildVariable());
  o.add(buildVariable());
  return o;
}

checkUnnamed2124(core.List<api.Variable> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkVariable(o[0]);
  checkVariable(o[1]);
}

core.int buildCounterFolderEntities = 0;
buildFolderEntities() {
  var o = new api.FolderEntities();
  buildCounterFolderEntities++;
  if (buildCounterFolderEntities < 3) {
    o.tag = buildUnnamed2122();
    o.trigger = buildUnnamed2123();
    o.variable = buildUnnamed2124();
  }
  buildCounterFolderEntities--;
  return o;
}

checkFolderEntities(api.FolderEntities o) {
  buildCounterFolderEntities++;
  if (buildCounterFolderEntities < 3) {
    checkUnnamed2122(o.tag);
    checkUnnamed2123(o.trigger);
    checkUnnamed2124(o.variable);
  }
  buildCounterFolderEntities--;
}

buildUnnamed2125() {
  var o = new core.List<api.UserAccess>();
  o.add(buildUserAccess());
  o.add(buildUserAccess());
  return o;
}

checkUnnamed2125(core.List<api.UserAccess> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUserAccess(o[0]);
  checkUserAccess(o[1]);
}

core.int buildCounterListAccountUsersResponse = 0;
buildListAccountUsersResponse() {
  var o = new api.ListAccountUsersResponse();
  buildCounterListAccountUsersResponse++;
  if (buildCounterListAccountUsersResponse < 3) {
    o.userAccess = buildUnnamed2125();
  }
  buildCounterListAccountUsersResponse--;
  return o;
}

checkListAccountUsersResponse(api.ListAccountUsersResponse o) {
  buildCounterListAccountUsersResponse++;
  if (buildCounterListAccountUsersResponse < 3) {
    checkUnnamed2125(o.userAccess);
  }
  buildCounterListAccountUsersResponse--;
}

buildUnnamed2126() {
  var o = new core.List<api.Account>();
  o.add(buildAccount());
  o.add(buildAccount());
  return o;
}

checkUnnamed2126(core.List<api.Account> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAccount(o[0]);
  checkAccount(o[1]);
}

core.int buildCounterListAccountsResponse = 0;
buildListAccountsResponse() {
  var o = new api.ListAccountsResponse();
  buildCounterListAccountsResponse++;
  if (buildCounterListAccountsResponse < 3) {
    o.accounts = buildUnnamed2126();
  }
  buildCounterListAccountsResponse--;
  return o;
}

checkListAccountsResponse(api.ListAccountsResponse o) {
  buildCounterListAccountsResponse++;
  if (buildCounterListAccountsResponse < 3) {
    checkUnnamed2126(o.accounts);
  }
  buildCounterListAccountsResponse--;
}

buildUnnamed2127() {
  var o = new core.List<api.ContainerVersion>();
  o.add(buildContainerVersion());
  o.add(buildContainerVersion());
  return o;
}

checkUnnamed2127(core.List<api.ContainerVersion> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkContainerVersion(o[0]);
  checkContainerVersion(o[1]);
}

buildUnnamed2128() {
  var o = new core.List<api.ContainerVersionHeader>();
  o.add(buildContainerVersionHeader());
  o.add(buildContainerVersionHeader());
  return o;
}

checkUnnamed2128(core.List<api.ContainerVersionHeader> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkContainerVersionHeader(o[0]);
  checkContainerVersionHeader(o[1]);
}

core.int buildCounterListContainerVersionsResponse = 0;
buildListContainerVersionsResponse() {
  var o = new api.ListContainerVersionsResponse();
  buildCounterListContainerVersionsResponse++;
  if (buildCounterListContainerVersionsResponse < 3) {
    o.containerVersion = buildUnnamed2127();
    o.containerVersionHeader = buildUnnamed2128();
  }
  buildCounterListContainerVersionsResponse--;
  return o;
}

checkListContainerVersionsResponse(api.ListContainerVersionsResponse o) {
  buildCounterListContainerVersionsResponse++;
  if (buildCounterListContainerVersionsResponse < 3) {
    checkUnnamed2127(o.containerVersion);
    checkUnnamed2128(o.containerVersionHeader);
  }
  buildCounterListContainerVersionsResponse--;
}

buildUnnamed2129() {
  var o = new core.List<api.Container>();
  o.add(buildContainer());
  o.add(buildContainer());
  return o;
}

checkUnnamed2129(core.List<api.Container> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkContainer(o[0]);
  checkContainer(o[1]);
}

core.int buildCounterListContainersResponse = 0;
buildListContainersResponse() {
  var o = new api.ListContainersResponse();
  buildCounterListContainersResponse++;
  if (buildCounterListContainersResponse < 3) {
    o.containers = buildUnnamed2129();
  }
  buildCounterListContainersResponse--;
  return o;
}

checkListContainersResponse(api.ListContainersResponse o) {
  buildCounterListContainersResponse++;
  if (buildCounterListContainersResponse < 3) {
    checkUnnamed2129(o.containers);
  }
  buildCounterListContainersResponse--;
}

buildUnnamed2130() {
  var o = new core.List<api.Folder>();
  o.add(buildFolder());
  o.add(buildFolder());
  return o;
}

checkUnnamed2130(core.List<api.Folder> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFolder(o[0]);
  checkFolder(o[1]);
}

core.int buildCounterListFoldersResponse = 0;
buildListFoldersResponse() {
  var o = new api.ListFoldersResponse();
  buildCounterListFoldersResponse++;
  if (buildCounterListFoldersResponse < 3) {
    o.folders = buildUnnamed2130();
  }
  buildCounterListFoldersResponse--;
  return o;
}

checkListFoldersResponse(api.ListFoldersResponse o) {
  buildCounterListFoldersResponse++;
  if (buildCounterListFoldersResponse < 3) {
    checkUnnamed2130(o.folders);
  }
  buildCounterListFoldersResponse--;
}

buildUnnamed2131() {
  var o = new core.List<api.Macro>();
  o.add(buildMacro());
  o.add(buildMacro());
  return o;
}

checkUnnamed2131(core.List<api.Macro> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMacro(o[0]);
  checkMacro(o[1]);
}

core.int buildCounterListMacrosResponse = 0;
buildListMacrosResponse() {
  var o = new api.ListMacrosResponse();
  buildCounterListMacrosResponse++;
  if (buildCounterListMacrosResponse < 3) {
    o.macros = buildUnnamed2131();
  }
  buildCounterListMacrosResponse--;
  return o;
}

checkListMacrosResponse(api.ListMacrosResponse o) {
  buildCounterListMacrosResponse++;
  if (buildCounterListMacrosResponse < 3) {
    checkUnnamed2131(o.macros);
  }
  buildCounterListMacrosResponse--;
}

buildUnnamed2132() {
  var o = new core.List<api.Rule>();
  o.add(buildRule());
  o.add(buildRule());
  return o;
}

checkUnnamed2132(core.List<api.Rule> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRule(o[0]);
  checkRule(o[1]);
}

core.int buildCounterListRulesResponse = 0;
buildListRulesResponse() {
  var o = new api.ListRulesResponse();
  buildCounterListRulesResponse++;
  if (buildCounterListRulesResponse < 3) {
    o.rules = buildUnnamed2132();
  }
  buildCounterListRulesResponse--;
  return o;
}

checkListRulesResponse(api.ListRulesResponse o) {
  buildCounterListRulesResponse++;
  if (buildCounterListRulesResponse < 3) {
    checkUnnamed2132(o.rules);
  }
  buildCounterListRulesResponse--;
}

buildUnnamed2133() {
  var o = new core.List<api.Tag>();
  o.add(buildTag());
  o.add(buildTag());
  return o;
}

checkUnnamed2133(core.List<api.Tag> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTag(o[0]);
  checkTag(o[1]);
}

core.int buildCounterListTagsResponse = 0;
buildListTagsResponse() {
  var o = new api.ListTagsResponse();
  buildCounterListTagsResponse++;
  if (buildCounterListTagsResponse < 3) {
    o.tags = buildUnnamed2133();
  }
  buildCounterListTagsResponse--;
  return o;
}

checkListTagsResponse(api.ListTagsResponse o) {
  buildCounterListTagsResponse++;
  if (buildCounterListTagsResponse < 3) {
    checkUnnamed2133(o.tags);
  }
  buildCounterListTagsResponse--;
}

buildUnnamed2134() {
  var o = new core.List<api.Trigger>();
  o.add(buildTrigger());
  o.add(buildTrigger());
  return o;
}

checkUnnamed2134(core.List<api.Trigger> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTrigger(o[0]);
  checkTrigger(o[1]);
}

core.int buildCounterListTriggersResponse = 0;
buildListTriggersResponse() {
  var o = new api.ListTriggersResponse();
  buildCounterListTriggersResponse++;
  if (buildCounterListTriggersResponse < 3) {
    o.triggers = buildUnnamed2134();
  }
  buildCounterListTriggersResponse--;
  return o;
}

checkListTriggersResponse(api.ListTriggersResponse o) {
  buildCounterListTriggersResponse++;
  if (buildCounterListTriggersResponse < 3) {
    checkUnnamed2134(o.triggers);
  }
  buildCounterListTriggersResponse--;
}

buildUnnamed2135() {
  var o = new core.List<api.Variable>();
  o.add(buildVariable());
  o.add(buildVariable());
  return o;
}

checkUnnamed2135(core.List<api.Variable> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkVariable(o[0]);
  checkVariable(o[1]);
}

core.int buildCounterListVariablesResponse = 0;
buildListVariablesResponse() {
  var o = new api.ListVariablesResponse();
  buildCounterListVariablesResponse++;
  if (buildCounterListVariablesResponse < 3) {
    o.variables = buildUnnamed2135();
  }
  buildCounterListVariablesResponse--;
  return o;
}

checkListVariablesResponse(api.ListVariablesResponse o) {
  buildCounterListVariablesResponse++;
  if (buildCounterListVariablesResponse < 3) {
    checkUnnamed2135(o.variables);
  }
  buildCounterListVariablesResponse--;
}

buildUnnamed2136() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2136(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2137() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2137(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2138() {
  var o = new core.List<api.Parameter>();
  o.add(buildParameter());
  o.add(buildParameter());
  return o;
}

checkUnnamed2138(core.List<api.Parameter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkParameter(o[0]);
  checkParameter(o[1]);
}

core.int buildCounterMacro = 0;
buildMacro() {
  var o = new api.Macro();
  buildCounterMacro++;
  if (buildCounterMacro < 3) {
    o.accountId = "foo";
    o.containerId = "foo";
    o.disablingRuleId = buildUnnamed2136();
    o.enablingRuleId = buildUnnamed2137();
    o.fingerprint = "foo";
    o.macroId = "foo";
    o.name = "foo";
    o.notes = "foo";
    o.parameter = buildUnnamed2138();
    o.parentFolderId = "foo";
    o.scheduleEndMs = "foo";
    o.scheduleStartMs = "foo";
    o.type = "foo";
  }
  buildCounterMacro--;
  return o;
}

checkMacro(api.Macro o) {
  buildCounterMacro++;
  if (buildCounterMacro < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.containerId, unittest.equals('foo'));
    checkUnnamed2136(o.disablingRuleId);
    checkUnnamed2137(o.enablingRuleId);
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    unittest.expect(o.macroId, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.notes, unittest.equals('foo'));
    checkUnnamed2138(o.parameter);
    unittest.expect(o.parentFolderId, unittest.equals('foo'));
    unittest.expect(o.scheduleEndMs, unittest.equals('foo'));
    unittest.expect(o.scheduleStartMs, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterMacro--;
}

buildUnnamed2139() {
  var o = new core.List<api.Parameter>();
  o.add(buildParameter());
  o.add(buildParameter());
  return o;
}

checkUnnamed2139(core.List<api.Parameter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkParameter(o[0]);
  checkParameter(o[1]);
}

buildUnnamed2140() {
  var o = new core.List<api.Parameter>();
  o.add(buildParameter());
  o.add(buildParameter());
  return o;
}

checkUnnamed2140(core.List<api.Parameter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkParameter(o[0]);
  checkParameter(o[1]);
}

core.int buildCounterParameter = 0;
buildParameter() {
  var o = new api.Parameter();
  buildCounterParameter++;
  if (buildCounterParameter < 3) {
    o.key = "foo";
    o.list = buildUnnamed2139();
    o.map = buildUnnamed2140();
    o.type = "foo";
    o.value = "foo";
  }
  buildCounterParameter--;
  return o;
}

checkParameter(api.Parameter o) {
  buildCounterParameter++;
  if (buildCounterParameter < 3) {
    unittest.expect(o.key, unittest.equals('foo'));
    checkUnnamed2139(o.list);
    checkUnnamed2140(o.map);
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterParameter--;
}

core.int buildCounterPublishContainerVersionResponse = 0;
buildPublishContainerVersionResponse() {
  var o = new api.PublishContainerVersionResponse();
  buildCounterPublishContainerVersionResponse++;
  if (buildCounterPublishContainerVersionResponse < 3) {
    o.compilerError = true;
    o.containerVersion = buildContainerVersion();
  }
  buildCounterPublishContainerVersionResponse--;
  return o;
}

checkPublishContainerVersionResponse(api.PublishContainerVersionResponse o) {
  buildCounterPublishContainerVersionResponse++;
  if (buildCounterPublishContainerVersionResponse < 3) {
    unittest.expect(o.compilerError, unittest.isTrue);
    checkContainerVersion(o.containerVersion);
  }
  buildCounterPublishContainerVersionResponse--;
}

buildUnnamed2141() {
  var o = new core.List<api.Condition>();
  o.add(buildCondition());
  o.add(buildCondition());
  return o;
}

checkUnnamed2141(core.List<api.Condition> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCondition(o[0]);
  checkCondition(o[1]);
}

core.int buildCounterRule = 0;
buildRule() {
  var o = new api.Rule();
  buildCounterRule++;
  if (buildCounterRule < 3) {
    o.accountId = "foo";
    o.condition = buildUnnamed2141();
    o.containerId = "foo";
    o.fingerprint = "foo";
    o.name = "foo";
    o.notes = "foo";
    o.ruleId = "foo";
  }
  buildCounterRule--;
  return o;
}

checkRule(api.Rule o) {
  buildCounterRule++;
  if (buildCounterRule < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    checkUnnamed2141(o.condition);
    unittest.expect(o.containerId, unittest.equals('foo'));
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.notes, unittest.equals('foo'));
    unittest.expect(o.ruleId, unittest.equals('foo'));
  }
  buildCounterRule--;
}

core.int buildCounterSetupTag = 0;
buildSetupTag() {
  var o = new api.SetupTag();
  buildCounterSetupTag++;
  if (buildCounterSetupTag < 3) {
    o.stopOnSetupFailure = true;
    o.tagName = "foo";
  }
  buildCounterSetupTag--;
  return o;
}

checkSetupTag(api.SetupTag o) {
  buildCounterSetupTag++;
  if (buildCounterSetupTag < 3) {
    unittest.expect(o.stopOnSetupFailure, unittest.isTrue);
    unittest.expect(o.tagName, unittest.equals('foo'));
  }
  buildCounterSetupTag--;
}

buildUnnamed2142() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2142(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2143() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2143(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2144() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2144(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2145() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2145(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2146() {
  var o = new core.List<api.Parameter>();
  o.add(buildParameter());
  o.add(buildParameter());
  return o;
}

checkUnnamed2146(core.List<api.Parameter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkParameter(o[0]);
  checkParameter(o[1]);
}

buildUnnamed2147() {
  var o = new core.List<api.SetupTag>();
  o.add(buildSetupTag());
  o.add(buildSetupTag());
  return o;
}

checkUnnamed2147(core.List<api.SetupTag> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSetupTag(o[0]);
  checkSetupTag(o[1]);
}

buildUnnamed2148() {
  var o = new core.List<api.TeardownTag>();
  o.add(buildTeardownTag());
  o.add(buildTeardownTag());
  return o;
}

checkUnnamed2148(core.List<api.TeardownTag> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTeardownTag(o[0]);
  checkTeardownTag(o[1]);
}

core.int buildCounterTag = 0;
buildTag() {
  var o = new api.Tag();
  buildCounterTag++;
  if (buildCounterTag < 3) {
    o.accountId = "foo";
    o.blockingRuleId = buildUnnamed2142();
    o.blockingTriggerId = buildUnnamed2143();
    o.containerId = "foo";
    o.fingerprint = "foo";
    o.firingRuleId = buildUnnamed2144();
    o.firingTriggerId = buildUnnamed2145();
    o.liveOnly = true;
    o.name = "foo";
    o.notes = "foo";
    o.parameter = buildUnnamed2146();
    o.parentFolderId = "foo";
    o.priority = buildParameter();
    o.scheduleEndMs = "foo";
    o.scheduleStartMs = "foo";
    o.setupTag = buildUnnamed2147();
    o.tagId = "foo";
    o.teardownTag = buildUnnamed2148();
    o.type = "foo";
  }
  buildCounterTag--;
  return o;
}

checkTag(api.Tag o) {
  buildCounterTag++;
  if (buildCounterTag < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    checkUnnamed2142(o.blockingRuleId);
    checkUnnamed2143(o.blockingTriggerId);
    unittest.expect(o.containerId, unittest.equals('foo'));
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    checkUnnamed2144(o.firingRuleId);
    checkUnnamed2145(o.firingTriggerId);
    unittest.expect(o.liveOnly, unittest.isTrue);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.notes, unittest.equals('foo'));
    checkUnnamed2146(o.parameter);
    unittest.expect(o.parentFolderId, unittest.equals('foo'));
    checkParameter(o.priority);
    unittest.expect(o.scheduleEndMs, unittest.equals('foo'));
    unittest.expect(o.scheduleStartMs, unittest.equals('foo'));
    checkUnnamed2147(o.setupTag);
    unittest.expect(o.tagId, unittest.equals('foo'));
    checkUnnamed2148(o.teardownTag);
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterTag--;
}

core.int buildCounterTeardownTag = 0;
buildTeardownTag() {
  var o = new api.TeardownTag();
  buildCounterTeardownTag++;
  if (buildCounterTeardownTag < 3) {
    o.stopTeardownOnFailure = true;
    o.tagName = "foo";
  }
  buildCounterTeardownTag--;
  return o;
}

checkTeardownTag(api.TeardownTag o) {
  buildCounterTeardownTag++;
  if (buildCounterTeardownTag < 3) {
    unittest.expect(o.stopTeardownOnFailure, unittest.isTrue);
    unittest.expect(o.tagName, unittest.equals('foo'));
  }
  buildCounterTeardownTag--;
}

buildUnnamed2149() {
  var o = new core.List<api.Condition>();
  o.add(buildCondition());
  o.add(buildCondition());
  return o;
}

checkUnnamed2149(core.List<api.Condition> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCondition(o[0]);
  checkCondition(o[1]);
}

buildUnnamed2150() {
  var o = new core.List<api.Condition>();
  o.add(buildCondition());
  o.add(buildCondition());
  return o;
}

checkUnnamed2150(core.List<api.Condition> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCondition(o[0]);
  checkCondition(o[1]);
}

buildUnnamed2151() {
  var o = new core.List<api.Condition>();
  o.add(buildCondition());
  o.add(buildCondition());
  return o;
}

checkUnnamed2151(core.List<api.Condition> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCondition(o[0]);
  checkCondition(o[1]);
}

core.int buildCounterTrigger = 0;
buildTrigger() {
  var o = new api.Trigger();
  buildCounterTrigger++;
  if (buildCounterTrigger < 3) {
    o.accountId = "foo";
    o.autoEventFilter = buildUnnamed2149();
    o.checkValidation = buildParameter();
    o.containerId = "foo";
    o.customEventFilter = buildUnnamed2150();
    o.enableAllVideos = buildParameter();
    o.eventName = buildParameter();
    o.filter = buildUnnamed2151();
    o.fingerprint = "foo";
    o.interval = buildParameter();
    o.limit = buildParameter();
    o.name = "foo";
    o.parentFolderId = "foo";
    o.triggerId = "foo";
    o.type = "foo";
    o.uniqueTriggerId = buildParameter();
    o.videoPercentageList = buildParameter();
    o.waitForTags = buildParameter();
    o.waitForTagsTimeout = buildParameter();
  }
  buildCounterTrigger--;
  return o;
}

checkTrigger(api.Trigger o) {
  buildCounterTrigger++;
  if (buildCounterTrigger < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    checkUnnamed2149(o.autoEventFilter);
    checkParameter(o.checkValidation);
    unittest.expect(o.containerId, unittest.equals('foo'));
    checkUnnamed2150(o.customEventFilter);
    checkParameter(o.enableAllVideos);
    checkParameter(o.eventName);
    checkUnnamed2151(o.filter);
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    checkParameter(o.interval);
    checkParameter(o.limit);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.parentFolderId, unittest.equals('foo'));
    unittest.expect(o.triggerId, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
    checkParameter(o.uniqueTriggerId);
    checkParameter(o.videoPercentageList);
    checkParameter(o.waitForTags);
    checkParameter(o.waitForTagsTimeout);
  }
  buildCounterTrigger--;
}

buildUnnamed2152() {
  var o = new core.List<api.ContainerAccess>();
  o.add(buildContainerAccess());
  o.add(buildContainerAccess());
  return o;
}

checkUnnamed2152(core.List<api.ContainerAccess> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkContainerAccess(o[0]);
  checkContainerAccess(o[1]);
}

core.int buildCounterUserAccess = 0;
buildUserAccess() {
  var o = new api.UserAccess();
  buildCounterUserAccess++;
  if (buildCounterUserAccess < 3) {
    o.accountAccess = buildAccountAccess();
    o.accountId = "foo";
    o.containerAccess = buildUnnamed2152();
    o.emailAddress = "foo";
    o.permissionId = "foo";
  }
  buildCounterUserAccess--;
  return o;
}

checkUserAccess(api.UserAccess o) {
  buildCounterUserAccess++;
  if (buildCounterUserAccess < 3) {
    checkAccountAccess(o.accountAccess);
    unittest.expect(o.accountId, unittest.equals('foo'));
    checkUnnamed2152(o.containerAccess);
    unittest.expect(o.emailAddress, unittest.equals('foo'));
    unittest.expect(o.permissionId, unittest.equals('foo'));
  }
  buildCounterUserAccess--;
}

buildUnnamed2153() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2153(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2154() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2154(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2155() {
  var o = new core.List<api.Parameter>();
  o.add(buildParameter());
  o.add(buildParameter());
  return o;
}

checkUnnamed2155(core.List<api.Parameter> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkParameter(o[0]);
  checkParameter(o[1]);
}

core.int buildCounterVariable = 0;
buildVariable() {
  var o = new api.Variable();
  buildCounterVariable++;
  if (buildCounterVariable < 3) {
    o.accountId = "foo";
    o.containerId = "foo";
    o.disablingTriggerId = buildUnnamed2153();
    o.enablingTriggerId = buildUnnamed2154();
    o.fingerprint = "foo";
    o.name = "foo";
    o.notes = "foo";
    o.parameter = buildUnnamed2155();
    o.parentFolderId = "foo";
    o.scheduleEndMs = "foo";
    o.scheduleStartMs = "foo";
    o.type = "foo";
    o.variableId = "foo";
  }
  buildCounterVariable--;
  return o;
}

checkVariable(api.Variable o) {
  buildCounterVariable++;
  if (buildCounterVariable < 3) {
    unittest.expect(o.accountId, unittest.equals('foo'));
    unittest.expect(o.containerId, unittest.equals('foo'));
    checkUnnamed2153(o.disablingTriggerId);
    checkUnnamed2154(o.enablingTriggerId);
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.notes, unittest.equals('foo'));
    checkUnnamed2155(o.parameter);
    unittest.expect(o.parentFolderId, unittest.equals('foo'));
    unittest.expect(o.scheduleEndMs, unittest.equals('foo'));
    unittest.expect(o.scheduleStartMs, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.variableId, unittest.equals('foo'));
  }
  buildCounterVariable--;
}

buildUnnamed2156() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2156(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2157() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2157(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2158() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2158(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}


main() {
  unittest.group("obj-schema-Account", () {
    unittest.test("to-json--from-json", () {
      var o = buildAccount();
      var od = new api.Account.fromJson(o.toJson());
      checkAccount(od);
    });
  });


  unittest.group("obj-schema-AccountAccess", () {
    unittest.test("to-json--from-json", () {
      var o = buildAccountAccess();
      var od = new api.AccountAccess.fromJson(o.toJson());
      checkAccountAccess(od);
    });
  });


  unittest.group("obj-schema-Condition", () {
    unittest.test("to-json--from-json", () {
      var o = buildCondition();
      var od = new api.Condition.fromJson(o.toJson());
      checkCondition(od);
    });
  });


  unittest.group("obj-schema-Container", () {
    unittest.test("to-json--from-json", () {
      var o = buildContainer();
      var od = new api.Container.fromJson(o.toJson());
      checkContainer(od);
    });
  });


  unittest.group("obj-schema-ContainerAccess", () {
    unittest.test("to-json--from-json", () {
      var o = buildContainerAccess();
      var od = new api.ContainerAccess.fromJson(o.toJson());
      checkContainerAccess(od);
    });
  });


  unittest.group("obj-schema-ContainerVersion", () {
    unittest.test("to-json--from-json", () {
      var o = buildContainerVersion();
      var od = new api.ContainerVersion.fromJson(o.toJson());
      checkContainerVersion(od);
    });
  });


  unittest.group("obj-schema-ContainerVersionHeader", () {
    unittest.test("to-json--from-json", () {
      var o = buildContainerVersionHeader();
      var od = new api.ContainerVersionHeader.fromJson(o.toJson());
      checkContainerVersionHeader(od);
    });
  });


  unittest.group("obj-schema-CreateContainerVersionRequestVersionOptions", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreateContainerVersionRequestVersionOptions();
      var od = new api.CreateContainerVersionRequestVersionOptions.fromJson(o.toJson());
      checkCreateContainerVersionRequestVersionOptions(od);
    });
  });


  unittest.group("obj-schema-CreateContainerVersionResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildCreateContainerVersionResponse();
      var od = new api.CreateContainerVersionResponse.fromJson(o.toJson());
      checkCreateContainerVersionResponse(od);
    });
  });


  unittest.group("obj-schema-Folder", () {
    unittest.test("to-json--from-json", () {
      var o = buildFolder();
      var od = new api.Folder.fromJson(o.toJson());
      checkFolder(od);
    });
  });


  unittest.group("obj-schema-FolderEntities", () {
    unittest.test("to-json--from-json", () {
      var o = buildFolderEntities();
      var od = new api.FolderEntities.fromJson(o.toJson());
      checkFolderEntities(od);
    });
  });


  unittest.group("obj-schema-ListAccountUsersResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListAccountUsersResponse();
      var od = new api.ListAccountUsersResponse.fromJson(o.toJson());
      checkListAccountUsersResponse(od);
    });
  });


  unittest.group("obj-schema-ListAccountsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListAccountsResponse();
      var od = new api.ListAccountsResponse.fromJson(o.toJson());
      checkListAccountsResponse(od);
    });
  });


  unittest.group("obj-schema-ListContainerVersionsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListContainerVersionsResponse();
      var od = new api.ListContainerVersionsResponse.fromJson(o.toJson());
      checkListContainerVersionsResponse(od);
    });
  });


  unittest.group("obj-schema-ListContainersResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListContainersResponse();
      var od = new api.ListContainersResponse.fromJson(o.toJson());
      checkListContainersResponse(od);
    });
  });


  unittest.group("obj-schema-ListFoldersResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListFoldersResponse();
      var od = new api.ListFoldersResponse.fromJson(o.toJson());
      checkListFoldersResponse(od);
    });
  });


  unittest.group("obj-schema-ListMacrosResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListMacrosResponse();
      var od = new api.ListMacrosResponse.fromJson(o.toJson());
      checkListMacrosResponse(od);
    });
  });


  unittest.group("obj-schema-ListRulesResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListRulesResponse();
      var od = new api.ListRulesResponse.fromJson(o.toJson());
      checkListRulesResponse(od);
    });
  });


  unittest.group("obj-schema-ListTagsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListTagsResponse();
      var od = new api.ListTagsResponse.fromJson(o.toJson());
      checkListTagsResponse(od);
    });
  });


  unittest.group("obj-schema-ListTriggersResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListTriggersResponse();
      var od = new api.ListTriggersResponse.fromJson(o.toJson());
      checkListTriggersResponse(od);
    });
  });


  unittest.group("obj-schema-ListVariablesResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListVariablesResponse();
      var od = new api.ListVariablesResponse.fromJson(o.toJson());
      checkListVariablesResponse(od);
    });
  });


  unittest.group("obj-schema-Macro", () {
    unittest.test("to-json--from-json", () {
      var o = buildMacro();
      var od = new api.Macro.fromJson(o.toJson());
      checkMacro(od);
    });
  });


  unittest.group("obj-schema-Parameter", () {
    unittest.test("to-json--from-json", () {
      var o = buildParameter();
      var od = new api.Parameter.fromJson(o.toJson());
      checkParameter(od);
    });
  });


  unittest.group("obj-schema-PublishContainerVersionResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildPublishContainerVersionResponse();
      var od = new api.PublishContainerVersionResponse.fromJson(o.toJson());
      checkPublishContainerVersionResponse(od);
    });
  });


  unittest.group("obj-schema-Rule", () {
    unittest.test("to-json--from-json", () {
      var o = buildRule();
      var od = new api.Rule.fromJson(o.toJson());
      checkRule(od);
    });
  });


  unittest.group("obj-schema-SetupTag", () {
    unittest.test("to-json--from-json", () {
      var o = buildSetupTag();
      var od = new api.SetupTag.fromJson(o.toJson());
      checkSetupTag(od);
    });
  });


  unittest.group("obj-schema-Tag", () {
    unittest.test("to-json--from-json", () {
      var o = buildTag();
      var od = new api.Tag.fromJson(o.toJson());
      checkTag(od);
    });
  });


  unittest.group("obj-schema-TeardownTag", () {
    unittest.test("to-json--from-json", () {
      var o = buildTeardownTag();
      var od = new api.TeardownTag.fromJson(o.toJson());
      checkTeardownTag(od);
    });
  });


  unittest.group("obj-schema-Trigger", () {
    unittest.test("to-json--from-json", () {
      var o = buildTrigger();
      var od = new api.Trigger.fromJson(o.toJson());
      checkTrigger(od);
    });
  });


  unittest.group("obj-schema-UserAccess", () {
    unittest.test("to-json--from-json", () {
      var o = buildUserAccess();
      var od = new api.UserAccess.fromJson(o.toJson());
      checkUserAccess(od);
    });
  });


  unittest.group("obj-schema-Variable", () {
    unittest.test("to-json--from-json", () {
      var o = buildVariable();
      var od = new api.Variable.fromJson(o.toJson());
      checkVariable(od);
    });
  });


  unittest.group("resource-AccountsResourceApi", () {
    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AccountsResourceApi res = new api.TagmanagerApi(mock).accounts;
      var arg_accountId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAccount());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_accountId).then(unittest.expectAsync(((api.Account response) {
        checkAccount(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.AccountsResourceApi res = new api.TagmanagerApi(mock).accounts;
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("accounts"));
        pathOffset += 8;

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListAccountsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list().then(unittest.expectAsync(((api.ListAccountsResponse response) {
        checkListAccountsResponse(response);
      })));
    });

    unittest.test("method--update", () {

      var mock = new HttpServerMock();
      api.AccountsResourceApi res = new api.TagmanagerApi(mock).accounts;
      var arg_request = buildAccount();
      var arg_accountId = "foo";
      var arg_fingerprint = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Account.fromJson(json);
        checkAccount(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));

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
        unittest.expect(queryMap["fingerprint"].first, unittest.equals(arg_fingerprint));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAccount());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.update(arg_request, arg_accountId, fingerprint: arg_fingerprint).then(unittest.expectAsync(((api.Account response) {
        checkAccount(response);
      })));
    });

  });


  unittest.group("resource-AccountsContainersResourceApi", () {
    unittest.test("method--create", () {

      var mock = new HttpServerMock();
      api.AccountsContainersResourceApi res = new api.TagmanagerApi(mock).accounts.containers;
      var arg_request = buildContainer();
      var arg_accountId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Container.fromJson(json);
        checkContainer(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("/containers"));
        pathOffset += 11;

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildContainer());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.create(arg_request, arg_accountId).then(unittest.expectAsync(((api.Container response) {
        checkContainer(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.AccountsContainersResourceApi res = new api.TagmanagerApi(mock).accounts.containers;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_accountId, arg_containerId).then(unittest.expectAsync((_) {}));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AccountsContainersResourceApi res = new api.TagmanagerApi(mock).accounts.containers;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildContainer());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_accountId, arg_containerId).then(unittest.expectAsync(((api.Container response) {
        checkContainer(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.AccountsContainersResourceApi res = new api.TagmanagerApi(mock).accounts.containers;
      var arg_accountId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("/containers"));
        pathOffset += 11;

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListContainersResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_accountId).then(unittest.expectAsync(((api.ListContainersResponse response) {
        checkListContainersResponse(response);
      })));
    });

    unittest.test("method--update", () {

      var mock = new HttpServerMock();
      api.AccountsContainersResourceApi res = new api.TagmanagerApi(mock).accounts.containers;
      var arg_request = buildContainer();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_fingerprint = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Container.fromJson(json);
        checkContainer(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));

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
        unittest.expect(queryMap["fingerprint"].first, unittest.equals(arg_fingerprint));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildContainer());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.update(arg_request, arg_accountId, arg_containerId, fingerprint: arg_fingerprint).then(unittest.expectAsync(((api.Container response) {
        checkContainer(response);
      })));
    });

  });


  unittest.group("resource-AccountsContainersFoldersResourceApi", () {
    unittest.test("method--create", () {

      var mock = new HttpServerMock();
      api.AccountsContainersFoldersResourceApi res = new api.TagmanagerApi(mock).accounts.containers.folders;
      var arg_request = buildFolder();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Folder.fromJson(json);
        checkFolder(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/folders", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("/folders"));
        pathOffset += 8;

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildFolder());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.create(arg_request, arg_accountId, arg_containerId).then(unittest.expectAsync(((api.Folder response) {
        checkFolder(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.AccountsContainersFoldersResourceApi res = new api.TagmanagerApi(mock).accounts.containers.folders;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_folderId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/folders/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/folders/"));
        pathOffset += 9;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_folderId"));

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_accountId, arg_containerId, arg_folderId).then(unittest.expectAsync((_) {}));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AccountsContainersFoldersResourceApi res = new api.TagmanagerApi(mock).accounts.containers.folders;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_folderId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/folders/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/folders/"));
        pathOffset += 9;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_folderId"));

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildFolder());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_accountId, arg_containerId, arg_folderId).then(unittest.expectAsync(((api.Folder response) {
        checkFolder(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.AccountsContainersFoldersResourceApi res = new api.TagmanagerApi(mock).accounts.containers.folders;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/folders", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("/folders"));
        pathOffset += 8;

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListFoldersResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_accountId, arg_containerId).then(unittest.expectAsync(((api.ListFoldersResponse response) {
        checkListFoldersResponse(response);
      })));
    });

    unittest.test("method--update", () {

      var mock = new HttpServerMock();
      api.AccountsContainersFoldersResourceApi res = new api.TagmanagerApi(mock).accounts.containers.folders;
      var arg_request = buildFolder();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_folderId = "foo";
      var arg_fingerprint = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Folder.fromJson(json);
        checkFolder(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/folders/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/folders/"));
        pathOffset += 9;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_folderId"));

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
        unittest.expect(queryMap["fingerprint"].first, unittest.equals(arg_fingerprint));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildFolder());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.update(arg_request, arg_accountId, arg_containerId, arg_folderId, fingerprint: arg_fingerprint).then(unittest.expectAsync(((api.Folder response) {
        checkFolder(response);
      })));
    });

  });


  unittest.group("resource-AccountsContainersFoldersEntitiesResourceApi", () {
    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.AccountsContainersFoldersEntitiesResourceApi res = new api.TagmanagerApi(mock).accounts.containers.folders.entities;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_folderId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/folders/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/folders/"));
        pathOffset += 9;
        index = path.indexOf("/entities", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_folderId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/entities"));
        pathOffset += 9;

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildFolderEntities());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_accountId, arg_containerId, arg_folderId).then(unittest.expectAsync(((api.FolderEntities response) {
        checkFolderEntities(response);
      })));
    });

  });


  unittest.group("resource-AccountsContainersMacrosResourceApi", () {
    unittest.test("method--create", () {

      var mock = new HttpServerMock();
      api.AccountsContainersMacrosResourceApi res = new api.TagmanagerApi(mock).accounts.containers.macros;
      var arg_request = buildMacro();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Macro.fromJson(json);
        checkMacro(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/macros", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7), unittest.equals("/macros"));
        pathOffset += 7;

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildMacro());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.create(arg_request, arg_accountId, arg_containerId).then(unittest.expectAsync(((api.Macro response) {
        checkMacro(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.AccountsContainersMacrosResourceApi res = new api.TagmanagerApi(mock).accounts.containers.macros;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_macroId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/macros/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("/macros/"));
        pathOffset += 8;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_macroId"));

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_accountId, arg_containerId, arg_macroId).then(unittest.expectAsync((_) {}));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AccountsContainersMacrosResourceApi res = new api.TagmanagerApi(mock).accounts.containers.macros;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_macroId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/macros/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("/macros/"));
        pathOffset += 8;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_macroId"));

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildMacro());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_accountId, arg_containerId, arg_macroId).then(unittest.expectAsync(((api.Macro response) {
        checkMacro(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.AccountsContainersMacrosResourceApi res = new api.TagmanagerApi(mock).accounts.containers.macros;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/macros", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7), unittest.equals("/macros"));
        pathOffset += 7;

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListMacrosResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_accountId, arg_containerId).then(unittest.expectAsync(((api.ListMacrosResponse response) {
        checkListMacrosResponse(response);
      })));
    });

    unittest.test("method--update", () {

      var mock = new HttpServerMock();
      api.AccountsContainersMacrosResourceApi res = new api.TagmanagerApi(mock).accounts.containers.macros;
      var arg_request = buildMacro();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_macroId = "foo";
      var arg_fingerprint = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Macro.fromJson(json);
        checkMacro(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/macros/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("/macros/"));
        pathOffset += 8;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_macroId"));

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
        unittest.expect(queryMap["fingerprint"].first, unittest.equals(arg_fingerprint));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildMacro());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.update(arg_request, arg_accountId, arg_containerId, arg_macroId, fingerprint: arg_fingerprint).then(unittest.expectAsync(((api.Macro response) {
        checkMacro(response);
      })));
    });

  });


  unittest.group("resource-AccountsContainersMoveFoldersResourceApi", () {
    unittest.test("method--update", () {

      var mock = new HttpServerMock();
      api.AccountsContainersMoveFoldersResourceApi res = new api.TagmanagerApi(mock).accounts.containers.moveFolders;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_folderId = "foo";
      var arg_tagId = buildUnnamed2156();
      var arg_triggerId = buildUnnamed2157();
      var arg_variableId = buildUnnamed2158();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/move_folders/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("/move_folders/"));
        pathOffset += 14;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_folderId"));

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
        unittest.expect(queryMap["tagId"], unittest.equals(arg_tagId));
        unittest.expect(queryMap["triggerId"], unittest.equals(arg_triggerId));
        unittest.expect(queryMap["variableId"], unittest.equals(arg_variableId));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.update(arg_accountId, arg_containerId, arg_folderId, tagId: arg_tagId, triggerId: arg_triggerId, variableId: arg_variableId).then(unittest.expectAsync((_) {}));
    });

  });


  unittest.group("resource-AccountsContainersRulesResourceApi", () {
    unittest.test("method--create", () {

      var mock = new HttpServerMock();
      api.AccountsContainersRulesResourceApi res = new api.TagmanagerApi(mock).accounts.containers.rules;
      var arg_request = buildRule();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Rule.fromJson(json);
        checkRule(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/rules", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("/rules"));
        pathOffset += 6;

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildRule());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.create(arg_request, arg_accountId, arg_containerId).then(unittest.expectAsync(((api.Rule response) {
        checkRule(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.AccountsContainersRulesResourceApi res = new api.TagmanagerApi(mock).accounts.containers.rules;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_ruleId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/rules/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7), unittest.equals("/rules/"));
        pathOffset += 7;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_ruleId"));

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_accountId, arg_containerId, arg_ruleId).then(unittest.expectAsync((_) {}));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AccountsContainersRulesResourceApi res = new api.TagmanagerApi(mock).accounts.containers.rules;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_ruleId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/rules/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7), unittest.equals("/rules/"));
        pathOffset += 7;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_ruleId"));

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildRule());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_accountId, arg_containerId, arg_ruleId).then(unittest.expectAsync(((api.Rule response) {
        checkRule(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.AccountsContainersRulesResourceApi res = new api.TagmanagerApi(mock).accounts.containers.rules;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/rules", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("/rules"));
        pathOffset += 6;

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListRulesResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_accountId, arg_containerId).then(unittest.expectAsync(((api.ListRulesResponse response) {
        checkListRulesResponse(response);
      })));
    });

    unittest.test("method--update", () {

      var mock = new HttpServerMock();
      api.AccountsContainersRulesResourceApi res = new api.TagmanagerApi(mock).accounts.containers.rules;
      var arg_request = buildRule();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_ruleId = "foo";
      var arg_fingerprint = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Rule.fromJson(json);
        checkRule(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/rules/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7), unittest.equals("/rules/"));
        pathOffset += 7;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_ruleId"));

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
        unittest.expect(queryMap["fingerprint"].first, unittest.equals(arg_fingerprint));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildRule());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.update(arg_request, arg_accountId, arg_containerId, arg_ruleId, fingerprint: arg_fingerprint).then(unittest.expectAsync(((api.Rule response) {
        checkRule(response);
      })));
    });

  });


  unittest.group("resource-AccountsContainersTagsResourceApi", () {
    unittest.test("method--create", () {

      var mock = new HttpServerMock();
      api.AccountsContainersTagsResourceApi res = new api.TagmanagerApi(mock).accounts.containers.tags;
      var arg_request = buildTag();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Tag.fromJson(json);
        checkTag(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/tags", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 5), unittest.equals("/tags"));
        pathOffset += 5;

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTag());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.create(arg_request, arg_accountId, arg_containerId).then(unittest.expectAsync(((api.Tag response) {
        checkTag(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.AccountsContainersTagsResourceApi res = new api.TagmanagerApi(mock).accounts.containers.tags;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_tagId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/tags/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("/tags/"));
        pathOffset += 6;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_tagId"));

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_accountId, arg_containerId, arg_tagId).then(unittest.expectAsync((_) {}));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AccountsContainersTagsResourceApi res = new api.TagmanagerApi(mock).accounts.containers.tags;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_tagId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/tags/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("/tags/"));
        pathOffset += 6;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_tagId"));

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTag());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_accountId, arg_containerId, arg_tagId).then(unittest.expectAsync(((api.Tag response) {
        checkTag(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.AccountsContainersTagsResourceApi res = new api.TagmanagerApi(mock).accounts.containers.tags;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/tags", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 5), unittest.equals("/tags"));
        pathOffset += 5;

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListTagsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_accountId, arg_containerId).then(unittest.expectAsync(((api.ListTagsResponse response) {
        checkListTagsResponse(response);
      })));
    });

    unittest.test("method--update", () {

      var mock = new HttpServerMock();
      api.AccountsContainersTagsResourceApi res = new api.TagmanagerApi(mock).accounts.containers.tags;
      var arg_request = buildTag();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_tagId = "foo";
      var arg_fingerprint = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Tag.fromJson(json);
        checkTag(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/tags/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("/tags/"));
        pathOffset += 6;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_tagId"));

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
        unittest.expect(queryMap["fingerprint"].first, unittest.equals(arg_fingerprint));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTag());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.update(arg_request, arg_accountId, arg_containerId, arg_tagId, fingerprint: arg_fingerprint).then(unittest.expectAsync(((api.Tag response) {
        checkTag(response);
      })));
    });

  });


  unittest.group("resource-AccountsContainersTriggersResourceApi", () {
    unittest.test("method--create", () {

      var mock = new HttpServerMock();
      api.AccountsContainersTriggersResourceApi res = new api.TagmanagerApi(mock).accounts.containers.triggers;
      var arg_request = buildTrigger();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Trigger.fromJson(json);
        checkTrigger(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/triggers", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/triggers"));
        pathOffset += 9;

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTrigger());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.create(arg_request, arg_accountId, arg_containerId).then(unittest.expectAsync(((api.Trigger response) {
        checkTrigger(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.AccountsContainersTriggersResourceApi res = new api.TagmanagerApi(mock).accounts.containers.triggers;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_triggerId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/triggers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("/triggers/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_triggerId"));

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_accountId, arg_containerId, arg_triggerId).then(unittest.expectAsync((_) {}));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AccountsContainersTriggersResourceApi res = new api.TagmanagerApi(mock).accounts.containers.triggers;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_triggerId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/triggers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("/triggers/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_triggerId"));

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTrigger());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_accountId, arg_containerId, arg_triggerId).then(unittest.expectAsync(((api.Trigger response) {
        checkTrigger(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.AccountsContainersTriggersResourceApi res = new api.TagmanagerApi(mock).accounts.containers.triggers;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/triggers", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/triggers"));
        pathOffset += 9;

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListTriggersResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_accountId, arg_containerId).then(unittest.expectAsync(((api.ListTriggersResponse response) {
        checkListTriggersResponse(response);
      })));
    });

    unittest.test("method--update", () {

      var mock = new HttpServerMock();
      api.AccountsContainersTriggersResourceApi res = new api.TagmanagerApi(mock).accounts.containers.triggers;
      var arg_request = buildTrigger();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_triggerId = "foo";
      var arg_fingerprint = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Trigger.fromJson(json);
        checkTrigger(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/triggers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("/triggers/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_triggerId"));

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
        unittest.expect(queryMap["fingerprint"].first, unittest.equals(arg_fingerprint));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTrigger());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.update(arg_request, arg_accountId, arg_containerId, arg_triggerId, fingerprint: arg_fingerprint).then(unittest.expectAsync(((api.Trigger response) {
        checkTrigger(response);
      })));
    });

  });


  unittest.group("resource-AccountsContainersVariablesResourceApi", () {
    unittest.test("method--create", () {

      var mock = new HttpServerMock();
      api.AccountsContainersVariablesResourceApi res = new api.TagmanagerApi(mock).accounts.containers.variables;
      var arg_request = buildVariable();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Variable.fromJson(json);
        checkVariable(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/variables", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("/variables"));
        pathOffset += 10;

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildVariable());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.create(arg_request, arg_accountId, arg_containerId).then(unittest.expectAsync(((api.Variable response) {
        checkVariable(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.AccountsContainersVariablesResourceApi res = new api.TagmanagerApi(mock).accounts.containers.variables;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_variableId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/variables/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("/variables/"));
        pathOffset += 11;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_variableId"));

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_accountId, arg_containerId, arg_variableId).then(unittest.expectAsync((_) {}));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AccountsContainersVariablesResourceApi res = new api.TagmanagerApi(mock).accounts.containers.variables;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_variableId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/variables/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("/variables/"));
        pathOffset += 11;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_variableId"));

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildVariable());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_accountId, arg_containerId, arg_variableId).then(unittest.expectAsync(((api.Variable response) {
        checkVariable(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.AccountsContainersVariablesResourceApi res = new api.TagmanagerApi(mock).accounts.containers.variables;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/variables", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("/variables"));
        pathOffset += 10;

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListVariablesResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_accountId, arg_containerId).then(unittest.expectAsync(((api.ListVariablesResponse response) {
        checkListVariablesResponse(response);
      })));
    });

    unittest.test("method--update", () {

      var mock = new HttpServerMock();
      api.AccountsContainersVariablesResourceApi res = new api.TagmanagerApi(mock).accounts.containers.variables;
      var arg_request = buildVariable();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_variableId = "foo";
      var arg_fingerprint = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Variable.fromJson(json);
        checkVariable(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/variables/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("/variables/"));
        pathOffset += 11;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_variableId"));

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
        unittest.expect(queryMap["fingerprint"].first, unittest.equals(arg_fingerprint));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildVariable());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.update(arg_request, arg_accountId, arg_containerId, arg_variableId, fingerprint: arg_fingerprint).then(unittest.expectAsync(((api.Variable response) {
        checkVariable(response);
      })));
    });

  });


  unittest.group("resource-AccountsContainersVersionsResourceApi", () {
    unittest.test("method--create", () {

      var mock = new HttpServerMock();
      api.AccountsContainersVersionsResourceApi res = new api.TagmanagerApi(mock).accounts.containers.versions;
      var arg_request = buildCreateContainerVersionRequestVersionOptions();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.CreateContainerVersionRequestVersionOptions.fromJson(json);
        checkCreateContainerVersionRequestVersionOptions(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/versions", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/versions"));
        pathOffset += 9;

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildCreateContainerVersionResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.create(arg_request, arg_accountId, arg_containerId).then(unittest.expectAsync(((api.CreateContainerVersionResponse response) {
        checkCreateContainerVersionResponse(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.AccountsContainersVersionsResourceApi res = new api.TagmanagerApi(mock).accounts.containers.versions;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_containerVersionId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/versions/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("/versions/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_containerVersionId"));

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_accountId, arg_containerId, arg_containerVersionId).then(unittest.expectAsync((_) {}));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AccountsContainersVersionsResourceApi res = new api.TagmanagerApi(mock).accounts.containers.versions;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_containerVersionId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/versions/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("/versions/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_containerVersionId"));

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildContainerVersion());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_accountId, arg_containerId, arg_containerVersionId).then(unittest.expectAsync(((api.ContainerVersion response) {
        checkContainerVersion(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.AccountsContainersVersionsResourceApi res = new api.TagmanagerApi(mock).accounts.containers.versions;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_headers = true;
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/versions", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/versions"));
        pathOffset += 9;

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
        unittest.expect(queryMap["headers"].first, unittest.equals("$arg_headers"));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListContainerVersionsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_accountId, arg_containerId, headers: arg_headers).then(unittest.expectAsync(((api.ListContainerVersionsResponse response) {
        checkListContainerVersionsResponse(response);
      })));
    });

    unittest.test("method--publish", () {

      var mock = new HttpServerMock();
      api.AccountsContainersVersionsResourceApi res = new api.TagmanagerApi(mock).accounts.containers.versions;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_containerVersionId = "foo";
      var arg_fingerprint = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/versions/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("/versions/"));
        pathOffset += 10;
        index = path.indexOf("/publish", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerVersionId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("/publish"));
        pathOffset += 8;

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
        unittest.expect(queryMap["fingerprint"].first, unittest.equals(arg_fingerprint));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildPublishContainerVersionResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.publish(arg_accountId, arg_containerId, arg_containerVersionId, fingerprint: arg_fingerprint).then(unittest.expectAsync(((api.PublishContainerVersionResponse response) {
        checkPublishContainerVersionResponse(response);
      })));
    });

    unittest.test("method--restore", () {

      var mock = new HttpServerMock();
      api.AccountsContainersVersionsResourceApi res = new api.TagmanagerApi(mock).accounts.containers.versions;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_containerVersionId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/versions/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("/versions/"));
        pathOffset += 10;
        index = path.indexOf("/restore", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerVersionId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("/restore"));
        pathOffset += 8;

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildContainerVersion());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.restore(arg_accountId, arg_containerId, arg_containerVersionId).then(unittest.expectAsync(((api.ContainerVersion response) {
        checkContainerVersion(response);
      })));
    });

    unittest.test("method--undelete", () {

      var mock = new HttpServerMock();
      api.AccountsContainersVersionsResourceApi res = new api.TagmanagerApi(mock).accounts.containers.versions;
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_containerVersionId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/versions/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("/versions/"));
        pathOffset += 10;
        index = path.indexOf("/undelete", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerVersionId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("/undelete"));
        pathOffset += 9;

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildContainerVersion());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.undelete(arg_accountId, arg_containerId, arg_containerVersionId).then(unittest.expectAsync(((api.ContainerVersion response) {
        checkContainerVersion(response);
      })));
    });

    unittest.test("method--update", () {

      var mock = new HttpServerMock();
      api.AccountsContainersVersionsResourceApi res = new api.TagmanagerApi(mock).accounts.containers.versions;
      var arg_request = buildContainerVersion();
      var arg_accountId = "foo";
      var arg_containerId = "foo";
      var arg_containerVersionId = "foo";
      var arg_fingerprint = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.ContainerVersion.fromJson(json);
        checkContainerVersion(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/containers/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/containers/"));
        pathOffset += 12;
        index = path.indexOf("/versions/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_containerId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 10), unittest.equals("/versions/"));
        pathOffset += 10;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_containerVersionId"));

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
        unittest.expect(queryMap["fingerprint"].first, unittest.equals(arg_fingerprint));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildContainerVersion());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.update(arg_request, arg_accountId, arg_containerId, arg_containerVersionId, fingerprint: arg_fingerprint).then(unittest.expectAsync(((api.ContainerVersion response) {
        checkContainerVersion(response);
      })));
    });

  });


  unittest.group("resource-AccountsPermissionsResourceApi", () {
    unittest.test("method--create", () {

      var mock = new HttpServerMock();
      api.AccountsPermissionsResourceApi res = new api.TagmanagerApi(mock).accounts.permissions;
      var arg_request = buildUserAccess();
      var arg_accountId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.UserAccess.fromJson(json);
        checkUserAccess(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/permissions", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/permissions"));
        pathOffset += 12;

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildUserAccess());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.create(arg_request, arg_accountId).then(unittest.expectAsync(((api.UserAccess response) {
        checkUserAccess(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.AccountsPermissionsResourceApi res = new api.TagmanagerApi(mock).accounts.permissions;
      var arg_accountId = "foo";
      var arg_permissionId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/permissions/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 13), unittest.equals("/permissions/"));
        pathOffset += 13;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_permissionId"));

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_accountId, arg_permissionId).then(unittest.expectAsync((_) {}));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AccountsPermissionsResourceApi res = new api.TagmanagerApi(mock).accounts.permissions;
      var arg_accountId = "foo";
      var arg_permissionId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/permissions/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 13), unittest.equals("/permissions/"));
        pathOffset += 13;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_permissionId"));

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildUserAccess());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_accountId, arg_permissionId).then(unittest.expectAsync(((api.UserAccess response) {
        checkUserAccess(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.AccountsPermissionsResourceApi res = new api.TagmanagerApi(mock).accounts.permissions;
      var arg_accountId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/permissions", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("/permissions"));
        pathOffset += 12;

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListAccountUsersResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_accountId).then(unittest.expectAsync(((api.ListAccountUsersResponse response) {
        checkListAccountUsersResponse(response);
      })));
    });

    unittest.test("method--update", () {

      var mock = new HttpServerMock();
      api.AccountsPermissionsResourceApi res = new api.TagmanagerApi(mock).accounts.permissions;
      var arg_request = buildUserAccess();
      var arg_accountId = "foo";
      var arg_permissionId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.UserAccess.fromJson(json);
        checkUserAccess(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("tagmanager/v1/"));
        pathOffset += 14;
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals("accounts/"));
        pathOffset += 9;
        index = path.indexOf("/permissions/", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_accountId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 13), unittest.equals("/permissions/"));
        pathOffset += 13;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_permissionId"));

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildUserAccess());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.update(arg_request, arg_accountId, arg_permissionId).then(unittest.expectAsync(((api.UserAccess response) {
        checkUserAccess(response);
      })));
    });

  });


}

