library googleapis.genomics.v1.test;

import "dart:core" as core;
import "dart:collection" as collection;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:http/testing.dart' as http_testing;
import 'package:unittest/unittest.dart' as unittest;

import 'package:googleapis/genomics/v1.dart' as api;

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

buildUnnamed2500() {
  var o = new core.List<core.Object>();
  o.add({'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'});
  o.add({'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'});
  return o;
}

checkUnnamed2500(core.List<core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted1 = (o[0]) as core.Map; unittest.expect(casted1, unittest.hasLength(3)); unittest.expect(casted1["list"], unittest.equals([1, 2, 3])); unittest.expect(casted1["bool"], unittest.equals(true)); unittest.expect(casted1["string"], unittest.equals('foo')); 
  var casted2 = (o[1]) as core.Map; unittest.expect(casted2, unittest.hasLength(3)); unittest.expect(casted2["list"], unittest.equals([1, 2, 3])); unittest.expect(casted2["bool"], unittest.equals(true)); unittest.expect(casted2["string"], unittest.equals('foo')); 
}

buildUnnamed2501() {
  var o = new core.Map<core.String, core.List<core.Object>>();
  o["x"] = buildUnnamed2500();
  o["y"] = buildUnnamed2500();
  return o;
}

checkUnnamed2501(core.Map<core.String, core.List<core.Object>> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUnnamed2500(o["x"]);
  checkUnnamed2500(o["y"]);
}

core.int buildCounterAnnotation = 0;
buildAnnotation() {
  var o = new api.Annotation();
  buildCounterAnnotation++;
  if (buildCounterAnnotation < 3) {
    o.annotationSetId = "foo";
    o.end = "foo";
    o.id = "foo";
    o.info = buildUnnamed2501();
    o.name = "foo";
    o.referenceId = "foo";
    o.referenceName = "foo";
    o.reverseStrand = true;
    o.start = "foo";
    o.transcript = buildTranscript();
    o.type = "foo";
    o.variant = buildVariantAnnotation();
  }
  buildCounterAnnotation--;
  return o;
}

checkAnnotation(api.Annotation o) {
  buildCounterAnnotation++;
  if (buildCounterAnnotation < 3) {
    unittest.expect(o.annotationSetId, unittest.equals('foo'));
    unittest.expect(o.end, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2501(o.info);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.referenceId, unittest.equals('foo'));
    unittest.expect(o.referenceName, unittest.equals('foo'));
    unittest.expect(o.reverseStrand, unittest.isTrue);
    unittest.expect(o.start, unittest.equals('foo'));
    checkTranscript(o.transcript);
    unittest.expect(o.type, unittest.equals('foo'));
    checkVariantAnnotation(o.variant);
  }
  buildCounterAnnotation--;
}

buildUnnamed2502() {
  var o = new core.List<core.Object>();
  o.add({'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'});
  o.add({'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'});
  return o;
}

checkUnnamed2502(core.List<core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted3 = (o[0]) as core.Map; unittest.expect(casted3, unittest.hasLength(3)); unittest.expect(casted3["list"], unittest.equals([1, 2, 3])); unittest.expect(casted3["bool"], unittest.equals(true)); unittest.expect(casted3["string"], unittest.equals('foo')); 
  var casted4 = (o[1]) as core.Map; unittest.expect(casted4, unittest.hasLength(3)); unittest.expect(casted4["list"], unittest.equals([1, 2, 3])); unittest.expect(casted4["bool"], unittest.equals(true)); unittest.expect(casted4["string"], unittest.equals('foo')); 
}

buildUnnamed2503() {
  var o = new core.Map<core.String, core.List<core.Object>>();
  o["x"] = buildUnnamed2502();
  o["y"] = buildUnnamed2502();
  return o;
}

checkUnnamed2503(core.Map<core.String, core.List<core.Object>> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUnnamed2502(o["x"]);
  checkUnnamed2502(o["y"]);
}

core.int buildCounterAnnotationSet = 0;
buildAnnotationSet() {
  var o = new api.AnnotationSet();
  buildCounterAnnotationSet++;
  if (buildCounterAnnotationSet < 3) {
    o.datasetId = "foo";
    o.id = "foo";
    o.info = buildUnnamed2503();
    o.name = "foo";
    o.referenceSetId = "foo";
    o.sourceUri = "foo";
    o.type = "foo";
  }
  buildCounterAnnotationSet--;
  return o;
}

checkAnnotationSet(api.AnnotationSet o) {
  buildCounterAnnotationSet++;
  if (buildCounterAnnotationSet < 3) {
    unittest.expect(o.datasetId, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2503(o.info);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.referenceSetId, unittest.equals('foo'));
    unittest.expect(o.sourceUri, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterAnnotationSet--;
}

buildUnnamed2504() {
  var o = new core.List<api.Annotation>();
  o.add(buildAnnotation());
  o.add(buildAnnotation());
  return o;
}

checkUnnamed2504(core.List<api.Annotation> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAnnotation(o[0]);
  checkAnnotation(o[1]);
}

core.int buildCounterBatchCreateAnnotationsRequest = 0;
buildBatchCreateAnnotationsRequest() {
  var o = new api.BatchCreateAnnotationsRequest();
  buildCounterBatchCreateAnnotationsRequest++;
  if (buildCounterBatchCreateAnnotationsRequest < 3) {
    o.annotations = buildUnnamed2504();
  }
  buildCounterBatchCreateAnnotationsRequest--;
  return o;
}

checkBatchCreateAnnotationsRequest(api.BatchCreateAnnotationsRequest o) {
  buildCounterBatchCreateAnnotationsRequest++;
  if (buildCounterBatchCreateAnnotationsRequest < 3) {
    checkUnnamed2504(o.annotations);
  }
  buildCounterBatchCreateAnnotationsRequest--;
}

buildUnnamed2505() {
  var o = new core.List<api.Entry>();
  o.add(buildEntry());
  o.add(buildEntry());
  return o;
}

checkUnnamed2505(core.List<api.Entry> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkEntry(o[0]);
  checkEntry(o[1]);
}

core.int buildCounterBatchCreateAnnotationsResponse = 0;
buildBatchCreateAnnotationsResponse() {
  var o = new api.BatchCreateAnnotationsResponse();
  buildCounterBatchCreateAnnotationsResponse++;
  if (buildCounterBatchCreateAnnotationsResponse < 3) {
    o.entries = buildUnnamed2505();
  }
  buildCounterBatchCreateAnnotationsResponse--;
  return o;
}

checkBatchCreateAnnotationsResponse(api.BatchCreateAnnotationsResponse o) {
  buildCounterBatchCreateAnnotationsResponse++;
  if (buildCounterBatchCreateAnnotationsResponse < 3) {
    checkUnnamed2505(o.entries);
  }
  buildCounterBatchCreateAnnotationsResponse--;
}

buildUnnamed2506() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2506(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterBinding = 0;
buildBinding() {
  var o = new api.Binding();
  buildCounterBinding++;
  if (buildCounterBinding < 3) {
    o.members = buildUnnamed2506();
    o.role = "foo";
  }
  buildCounterBinding--;
  return o;
}

checkBinding(api.Binding o) {
  buildCounterBinding++;
  if (buildCounterBinding < 3) {
    checkUnnamed2506(o.members);
    unittest.expect(o.role, unittest.equals('foo'));
  }
  buildCounterBinding--;
}

buildUnnamed2507() {
  var o = new core.List<core.Object>();
  o.add({'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'});
  o.add({'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'});
  return o;
}

checkUnnamed2507(core.List<core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted5 = (o[0]) as core.Map; unittest.expect(casted5, unittest.hasLength(3)); unittest.expect(casted5["list"], unittest.equals([1, 2, 3])); unittest.expect(casted5["bool"], unittest.equals(true)); unittest.expect(casted5["string"], unittest.equals('foo')); 
  var casted6 = (o[1]) as core.Map; unittest.expect(casted6, unittest.hasLength(3)); unittest.expect(casted6["list"], unittest.equals([1, 2, 3])); unittest.expect(casted6["bool"], unittest.equals(true)); unittest.expect(casted6["string"], unittest.equals('foo')); 
}

buildUnnamed2508() {
  var o = new core.Map<core.String, core.List<core.Object>>();
  o["x"] = buildUnnamed2507();
  o["y"] = buildUnnamed2507();
  return o;
}

checkUnnamed2508(core.Map<core.String, core.List<core.Object>> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUnnamed2507(o["x"]);
  checkUnnamed2507(o["y"]);
}

buildUnnamed2509() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2509(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterCallSet = 0;
buildCallSet() {
  var o = new api.CallSet();
  buildCounterCallSet++;
  if (buildCounterCallSet < 3) {
    o.created = "foo";
    o.id = "foo";
    o.info = buildUnnamed2508();
    o.name = "foo";
    o.sampleId = "foo";
    o.variantSetIds = buildUnnamed2509();
  }
  buildCounterCallSet--;
  return o;
}

checkCallSet(api.CallSet o) {
  buildCounterCallSet++;
  if (buildCounterCallSet < 3) {
    unittest.expect(o.created, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2508(o.info);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.sampleId, unittest.equals('foo'));
    checkUnnamed2509(o.variantSetIds);
  }
  buildCounterCallSet--;
}

core.int buildCounterCancelOperationRequest = 0;
buildCancelOperationRequest() {
  var o = new api.CancelOperationRequest();
  buildCounterCancelOperationRequest++;
  if (buildCounterCancelOperationRequest < 3) {
  }
  buildCounterCancelOperationRequest--;
  return o;
}

checkCancelOperationRequest(api.CancelOperationRequest o) {
  buildCounterCancelOperationRequest++;
  if (buildCounterCancelOperationRequest < 3) {
  }
  buildCounterCancelOperationRequest--;
}

core.int buildCounterCigarUnit = 0;
buildCigarUnit() {
  var o = new api.CigarUnit();
  buildCounterCigarUnit++;
  if (buildCounterCigarUnit < 3) {
    o.operation = "foo";
    o.operationLength = "foo";
    o.referenceSequence = "foo";
  }
  buildCounterCigarUnit--;
  return o;
}

checkCigarUnit(api.CigarUnit o) {
  buildCounterCigarUnit++;
  if (buildCounterCigarUnit < 3) {
    unittest.expect(o.operation, unittest.equals('foo'));
    unittest.expect(o.operationLength, unittest.equals('foo'));
    unittest.expect(o.referenceSequence, unittest.equals('foo'));
  }
  buildCounterCigarUnit--;
}

buildUnnamed2510() {
  var o = new core.List<api.ExternalId>();
  o.add(buildExternalId());
  o.add(buildExternalId());
  return o;
}

checkUnnamed2510(core.List<api.ExternalId> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkExternalId(o[0]);
  checkExternalId(o[1]);
}

buildUnnamed2511() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2511(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterClinicalCondition = 0;
buildClinicalCondition() {
  var o = new api.ClinicalCondition();
  buildCounterClinicalCondition++;
  if (buildCounterClinicalCondition < 3) {
    o.conceptId = "foo";
    o.externalIds = buildUnnamed2510();
    o.names = buildUnnamed2511();
    o.omimId = "foo";
  }
  buildCounterClinicalCondition--;
  return o;
}

checkClinicalCondition(api.ClinicalCondition o) {
  buildCounterClinicalCondition++;
  if (buildCounterClinicalCondition < 3) {
    unittest.expect(o.conceptId, unittest.equals('foo'));
    checkUnnamed2510(o.externalIds);
    checkUnnamed2511(o.names);
    unittest.expect(o.omimId, unittest.equals('foo'));
  }
  buildCounterClinicalCondition--;
}

core.int buildCounterCodingSequence = 0;
buildCodingSequence() {
  var o = new api.CodingSequence();
  buildCounterCodingSequence++;
  if (buildCounterCodingSequence < 3) {
    o.end = "foo";
    o.start = "foo";
  }
  buildCounterCodingSequence--;
  return o;
}

checkCodingSequence(api.CodingSequence o) {
  buildCounterCodingSequence++;
  if (buildCounterCodingSequence < 3) {
    unittest.expect(o.end, unittest.equals('foo'));
    unittest.expect(o.start, unittest.equals('foo'));
  }
  buildCounterCodingSequence--;
}

core.int buildCounterCoverageBucket = 0;
buildCoverageBucket() {
  var o = new api.CoverageBucket();
  buildCounterCoverageBucket++;
  if (buildCounterCoverageBucket < 3) {
    o.meanCoverage = 42.0;
    o.range = buildRange();
  }
  buildCounterCoverageBucket--;
  return o;
}

checkCoverageBucket(api.CoverageBucket o) {
  buildCounterCoverageBucket++;
  if (buildCounterCoverageBucket < 3) {
    unittest.expect(o.meanCoverage, unittest.equals(42.0));
    checkRange(o.range);
  }
  buildCounterCoverageBucket--;
}

core.int buildCounterDataset = 0;
buildDataset() {
  var o = new api.Dataset();
  buildCounterDataset++;
  if (buildCounterDataset < 3) {
    o.createTime = "foo";
    o.id = "foo";
    o.name = "foo";
    o.projectId = "foo";
  }
  buildCounterDataset--;
  return o;
}

checkDataset(api.Dataset o) {
  buildCounterDataset++;
  if (buildCounterDataset < 3) {
    unittest.expect(o.createTime, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.projectId, unittest.equals('foo'));
  }
  buildCounterDataset--;
}

core.int buildCounterEmpty = 0;
buildEmpty() {
  var o = new api.Empty();
  buildCounterEmpty++;
  if (buildCounterEmpty < 3) {
  }
  buildCounterEmpty--;
  return o;
}

checkEmpty(api.Empty o) {
  buildCounterEmpty++;
  if (buildCounterEmpty < 3) {
  }
  buildCounterEmpty--;
}

core.int buildCounterEntry = 0;
buildEntry() {
  var o = new api.Entry();
  buildCounterEntry++;
  if (buildCounterEntry < 3) {
    o.annotation = buildAnnotation();
    o.status = buildStatus();
  }
  buildCounterEntry--;
  return o;
}

checkEntry(api.Entry o) {
  buildCounterEntry++;
  if (buildCounterEntry < 3) {
    checkAnnotation(o.annotation);
    checkStatus(o.status);
  }
  buildCounterEntry--;
}

core.int buildCounterExon = 0;
buildExon() {
  var o = new api.Exon();
  buildCounterExon++;
  if (buildCounterExon < 3) {
    o.end = "foo";
    o.frame = 42;
    o.start = "foo";
  }
  buildCounterExon--;
  return o;
}

checkExon(api.Exon o) {
  buildCounterExon++;
  if (buildCounterExon < 3) {
    unittest.expect(o.end, unittest.equals('foo'));
    unittest.expect(o.frame, unittest.equals(42));
    unittest.expect(o.start, unittest.equals('foo'));
  }
  buildCounterExon--;
}

core.int buildCounterExperiment = 0;
buildExperiment() {
  var o = new api.Experiment();
  buildCounterExperiment++;
  if (buildCounterExperiment < 3) {
    o.instrumentModel = "foo";
    o.libraryId = "foo";
    o.platformUnit = "foo";
    o.sequencingCenter = "foo";
  }
  buildCounterExperiment--;
  return o;
}

checkExperiment(api.Experiment o) {
  buildCounterExperiment++;
  if (buildCounterExperiment < 3) {
    unittest.expect(o.instrumentModel, unittest.equals('foo'));
    unittest.expect(o.libraryId, unittest.equals('foo'));
    unittest.expect(o.platformUnit, unittest.equals('foo'));
    unittest.expect(o.sequencingCenter, unittest.equals('foo'));
  }
  buildCounterExperiment--;
}

buildUnnamed2512() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2512(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterExportReadGroupSetRequest = 0;
buildExportReadGroupSetRequest() {
  var o = new api.ExportReadGroupSetRequest();
  buildCounterExportReadGroupSetRequest++;
  if (buildCounterExportReadGroupSetRequest < 3) {
    o.exportUri = "foo";
    o.projectId = "foo";
    o.referenceNames = buildUnnamed2512();
  }
  buildCounterExportReadGroupSetRequest--;
  return o;
}

checkExportReadGroupSetRequest(api.ExportReadGroupSetRequest o) {
  buildCounterExportReadGroupSetRequest++;
  if (buildCounterExportReadGroupSetRequest < 3) {
    unittest.expect(o.exportUri, unittest.equals('foo'));
    unittest.expect(o.projectId, unittest.equals('foo'));
    checkUnnamed2512(o.referenceNames);
  }
  buildCounterExportReadGroupSetRequest--;
}

buildUnnamed2513() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2513(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterExportVariantSetRequest = 0;
buildExportVariantSetRequest() {
  var o = new api.ExportVariantSetRequest();
  buildCounterExportVariantSetRequest++;
  if (buildCounterExportVariantSetRequest < 3) {
    o.bigqueryDataset = "foo";
    o.bigqueryTable = "foo";
    o.callSetIds = buildUnnamed2513();
    o.format = "foo";
    o.projectId = "foo";
  }
  buildCounterExportVariantSetRequest--;
  return o;
}

checkExportVariantSetRequest(api.ExportVariantSetRequest o) {
  buildCounterExportVariantSetRequest++;
  if (buildCounterExportVariantSetRequest < 3) {
    unittest.expect(o.bigqueryDataset, unittest.equals('foo'));
    unittest.expect(o.bigqueryTable, unittest.equals('foo'));
    checkUnnamed2513(o.callSetIds);
    unittest.expect(o.format, unittest.equals('foo'));
    unittest.expect(o.projectId, unittest.equals('foo'));
  }
  buildCounterExportVariantSetRequest--;
}

core.int buildCounterExternalId = 0;
buildExternalId() {
  var o = new api.ExternalId();
  buildCounterExternalId++;
  if (buildCounterExternalId < 3) {
    o.id = "foo";
    o.sourceName = "foo";
  }
  buildCounterExternalId--;
  return o;
}

checkExternalId(api.ExternalId o) {
  buildCounterExternalId++;
  if (buildCounterExternalId < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.sourceName, unittest.equals('foo'));
  }
  buildCounterExternalId--;
}

core.int buildCounterGetIamPolicyRequest = 0;
buildGetIamPolicyRequest() {
  var o = new api.GetIamPolicyRequest();
  buildCounterGetIamPolicyRequest++;
  if (buildCounterGetIamPolicyRequest < 3) {
  }
  buildCounterGetIamPolicyRequest--;
  return o;
}

checkGetIamPolicyRequest(api.GetIamPolicyRequest o) {
  buildCounterGetIamPolicyRequest++;
  if (buildCounterGetIamPolicyRequest < 3) {
  }
  buildCounterGetIamPolicyRequest--;
}

buildUnnamed2514() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2514(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterImportReadGroupSetsRequest = 0;
buildImportReadGroupSetsRequest() {
  var o = new api.ImportReadGroupSetsRequest();
  buildCounterImportReadGroupSetsRequest++;
  if (buildCounterImportReadGroupSetsRequest < 3) {
    o.datasetId = "foo";
    o.partitionStrategy = "foo";
    o.referenceSetId = "foo";
    o.sourceUris = buildUnnamed2514();
  }
  buildCounterImportReadGroupSetsRequest--;
  return o;
}

checkImportReadGroupSetsRequest(api.ImportReadGroupSetsRequest o) {
  buildCounterImportReadGroupSetsRequest++;
  if (buildCounterImportReadGroupSetsRequest < 3) {
    unittest.expect(o.datasetId, unittest.equals('foo'));
    unittest.expect(o.partitionStrategy, unittest.equals('foo'));
    unittest.expect(o.referenceSetId, unittest.equals('foo'));
    checkUnnamed2514(o.sourceUris);
  }
  buildCounterImportReadGroupSetsRequest--;
}

buildUnnamed2515() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2515(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterImportReadGroupSetsResponse = 0;
buildImportReadGroupSetsResponse() {
  var o = new api.ImportReadGroupSetsResponse();
  buildCounterImportReadGroupSetsResponse++;
  if (buildCounterImportReadGroupSetsResponse < 3) {
    o.readGroupSetIds = buildUnnamed2515();
  }
  buildCounterImportReadGroupSetsResponse--;
  return o;
}

checkImportReadGroupSetsResponse(api.ImportReadGroupSetsResponse o) {
  buildCounterImportReadGroupSetsResponse++;
  if (buildCounterImportReadGroupSetsResponse < 3) {
    checkUnnamed2515(o.readGroupSetIds);
  }
  buildCounterImportReadGroupSetsResponse--;
}

buildUnnamed2516() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed2516(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

buildUnnamed2517() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2517(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterImportVariantsRequest = 0;
buildImportVariantsRequest() {
  var o = new api.ImportVariantsRequest();
  buildCounterImportVariantsRequest++;
  if (buildCounterImportVariantsRequest < 3) {
    o.format = "foo";
    o.infoMergeConfig = buildUnnamed2516();
    o.normalizeReferenceNames = true;
    o.sourceUris = buildUnnamed2517();
    o.variantSetId = "foo";
  }
  buildCounterImportVariantsRequest--;
  return o;
}

checkImportVariantsRequest(api.ImportVariantsRequest o) {
  buildCounterImportVariantsRequest++;
  if (buildCounterImportVariantsRequest < 3) {
    unittest.expect(o.format, unittest.equals('foo'));
    checkUnnamed2516(o.infoMergeConfig);
    unittest.expect(o.normalizeReferenceNames, unittest.isTrue);
    checkUnnamed2517(o.sourceUris);
    unittest.expect(o.variantSetId, unittest.equals('foo'));
  }
  buildCounterImportVariantsRequest--;
}

buildUnnamed2518() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2518(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterImportVariantsResponse = 0;
buildImportVariantsResponse() {
  var o = new api.ImportVariantsResponse();
  buildCounterImportVariantsResponse++;
  if (buildCounterImportVariantsResponse < 3) {
    o.callSetIds = buildUnnamed2518();
  }
  buildCounterImportVariantsResponse--;
  return o;
}

checkImportVariantsResponse(api.ImportVariantsResponse o) {
  buildCounterImportVariantsResponse++;
  if (buildCounterImportVariantsResponse < 3) {
    checkUnnamed2518(o.callSetIds);
  }
  buildCounterImportVariantsResponse--;
}

buildUnnamed2519() {
  var o = new core.List<api.CigarUnit>();
  o.add(buildCigarUnit());
  o.add(buildCigarUnit());
  return o;
}

checkUnnamed2519(core.List<api.CigarUnit> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCigarUnit(o[0]);
  checkCigarUnit(o[1]);
}

core.int buildCounterLinearAlignment = 0;
buildLinearAlignment() {
  var o = new api.LinearAlignment();
  buildCounterLinearAlignment++;
  if (buildCounterLinearAlignment < 3) {
    o.cigar = buildUnnamed2519();
    o.mappingQuality = 42;
    o.position = buildPosition();
  }
  buildCounterLinearAlignment--;
  return o;
}

checkLinearAlignment(api.LinearAlignment o) {
  buildCounterLinearAlignment++;
  if (buildCounterLinearAlignment < 3) {
    checkUnnamed2519(o.cigar);
    unittest.expect(o.mappingQuality, unittest.equals(42));
    checkPosition(o.position);
  }
  buildCounterLinearAlignment--;
}

core.int buildCounterListBasesResponse = 0;
buildListBasesResponse() {
  var o = new api.ListBasesResponse();
  buildCounterListBasesResponse++;
  if (buildCounterListBasesResponse < 3) {
    o.nextPageToken = "foo";
    o.offset = "foo";
    o.sequence = "foo";
  }
  buildCounterListBasesResponse--;
  return o;
}

checkListBasesResponse(api.ListBasesResponse o) {
  buildCounterListBasesResponse++;
  if (buildCounterListBasesResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.offset, unittest.equals('foo'));
    unittest.expect(o.sequence, unittest.equals('foo'));
  }
  buildCounterListBasesResponse--;
}

buildUnnamed2520() {
  var o = new core.List<api.CoverageBucket>();
  o.add(buildCoverageBucket());
  o.add(buildCoverageBucket());
  return o;
}

checkUnnamed2520(core.List<api.CoverageBucket> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCoverageBucket(o[0]);
  checkCoverageBucket(o[1]);
}

core.int buildCounterListCoverageBucketsResponse = 0;
buildListCoverageBucketsResponse() {
  var o = new api.ListCoverageBucketsResponse();
  buildCounterListCoverageBucketsResponse++;
  if (buildCounterListCoverageBucketsResponse < 3) {
    o.bucketWidth = "foo";
    o.coverageBuckets = buildUnnamed2520();
    o.nextPageToken = "foo";
  }
  buildCounterListCoverageBucketsResponse--;
  return o;
}

checkListCoverageBucketsResponse(api.ListCoverageBucketsResponse o) {
  buildCounterListCoverageBucketsResponse++;
  if (buildCounterListCoverageBucketsResponse < 3) {
    unittest.expect(o.bucketWidth, unittest.equals('foo'));
    checkUnnamed2520(o.coverageBuckets);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListCoverageBucketsResponse--;
}

buildUnnamed2521() {
  var o = new core.List<api.Dataset>();
  o.add(buildDataset());
  o.add(buildDataset());
  return o;
}

checkUnnamed2521(core.List<api.Dataset> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDataset(o[0]);
  checkDataset(o[1]);
}

core.int buildCounterListDatasetsResponse = 0;
buildListDatasetsResponse() {
  var o = new api.ListDatasetsResponse();
  buildCounterListDatasetsResponse++;
  if (buildCounterListDatasetsResponse < 3) {
    o.datasets = buildUnnamed2521();
    o.nextPageToken = "foo";
  }
  buildCounterListDatasetsResponse--;
  return o;
}

checkListDatasetsResponse(api.ListDatasetsResponse o) {
  buildCounterListDatasetsResponse++;
  if (buildCounterListDatasetsResponse < 3) {
    checkUnnamed2521(o.datasets);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterListDatasetsResponse--;
}

buildUnnamed2522() {
  var o = new core.List<api.Operation>();
  o.add(buildOperation());
  o.add(buildOperation());
  return o;
}

checkUnnamed2522(core.List<api.Operation> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOperation(o[0]);
  checkOperation(o[1]);
}

core.int buildCounterListOperationsResponse = 0;
buildListOperationsResponse() {
  var o = new api.ListOperationsResponse();
  buildCounterListOperationsResponse++;
  if (buildCounterListOperationsResponse < 3) {
    o.nextPageToken = "foo";
    o.operations = buildUnnamed2522();
  }
  buildCounterListOperationsResponse--;
  return o;
}

checkListOperationsResponse(api.ListOperationsResponse o) {
  buildCounterListOperationsResponse++;
  if (buildCounterListOperationsResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed2522(o.operations);
  }
  buildCounterListOperationsResponse--;
}

buildUnnamed2523() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed2523(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

buildUnnamed2524() {
  var o = new core.List<api.Variant>();
  o.add(buildVariant());
  o.add(buildVariant());
  return o;
}

checkUnnamed2524(core.List<api.Variant> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkVariant(o[0]);
  checkVariant(o[1]);
}

core.int buildCounterMergeVariantsRequest = 0;
buildMergeVariantsRequest() {
  var o = new api.MergeVariantsRequest();
  buildCounterMergeVariantsRequest++;
  if (buildCounterMergeVariantsRequest < 3) {
    o.infoMergeConfig = buildUnnamed2523();
    o.variantSetId = "foo";
    o.variants = buildUnnamed2524();
  }
  buildCounterMergeVariantsRequest--;
  return o;
}

checkMergeVariantsRequest(api.MergeVariantsRequest o) {
  buildCounterMergeVariantsRequest++;
  if (buildCounterMergeVariantsRequest < 3) {
    checkUnnamed2523(o.infoMergeConfig);
    unittest.expect(o.variantSetId, unittest.equals('foo'));
    checkUnnamed2524(o.variants);
  }
  buildCounterMergeVariantsRequest--;
}

buildUnnamed2525() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed2525(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted7 = (o["x"]) as core.Map; unittest.expect(casted7, unittest.hasLength(3)); unittest.expect(casted7["list"], unittest.equals([1, 2, 3])); unittest.expect(casted7["bool"], unittest.equals(true)); unittest.expect(casted7["string"], unittest.equals('foo')); 
  var casted8 = (o["y"]) as core.Map; unittest.expect(casted8, unittest.hasLength(3)); unittest.expect(casted8["list"], unittest.equals([1, 2, 3])); unittest.expect(casted8["bool"], unittest.equals(true)); unittest.expect(casted8["string"], unittest.equals('foo')); 
}

buildUnnamed2526() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed2526(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted9 = (o["x"]) as core.Map; unittest.expect(casted9, unittest.hasLength(3)); unittest.expect(casted9["list"], unittest.equals([1, 2, 3])); unittest.expect(casted9["bool"], unittest.equals(true)); unittest.expect(casted9["string"], unittest.equals('foo')); 
  var casted10 = (o["y"]) as core.Map; unittest.expect(casted10, unittest.hasLength(3)); unittest.expect(casted10["list"], unittest.equals([1, 2, 3])); unittest.expect(casted10["bool"], unittest.equals(true)); unittest.expect(casted10["string"], unittest.equals('foo')); 
}

core.int buildCounterOperation = 0;
buildOperation() {
  var o = new api.Operation();
  buildCounterOperation++;
  if (buildCounterOperation < 3) {
    o.done = true;
    o.error = buildStatus();
    o.metadata = buildUnnamed2525();
    o.name = "foo";
    o.response = buildUnnamed2526();
  }
  buildCounterOperation--;
  return o;
}

checkOperation(api.Operation o) {
  buildCounterOperation++;
  if (buildCounterOperation < 3) {
    unittest.expect(o.done, unittest.isTrue);
    checkStatus(o.error);
    checkUnnamed2525(o.metadata);
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed2526(o.response);
  }
  buildCounterOperation--;
}

core.int buildCounterOperationEvent = 0;
buildOperationEvent() {
  var o = new api.OperationEvent();
  buildCounterOperationEvent++;
  if (buildCounterOperationEvent < 3) {
    o.description = "foo";
  }
  buildCounterOperationEvent--;
  return o;
}

checkOperationEvent(api.OperationEvent o) {
  buildCounterOperationEvent++;
  if (buildCounterOperationEvent < 3) {
    unittest.expect(o.description, unittest.equals('foo'));
  }
  buildCounterOperationEvent--;
}

buildUnnamed2527() {
  var o = new core.List<api.OperationEvent>();
  o.add(buildOperationEvent());
  o.add(buildOperationEvent());
  return o;
}

checkUnnamed2527(core.List<api.OperationEvent> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOperationEvent(o[0]);
  checkOperationEvent(o[1]);
}

buildUnnamed2528() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed2528(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted11 = (o["x"]) as core.Map; unittest.expect(casted11, unittest.hasLength(3)); unittest.expect(casted11["list"], unittest.equals([1, 2, 3])); unittest.expect(casted11["bool"], unittest.equals(true)); unittest.expect(casted11["string"], unittest.equals('foo')); 
  var casted12 = (o["y"]) as core.Map; unittest.expect(casted12, unittest.hasLength(3)); unittest.expect(casted12["list"], unittest.equals([1, 2, 3])); unittest.expect(casted12["bool"], unittest.equals(true)); unittest.expect(casted12["string"], unittest.equals('foo')); 
}

core.int buildCounterOperationMetadata = 0;
buildOperationMetadata() {
  var o = new api.OperationMetadata();
  buildCounterOperationMetadata++;
  if (buildCounterOperationMetadata < 3) {
    o.createTime = "foo";
    o.endTime = "foo";
    o.events = buildUnnamed2527();
    o.projectId = "foo";
    o.request = buildUnnamed2528();
  }
  buildCounterOperationMetadata--;
  return o;
}

checkOperationMetadata(api.OperationMetadata o) {
  buildCounterOperationMetadata++;
  if (buildCounterOperationMetadata < 3) {
    unittest.expect(o.createTime, unittest.equals('foo'));
    unittest.expect(o.endTime, unittest.equals('foo'));
    checkUnnamed2527(o.events);
    unittest.expect(o.projectId, unittest.equals('foo'));
    checkUnnamed2528(o.request);
  }
  buildCounterOperationMetadata--;
}

buildUnnamed2529() {
  var o = new core.List<api.Binding>();
  o.add(buildBinding());
  o.add(buildBinding());
  return o;
}

checkUnnamed2529(core.List<api.Binding> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkBinding(o[0]);
  checkBinding(o[1]);
}

core.int buildCounterPolicy = 0;
buildPolicy() {
  var o = new api.Policy();
  buildCounterPolicy++;
  if (buildCounterPolicy < 3) {
    o.bindings = buildUnnamed2529();
    o.etag = "foo";
    o.version = 42;
  }
  buildCounterPolicy--;
  return o;
}

checkPolicy(api.Policy o) {
  buildCounterPolicy++;
  if (buildCounterPolicy < 3) {
    checkUnnamed2529(o.bindings);
    unittest.expect(o.etag, unittest.equals('foo'));
    unittest.expect(o.version, unittest.equals(42));
  }
  buildCounterPolicy--;
}

core.int buildCounterPosition = 0;
buildPosition() {
  var o = new api.Position();
  buildCounterPosition++;
  if (buildCounterPosition < 3) {
    o.position = "foo";
    o.referenceName = "foo";
    o.reverseStrand = true;
  }
  buildCounterPosition--;
  return o;
}

checkPosition(api.Position o) {
  buildCounterPosition++;
  if (buildCounterPosition < 3) {
    unittest.expect(o.position, unittest.equals('foo'));
    unittest.expect(o.referenceName, unittest.equals('foo'));
    unittest.expect(o.reverseStrand, unittest.isTrue);
  }
  buildCounterPosition--;
}

core.int buildCounterProgram = 0;
buildProgram() {
  var o = new api.Program();
  buildCounterProgram++;
  if (buildCounterProgram < 3) {
    o.commandLine = "foo";
    o.id = "foo";
    o.name = "foo";
    o.prevProgramId = "foo";
    o.version = "foo";
  }
  buildCounterProgram--;
  return o;
}

checkProgram(api.Program o) {
  buildCounterProgram++;
  if (buildCounterProgram < 3) {
    unittest.expect(o.commandLine, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.prevProgramId, unittest.equals('foo'));
    unittest.expect(o.version, unittest.equals('foo'));
  }
  buildCounterProgram--;
}

core.int buildCounterRange = 0;
buildRange() {
  var o = new api.Range();
  buildCounterRange++;
  if (buildCounterRange < 3) {
    o.end = "foo";
    o.referenceName = "foo";
    o.start = "foo";
  }
  buildCounterRange--;
  return o;
}

checkRange(api.Range o) {
  buildCounterRange++;
  if (buildCounterRange < 3) {
    unittest.expect(o.end, unittest.equals('foo'));
    unittest.expect(o.referenceName, unittest.equals('foo'));
    unittest.expect(o.start, unittest.equals('foo'));
  }
  buildCounterRange--;
}

buildUnnamed2530() {
  var o = new core.List<core.int>();
  o.add(42);
  o.add(42);
  return o;
}

checkUnnamed2530(core.List<core.int> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals(42));
  unittest.expect(o[1], unittest.equals(42));
}

buildUnnamed2531() {
  var o = new core.List<core.Object>();
  o.add({'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'});
  o.add({'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'});
  return o;
}

checkUnnamed2531(core.List<core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted13 = (o[0]) as core.Map; unittest.expect(casted13, unittest.hasLength(3)); unittest.expect(casted13["list"], unittest.equals([1, 2, 3])); unittest.expect(casted13["bool"], unittest.equals(true)); unittest.expect(casted13["string"], unittest.equals('foo')); 
  var casted14 = (o[1]) as core.Map; unittest.expect(casted14, unittest.hasLength(3)); unittest.expect(casted14["list"], unittest.equals([1, 2, 3])); unittest.expect(casted14["bool"], unittest.equals(true)); unittest.expect(casted14["string"], unittest.equals('foo')); 
}

buildUnnamed2532() {
  var o = new core.Map<core.String, core.List<core.Object>>();
  o["x"] = buildUnnamed2531();
  o["y"] = buildUnnamed2531();
  return o;
}

checkUnnamed2532(core.Map<core.String, core.List<core.Object>> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUnnamed2531(o["x"]);
  checkUnnamed2531(o["y"]);
}

core.int buildCounterRead = 0;
buildRead() {
  var o = new api.Read();
  buildCounterRead++;
  if (buildCounterRead < 3) {
    o.alignedQuality = buildUnnamed2530();
    o.alignedSequence = "foo";
    o.alignment = buildLinearAlignment();
    o.duplicateFragment = true;
    o.failedVendorQualityChecks = true;
    o.fragmentLength = 42;
    o.fragmentName = "foo";
    o.id = "foo";
    o.info = buildUnnamed2532();
    o.nextMatePosition = buildPosition();
    o.numberReads = 42;
    o.properPlacement = true;
    o.readGroupId = "foo";
    o.readGroupSetId = "foo";
    o.readNumber = 42;
    o.secondaryAlignment = true;
    o.supplementaryAlignment = true;
  }
  buildCounterRead--;
  return o;
}

checkRead(api.Read o) {
  buildCounterRead++;
  if (buildCounterRead < 3) {
    checkUnnamed2530(o.alignedQuality);
    unittest.expect(o.alignedSequence, unittest.equals('foo'));
    checkLinearAlignment(o.alignment);
    unittest.expect(o.duplicateFragment, unittest.isTrue);
    unittest.expect(o.failedVendorQualityChecks, unittest.isTrue);
    unittest.expect(o.fragmentLength, unittest.equals(42));
    unittest.expect(o.fragmentName, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2532(o.info);
    checkPosition(o.nextMatePosition);
    unittest.expect(o.numberReads, unittest.equals(42));
    unittest.expect(o.properPlacement, unittest.isTrue);
    unittest.expect(o.readGroupId, unittest.equals('foo'));
    unittest.expect(o.readGroupSetId, unittest.equals('foo'));
    unittest.expect(o.readNumber, unittest.equals(42));
    unittest.expect(o.secondaryAlignment, unittest.isTrue);
    unittest.expect(o.supplementaryAlignment, unittest.isTrue);
  }
  buildCounterRead--;
}

buildUnnamed2533() {
  var o = new core.List<core.Object>();
  o.add({'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'});
  o.add({'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'});
  return o;
}

checkUnnamed2533(core.List<core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted15 = (o[0]) as core.Map; unittest.expect(casted15, unittest.hasLength(3)); unittest.expect(casted15["list"], unittest.equals([1, 2, 3])); unittest.expect(casted15["bool"], unittest.equals(true)); unittest.expect(casted15["string"], unittest.equals('foo')); 
  var casted16 = (o[1]) as core.Map; unittest.expect(casted16, unittest.hasLength(3)); unittest.expect(casted16["list"], unittest.equals([1, 2, 3])); unittest.expect(casted16["bool"], unittest.equals(true)); unittest.expect(casted16["string"], unittest.equals('foo')); 
}

buildUnnamed2534() {
  var o = new core.Map<core.String, core.List<core.Object>>();
  o["x"] = buildUnnamed2533();
  o["y"] = buildUnnamed2533();
  return o;
}

checkUnnamed2534(core.Map<core.String, core.List<core.Object>> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUnnamed2533(o["x"]);
  checkUnnamed2533(o["y"]);
}

buildUnnamed2535() {
  var o = new core.List<api.Program>();
  o.add(buildProgram());
  o.add(buildProgram());
  return o;
}

checkUnnamed2535(core.List<api.Program> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkProgram(o[0]);
  checkProgram(o[1]);
}

core.int buildCounterReadGroup = 0;
buildReadGroup() {
  var o = new api.ReadGroup();
  buildCounterReadGroup++;
  if (buildCounterReadGroup < 3) {
    o.datasetId = "foo";
    o.description = "foo";
    o.experiment = buildExperiment();
    o.id = "foo";
    o.info = buildUnnamed2534();
    o.name = "foo";
    o.predictedInsertSize = 42;
    o.programs = buildUnnamed2535();
    o.referenceSetId = "foo";
    o.sampleId = "foo";
  }
  buildCounterReadGroup--;
  return o;
}

checkReadGroup(api.ReadGroup o) {
  buildCounterReadGroup++;
  if (buildCounterReadGroup < 3) {
    unittest.expect(o.datasetId, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    checkExperiment(o.experiment);
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2534(o.info);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.predictedInsertSize, unittest.equals(42));
    checkUnnamed2535(o.programs);
    unittest.expect(o.referenceSetId, unittest.equals('foo'));
    unittest.expect(o.sampleId, unittest.equals('foo'));
  }
  buildCounterReadGroup--;
}

buildUnnamed2536() {
  var o = new core.List<core.Object>();
  o.add({'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'});
  o.add({'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'});
  return o;
}

checkUnnamed2536(core.List<core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted17 = (o[0]) as core.Map; unittest.expect(casted17, unittest.hasLength(3)); unittest.expect(casted17["list"], unittest.equals([1, 2, 3])); unittest.expect(casted17["bool"], unittest.equals(true)); unittest.expect(casted17["string"], unittest.equals('foo')); 
  var casted18 = (o[1]) as core.Map; unittest.expect(casted18, unittest.hasLength(3)); unittest.expect(casted18["list"], unittest.equals([1, 2, 3])); unittest.expect(casted18["bool"], unittest.equals(true)); unittest.expect(casted18["string"], unittest.equals('foo')); 
}

buildUnnamed2537() {
  var o = new core.Map<core.String, core.List<core.Object>>();
  o["x"] = buildUnnamed2536();
  o["y"] = buildUnnamed2536();
  return o;
}

checkUnnamed2537(core.Map<core.String, core.List<core.Object>> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUnnamed2536(o["x"]);
  checkUnnamed2536(o["y"]);
}

buildUnnamed2538() {
  var o = new core.List<api.ReadGroup>();
  o.add(buildReadGroup());
  o.add(buildReadGroup());
  return o;
}

checkUnnamed2538(core.List<api.ReadGroup> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkReadGroup(o[0]);
  checkReadGroup(o[1]);
}

core.int buildCounterReadGroupSet = 0;
buildReadGroupSet() {
  var o = new api.ReadGroupSet();
  buildCounterReadGroupSet++;
  if (buildCounterReadGroupSet < 3) {
    o.datasetId = "foo";
    o.filename = "foo";
    o.id = "foo";
    o.info = buildUnnamed2537();
    o.name = "foo";
    o.readGroups = buildUnnamed2538();
    o.referenceSetId = "foo";
  }
  buildCounterReadGroupSet--;
  return o;
}

checkReadGroupSet(api.ReadGroupSet o) {
  buildCounterReadGroupSet++;
  if (buildCounterReadGroupSet < 3) {
    unittest.expect(o.datasetId, unittest.equals('foo'));
    unittest.expect(o.filename, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2537(o.info);
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed2538(o.readGroups);
    unittest.expect(o.referenceSetId, unittest.equals('foo'));
  }
  buildCounterReadGroupSet--;
}

buildUnnamed2539() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2539(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterReference = 0;
buildReference() {
  var o = new api.Reference();
  buildCounterReference++;
  if (buildCounterReference < 3) {
    o.id = "foo";
    o.length = "foo";
    o.md5checksum = "foo";
    o.name = "foo";
    o.ncbiTaxonId = 42;
    o.sourceAccessions = buildUnnamed2539();
    o.sourceUri = "foo";
  }
  buildCounterReference--;
  return o;
}

checkReference(api.Reference o) {
  buildCounterReference++;
  if (buildCounterReference < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.length, unittest.equals('foo'));
    unittest.expect(o.md5checksum, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.ncbiTaxonId, unittest.equals(42));
    checkUnnamed2539(o.sourceAccessions);
    unittest.expect(o.sourceUri, unittest.equals('foo'));
  }
  buildCounterReference--;
}

core.int buildCounterReferenceBound = 0;
buildReferenceBound() {
  var o = new api.ReferenceBound();
  buildCounterReferenceBound++;
  if (buildCounterReferenceBound < 3) {
    o.referenceName = "foo";
    o.upperBound = "foo";
  }
  buildCounterReferenceBound--;
  return o;
}

checkReferenceBound(api.ReferenceBound o) {
  buildCounterReferenceBound++;
  if (buildCounterReferenceBound < 3) {
    unittest.expect(o.referenceName, unittest.equals('foo'));
    unittest.expect(o.upperBound, unittest.equals('foo'));
  }
  buildCounterReferenceBound--;
}

buildUnnamed2540() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2540(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2541() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2541(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterReferenceSet = 0;
buildReferenceSet() {
  var o = new api.ReferenceSet();
  buildCounterReferenceSet++;
  if (buildCounterReferenceSet < 3) {
    o.assemblyId = "foo";
    o.description = "foo";
    o.id = "foo";
    o.md5checksum = "foo";
    o.ncbiTaxonId = 42;
    o.referenceIds = buildUnnamed2540();
    o.sourceAccessions = buildUnnamed2541();
    o.sourceUri = "foo";
  }
  buildCounterReferenceSet--;
  return o;
}

checkReferenceSet(api.ReferenceSet o) {
  buildCounterReferenceSet++;
  if (buildCounterReferenceSet < 3) {
    unittest.expect(o.assemblyId, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.md5checksum, unittest.equals('foo'));
    unittest.expect(o.ncbiTaxonId, unittest.equals(42));
    checkUnnamed2540(o.referenceIds);
    checkUnnamed2541(o.sourceAccessions);
    unittest.expect(o.sourceUri, unittest.equals('foo'));
  }
  buildCounterReferenceSet--;
}

buildUnnamed2542() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2542(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2543() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2543(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterSearchAnnotationSetsRequest = 0;
buildSearchAnnotationSetsRequest() {
  var o = new api.SearchAnnotationSetsRequest();
  buildCounterSearchAnnotationSetsRequest++;
  if (buildCounterSearchAnnotationSetsRequest < 3) {
    o.datasetIds = buildUnnamed2542();
    o.name = "foo";
    o.pageSize = 42;
    o.pageToken = "foo";
    o.referenceSetId = "foo";
    o.types = buildUnnamed2543();
  }
  buildCounterSearchAnnotationSetsRequest--;
  return o;
}

checkSearchAnnotationSetsRequest(api.SearchAnnotationSetsRequest o) {
  buildCounterSearchAnnotationSetsRequest++;
  if (buildCounterSearchAnnotationSetsRequest < 3) {
    checkUnnamed2542(o.datasetIds);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.pageSize, unittest.equals(42));
    unittest.expect(o.pageToken, unittest.equals('foo'));
    unittest.expect(o.referenceSetId, unittest.equals('foo'));
    checkUnnamed2543(o.types);
  }
  buildCounterSearchAnnotationSetsRequest--;
}

buildUnnamed2544() {
  var o = new core.List<api.AnnotationSet>();
  o.add(buildAnnotationSet());
  o.add(buildAnnotationSet());
  return o;
}

checkUnnamed2544(core.List<api.AnnotationSet> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAnnotationSet(o[0]);
  checkAnnotationSet(o[1]);
}

core.int buildCounterSearchAnnotationSetsResponse = 0;
buildSearchAnnotationSetsResponse() {
  var o = new api.SearchAnnotationSetsResponse();
  buildCounterSearchAnnotationSetsResponse++;
  if (buildCounterSearchAnnotationSetsResponse < 3) {
    o.annotationSets = buildUnnamed2544();
    o.nextPageToken = "foo";
  }
  buildCounterSearchAnnotationSetsResponse--;
  return o;
}

checkSearchAnnotationSetsResponse(api.SearchAnnotationSetsResponse o) {
  buildCounterSearchAnnotationSetsResponse++;
  if (buildCounterSearchAnnotationSetsResponse < 3) {
    checkUnnamed2544(o.annotationSets);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterSearchAnnotationSetsResponse--;
}

buildUnnamed2545() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2545(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterSearchAnnotationsRequest = 0;
buildSearchAnnotationsRequest() {
  var o = new api.SearchAnnotationsRequest();
  buildCounterSearchAnnotationsRequest++;
  if (buildCounterSearchAnnotationsRequest < 3) {
    o.annotationSetIds = buildUnnamed2545();
    o.end = "foo";
    o.pageSize = 42;
    o.pageToken = "foo";
    o.referenceId = "foo";
    o.referenceName = "foo";
    o.start = "foo";
  }
  buildCounterSearchAnnotationsRequest--;
  return o;
}

checkSearchAnnotationsRequest(api.SearchAnnotationsRequest o) {
  buildCounterSearchAnnotationsRequest++;
  if (buildCounterSearchAnnotationsRequest < 3) {
    checkUnnamed2545(o.annotationSetIds);
    unittest.expect(o.end, unittest.equals('foo'));
    unittest.expect(o.pageSize, unittest.equals(42));
    unittest.expect(o.pageToken, unittest.equals('foo'));
    unittest.expect(o.referenceId, unittest.equals('foo'));
    unittest.expect(o.referenceName, unittest.equals('foo'));
    unittest.expect(o.start, unittest.equals('foo'));
  }
  buildCounterSearchAnnotationsRequest--;
}

buildUnnamed2546() {
  var o = new core.List<api.Annotation>();
  o.add(buildAnnotation());
  o.add(buildAnnotation());
  return o;
}

checkUnnamed2546(core.List<api.Annotation> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAnnotation(o[0]);
  checkAnnotation(o[1]);
}

core.int buildCounterSearchAnnotationsResponse = 0;
buildSearchAnnotationsResponse() {
  var o = new api.SearchAnnotationsResponse();
  buildCounterSearchAnnotationsResponse++;
  if (buildCounterSearchAnnotationsResponse < 3) {
    o.annotations = buildUnnamed2546();
    o.nextPageToken = "foo";
  }
  buildCounterSearchAnnotationsResponse--;
  return o;
}

checkSearchAnnotationsResponse(api.SearchAnnotationsResponse o) {
  buildCounterSearchAnnotationsResponse++;
  if (buildCounterSearchAnnotationsResponse < 3) {
    checkUnnamed2546(o.annotations);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterSearchAnnotationsResponse--;
}

buildUnnamed2547() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2547(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterSearchCallSetsRequest = 0;
buildSearchCallSetsRequest() {
  var o = new api.SearchCallSetsRequest();
  buildCounterSearchCallSetsRequest++;
  if (buildCounterSearchCallSetsRequest < 3) {
    o.name = "foo";
    o.pageSize = 42;
    o.pageToken = "foo";
    o.variantSetIds = buildUnnamed2547();
  }
  buildCounterSearchCallSetsRequest--;
  return o;
}

checkSearchCallSetsRequest(api.SearchCallSetsRequest o) {
  buildCounterSearchCallSetsRequest++;
  if (buildCounterSearchCallSetsRequest < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.pageSize, unittest.equals(42));
    unittest.expect(o.pageToken, unittest.equals('foo'));
    checkUnnamed2547(o.variantSetIds);
  }
  buildCounterSearchCallSetsRequest--;
}

buildUnnamed2548() {
  var o = new core.List<api.CallSet>();
  o.add(buildCallSet());
  o.add(buildCallSet());
  return o;
}

checkUnnamed2548(core.List<api.CallSet> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCallSet(o[0]);
  checkCallSet(o[1]);
}

core.int buildCounterSearchCallSetsResponse = 0;
buildSearchCallSetsResponse() {
  var o = new api.SearchCallSetsResponse();
  buildCounterSearchCallSetsResponse++;
  if (buildCounterSearchCallSetsResponse < 3) {
    o.callSets = buildUnnamed2548();
    o.nextPageToken = "foo";
  }
  buildCounterSearchCallSetsResponse--;
  return o;
}

checkSearchCallSetsResponse(api.SearchCallSetsResponse o) {
  buildCounterSearchCallSetsResponse++;
  if (buildCounterSearchCallSetsResponse < 3) {
    checkUnnamed2548(o.callSets);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterSearchCallSetsResponse--;
}

buildUnnamed2549() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2549(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterSearchReadGroupSetsRequest = 0;
buildSearchReadGroupSetsRequest() {
  var o = new api.SearchReadGroupSetsRequest();
  buildCounterSearchReadGroupSetsRequest++;
  if (buildCounterSearchReadGroupSetsRequest < 3) {
    o.datasetIds = buildUnnamed2549();
    o.name = "foo";
    o.pageSize = 42;
    o.pageToken = "foo";
  }
  buildCounterSearchReadGroupSetsRequest--;
  return o;
}

checkSearchReadGroupSetsRequest(api.SearchReadGroupSetsRequest o) {
  buildCounterSearchReadGroupSetsRequest++;
  if (buildCounterSearchReadGroupSetsRequest < 3) {
    checkUnnamed2549(o.datasetIds);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.pageSize, unittest.equals(42));
    unittest.expect(o.pageToken, unittest.equals('foo'));
  }
  buildCounterSearchReadGroupSetsRequest--;
}

buildUnnamed2550() {
  var o = new core.List<api.ReadGroupSet>();
  o.add(buildReadGroupSet());
  o.add(buildReadGroupSet());
  return o;
}

checkUnnamed2550(core.List<api.ReadGroupSet> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkReadGroupSet(o[0]);
  checkReadGroupSet(o[1]);
}

core.int buildCounterSearchReadGroupSetsResponse = 0;
buildSearchReadGroupSetsResponse() {
  var o = new api.SearchReadGroupSetsResponse();
  buildCounterSearchReadGroupSetsResponse++;
  if (buildCounterSearchReadGroupSetsResponse < 3) {
    o.nextPageToken = "foo";
    o.readGroupSets = buildUnnamed2550();
  }
  buildCounterSearchReadGroupSetsResponse--;
  return o;
}

checkSearchReadGroupSetsResponse(api.SearchReadGroupSetsResponse o) {
  buildCounterSearchReadGroupSetsResponse++;
  if (buildCounterSearchReadGroupSetsResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed2550(o.readGroupSets);
  }
  buildCounterSearchReadGroupSetsResponse--;
}

buildUnnamed2551() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2551(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2552() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2552(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterSearchReadsRequest = 0;
buildSearchReadsRequest() {
  var o = new api.SearchReadsRequest();
  buildCounterSearchReadsRequest++;
  if (buildCounterSearchReadsRequest < 3) {
    o.end = "foo";
    o.pageSize = 42;
    o.pageToken = "foo";
    o.readGroupIds = buildUnnamed2551();
    o.readGroupSetIds = buildUnnamed2552();
    o.referenceName = "foo";
    o.start = "foo";
  }
  buildCounterSearchReadsRequest--;
  return o;
}

checkSearchReadsRequest(api.SearchReadsRequest o) {
  buildCounterSearchReadsRequest++;
  if (buildCounterSearchReadsRequest < 3) {
    unittest.expect(o.end, unittest.equals('foo'));
    unittest.expect(o.pageSize, unittest.equals(42));
    unittest.expect(o.pageToken, unittest.equals('foo'));
    checkUnnamed2551(o.readGroupIds);
    checkUnnamed2552(o.readGroupSetIds);
    unittest.expect(o.referenceName, unittest.equals('foo'));
    unittest.expect(o.start, unittest.equals('foo'));
  }
  buildCounterSearchReadsRequest--;
}

buildUnnamed2553() {
  var o = new core.List<api.Read>();
  o.add(buildRead());
  o.add(buildRead());
  return o;
}

checkUnnamed2553(core.List<api.Read> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRead(o[0]);
  checkRead(o[1]);
}

core.int buildCounterSearchReadsResponse = 0;
buildSearchReadsResponse() {
  var o = new api.SearchReadsResponse();
  buildCounterSearchReadsResponse++;
  if (buildCounterSearchReadsResponse < 3) {
    o.alignments = buildUnnamed2553();
    o.nextPageToken = "foo";
  }
  buildCounterSearchReadsResponse--;
  return o;
}

checkSearchReadsResponse(api.SearchReadsResponse o) {
  buildCounterSearchReadsResponse++;
  if (buildCounterSearchReadsResponse < 3) {
    checkUnnamed2553(o.alignments);
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
  }
  buildCounterSearchReadsResponse--;
}

buildUnnamed2554() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2554(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2555() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2555(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterSearchReferenceSetsRequest = 0;
buildSearchReferenceSetsRequest() {
  var o = new api.SearchReferenceSetsRequest();
  buildCounterSearchReferenceSetsRequest++;
  if (buildCounterSearchReferenceSetsRequest < 3) {
    o.accessions = buildUnnamed2554();
    o.assemblyId = "foo";
    o.md5checksums = buildUnnamed2555();
    o.pageSize = 42;
    o.pageToken = "foo";
  }
  buildCounterSearchReferenceSetsRequest--;
  return o;
}

checkSearchReferenceSetsRequest(api.SearchReferenceSetsRequest o) {
  buildCounterSearchReferenceSetsRequest++;
  if (buildCounterSearchReferenceSetsRequest < 3) {
    checkUnnamed2554(o.accessions);
    unittest.expect(o.assemblyId, unittest.equals('foo'));
    checkUnnamed2555(o.md5checksums);
    unittest.expect(o.pageSize, unittest.equals(42));
    unittest.expect(o.pageToken, unittest.equals('foo'));
  }
  buildCounterSearchReferenceSetsRequest--;
}

buildUnnamed2556() {
  var o = new core.List<api.ReferenceSet>();
  o.add(buildReferenceSet());
  o.add(buildReferenceSet());
  return o;
}

checkUnnamed2556(core.List<api.ReferenceSet> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkReferenceSet(o[0]);
  checkReferenceSet(o[1]);
}

core.int buildCounterSearchReferenceSetsResponse = 0;
buildSearchReferenceSetsResponse() {
  var o = new api.SearchReferenceSetsResponse();
  buildCounterSearchReferenceSetsResponse++;
  if (buildCounterSearchReferenceSetsResponse < 3) {
    o.nextPageToken = "foo";
    o.referenceSets = buildUnnamed2556();
  }
  buildCounterSearchReferenceSetsResponse--;
  return o;
}

checkSearchReferenceSetsResponse(api.SearchReferenceSetsResponse o) {
  buildCounterSearchReferenceSetsResponse++;
  if (buildCounterSearchReferenceSetsResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed2556(o.referenceSets);
  }
  buildCounterSearchReferenceSetsResponse--;
}

buildUnnamed2557() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2557(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2558() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2558(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterSearchReferencesRequest = 0;
buildSearchReferencesRequest() {
  var o = new api.SearchReferencesRequest();
  buildCounterSearchReferencesRequest++;
  if (buildCounterSearchReferencesRequest < 3) {
    o.accessions = buildUnnamed2557();
    o.md5checksums = buildUnnamed2558();
    o.pageSize = 42;
    o.pageToken = "foo";
    o.referenceSetId = "foo";
  }
  buildCounterSearchReferencesRequest--;
  return o;
}

checkSearchReferencesRequest(api.SearchReferencesRequest o) {
  buildCounterSearchReferencesRequest++;
  if (buildCounterSearchReferencesRequest < 3) {
    checkUnnamed2557(o.accessions);
    checkUnnamed2558(o.md5checksums);
    unittest.expect(o.pageSize, unittest.equals(42));
    unittest.expect(o.pageToken, unittest.equals('foo'));
    unittest.expect(o.referenceSetId, unittest.equals('foo'));
  }
  buildCounterSearchReferencesRequest--;
}

buildUnnamed2559() {
  var o = new core.List<api.Reference>();
  o.add(buildReference());
  o.add(buildReference());
  return o;
}

checkUnnamed2559(core.List<api.Reference> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkReference(o[0]);
  checkReference(o[1]);
}

core.int buildCounterSearchReferencesResponse = 0;
buildSearchReferencesResponse() {
  var o = new api.SearchReferencesResponse();
  buildCounterSearchReferencesResponse++;
  if (buildCounterSearchReferencesResponse < 3) {
    o.nextPageToken = "foo";
    o.references = buildUnnamed2559();
  }
  buildCounterSearchReferencesResponse--;
  return o;
}

checkSearchReferencesResponse(api.SearchReferencesResponse o) {
  buildCounterSearchReferencesResponse++;
  if (buildCounterSearchReferencesResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed2559(o.references);
  }
  buildCounterSearchReferencesResponse--;
}

buildUnnamed2560() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2560(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterSearchVariantSetsRequest = 0;
buildSearchVariantSetsRequest() {
  var o = new api.SearchVariantSetsRequest();
  buildCounterSearchVariantSetsRequest++;
  if (buildCounterSearchVariantSetsRequest < 3) {
    o.datasetIds = buildUnnamed2560();
    o.pageSize = 42;
    o.pageToken = "foo";
  }
  buildCounterSearchVariantSetsRequest--;
  return o;
}

checkSearchVariantSetsRequest(api.SearchVariantSetsRequest o) {
  buildCounterSearchVariantSetsRequest++;
  if (buildCounterSearchVariantSetsRequest < 3) {
    checkUnnamed2560(o.datasetIds);
    unittest.expect(o.pageSize, unittest.equals(42));
    unittest.expect(o.pageToken, unittest.equals('foo'));
  }
  buildCounterSearchVariantSetsRequest--;
}

buildUnnamed2561() {
  var o = new core.List<api.VariantSet>();
  o.add(buildVariantSet());
  o.add(buildVariantSet());
  return o;
}

checkUnnamed2561(core.List<api.VariantSet> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkVariantSet(o[0]);
  checkVariantSet(o[1]);
}

core.int buildCounterSearchVariantSetsResponse = 0;
buildSearchVariantSetsResponse() {
  var o = new api.SearchVariantSetsResponse();
  buildCounterSearchVariantSetsResponse++;
  if (buildCounterSearchVariantSetsResponse < 3) {
    o.nextPageToken = "foo";
    o.variantSets = buildUnnamed2561();
  }
  buildCounterSearchVariantSetsResponse--;
  return o;
}

checkSearchVariantSetsResponse(api.SearchVariantSetsResponse o) {
  buildCounterSearchVariantSetsResponse++;
  if (buildCounterSearchVariantSetsResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed2561(o.variantSets);
  }
  buildCounterSearchVariantSetsResponse--;
}

buildUnnamed2562() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2562(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2563() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2563(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterSearchVariantsRequest = 0;
buildSearchVariantsRequest() {
  var o = new api.SearchVariantsRequest();
  buildCounterSearchVariantsRequest++;
  if (buildCounterSearchVariantsRequest < 3) {
    o.callSetIds = buildUnnamed2562();
    o.end = "foo";
    o.maxCalls = 42;
    o.pageSize = 42;
    o.pageToken = "foo";
    o.referenceName = "foo";
    o.start = "foo";
    o.variantName = "foo";
    o.variantSetIds = buildUnnamed2563();
  }
  buildCounterSearchVariantsRequest--;
  return o;
}

checkSearchVariantsRequest(api.SearchVariantsRequest o) {
  buildCounterSearchVariantsRequest++;
  if (buildCounterSearchVariantsRequest < 3) {
    checkUnnamed2562(o.callSetIds);
    unittest.expect(o.end, unittest.equals('foo'));
    unittest.expect(o.maxCalls, unittest.equals(42));
    unittest.expect(o.pageSize, unittest.equals(42));
    unittest.expect(o.pageToken, unittest.equals('foo'));
    unittest.expect(o.referenceName, unittest.equals('foo'));
    unittest.expect(o.start, unittest.equals('foo'));
    unittest.expect(o.variantName, unittest.equals('foo'));
    checkUnnamed2563(o.variantSetIds);
  }
  buildCounterSearchVariantsRequest--;
}

buildUnnamed2564() {
  var o = new core.List<api.Variant>();
  o.add(buildVariant());
  o.add(buildVariant());
  return o;
}

checkUnnamed2564(core.List<api.Variant> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkVariant(o[0]);
  checkVariant(o[1]);
}

core.int buildCounterSearchVariantsResponse = 0;
buildSearchVariantsResponse() {
  var o = new api.SearchVariantsResponse();
  buildCounterSearchVariantsResponse++;
  if (buildCounterSearchVariantsResponse < 3) {
    o.nextPageToken = "foo";
    o.variants = buildUnnamed2564();
  }
  buildCounterSearchVariantsResponse--;
  return o;
}

checkSearchVariantsResponse(api.SearchVariantsResponse o) {
  buildCounterSearchVariantsResponse++;
  if (buildCounterSearchVariantsResponse < 3) {
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    checkUnnamed2564(o.variants);
  }
  buildCounterSearchVariantsResponse--;
}

core.int buildCounterSetIamPolicyRequest = 0;
buildSetIamPolicyRequest() {
  var o = new api.SetIamPolicyRequest();
  buildCounterSetIamPolicyRequest++;
  if (buildCounterSetIamPolicyRequest < 3) {
    o.policy = buildPolicy();
  }
  buildCounterSetIamPolicyRequest--;
  return o;
}

checkSetIamPolicyRequest(api.SetIamPolicyRequest o) {
  buildCounterSetIamPolicyRequest++;
  if (buildCounterSetIamPolicyRequest < 3) {
    checkPolicy(o.policy);
  }
  buildCounterSetIamPolicyRequest--;
}

buildUnnamed2565() {
  var o = new core.Map<core.String, core.Object>();
  o["x"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  o["y"] = {'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'};
  return o;
}

checkUnnamed2565(core.Map<core.String, core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted19 = (o["x"]) as core.Map; unittest.expect(casted19, unittest.hasLength(3)); unittest.expect(casted19["list"], unittest.equals([1, 2, 3])); unittest.expect(casted19["bool"], unittest.equals(true)); unittest.expect(casted19["string"], unittest.equals('foo')); 
  var casted20 = (o["y"]) as core.Map; unittest.expect(casted20, unittest.hasLength(3)); unittest.expect(casted20["list"], unittest.equals([1, 2, 3])); unittest.expect(casted20["bool"], unittest.equals(true)); unittest.expect(casted20["string"], unittest.equals('foo')); 
}

buildUnnamed2566() {
  var o = new core.List<core.Map<core.String, core.Object>>();
  o.add(buildUnnamed2565());
  o.add(buildUnnamed2565());
  return o;
}

checkUnnamed2566(core.List<core.Map<core.String, core.Object>> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUnnamed2565(o[0]);
  checkUnnamed2565(o[1]);
}

core.int buildCounterStatus = 0;
buildStatus() {
  var o = new api.Status();
  buildCounterStatus++;
  if (buildCounterStatus < 3) {
    o.code = 42;
    o.details = buildUnnamed2566();
    o.message = "foo";
  }
  buildCounterStatus--;
  return o;
}

checkStatus(api.Status o) {
  buildCounterStatus++;
  if (buildCounterStatus < 3) {
    unittest.expect(o.code, unittest.equals(42));
    checkUnnamed2566(o.details);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterStatus--;
}

core.int buildCounterStreamReadsRequest = 0;
buildStreamReadsRequest() {
  var o = new api.StreamReadsRequest();
  buildCounterStreamReadsRequest++;
  if (buildCounterStreamReadsRequest < 3) {
    o.end = "foo";
    o.projectId = "foo";
    o.readGroupSetId = "foo";
    o.referenceName = "foo";
    o.shard = 42;
    o.start = "foo";
    o.totalShards = 42;
  }
  buildCounterStreamReadsRequest--;
  return o;
}

checkStreamReadsRequest(api.StreamReadsRequest o) {
  buildCounterStreamReadsRequest++;
  if (buildCounterStreamReadsRequest < 3) {
    unittest.expect(o.end, unittest.equals('foo'));
    unittest.expect(o.projectId, unittest.equals('foo'));
    unittest.expect(o.readGroupSetId, unittest.equals('foo'));
    unittest.expect(o.referenceName, unittest.equals('foo'));
    unittest.expect(o.shard, unittest.equals(42));
    unittest.expect(o.start, unittest.equals('foo'));
    unittest.expect(o.totalShards, unittest.equals(42));
  }
  buildCounterStreamReadsRequest--;
}

buildUnnamed2567() {
  var o = new core.List<api.Read>();
  o.add(buildRead());
  o.add(buildRead());
  return o;
}

checkUnnamed2567(core.List<api.Read> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRead(o[0]);
  checkRead(o[1]);
}

core.int buildCounterStreamReadsResponse = 0;
buildStreamReadsResponse() {
  var o = new api.StreamReadsResponse();
  buildCounterStreamReadsResponse++;
  if (buildCounterStreamReadsResponse < 3) {
    o.alignments = buildUnnamed2567();
  }
  buildCounterStreamReadsResponse--;
  return o;
}

checkStreamReadsResponse(api.StreamReadsResponse o) {
  buildCounterStreamReadsResponse++;
  if (buildCounterStreamReadsResponse < 3) {
    checkUnnamed2567(o.alignments);
  }
  buildCounterStreamReadsResponse--;
}

buildUnnamed2568() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2568(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterStreamVariantsRequest = 0;
buildStreamVariantsRequest() {
  var o = new api.StreamVariantsRequest();
  buildCounterStreamVariantsRequest++;
  if (buildCounterStreamVariantsRequest < 3) {
    o.callSetIds = buildUnnamed2568();
    o.end = "foo";
    o.projectId = "foo";
    o.referenceName = "foo";
    o.start = "foo";
    o.variantSetId = "foo";
  }
  buildCounterStreamVariantsRequest--;
  return o;
}

checkStreamVariantsRequest(api.StreamVariantsRequest o) {
  buildCounterStreamVariantsRequest++;
  if (buildCounterStreamVariantsRequest < 3) {
    checkUnnamed2568(o.callSetIds);
    unittest.expect(o.end, unittest.equals('foo'));
    unittest.expect(o.projectId, unittest.equals('foo'));
    unittest.expect(o.referenceName, unittest.equals('foo'));
    unittest.expect(o.start, unittest.equals('foo'));
    unittest.expect(o.variantSetId, unittest.equals('foo'));
  }
  buildCounterStreamVariantsRequest--;
}

buildUnnamed2569() {
  var o = new core.List<api.Variant>();
  o.add(buildVariant());
  o.add(buildVariant());
  return o;
}

checkUnnamed2569(core.List<api.Variant> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkVariant(o[0]);
  checkVariant(o[1]);
}

core.int buildCounterStreamVariantsResponse = 0;
buildStreamVariantsResponse() {
  var o = new api.StreamVariantsResponse();
  buildCounterStreamVariantsResponse++;
  if (buildCounterStreamVariantsResponse < 3) {
    o.variants = buildUnnamed2569();
  }
  buildCounterStreamVariantsResponse--;
  return o;
}

checkStreamVariantsResponse(api.StreamVariantsResponse o) {
  buildCounterStreamVariantsResponse++;
  if (buildCounterStreamVariantsResponse < 3) {
    checkUnnamed2569(o.variants);
  }
  buildCounterStreamVariantsResponse--;
}

buildUnnamed2570() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2570(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterTestIamPermissionsRequest = 0;
buildTestIamPermissionsRequest() {
  var o = new api.TestIamPermissionsRequest();
  buildCounterTestIamPermissionsRequest++;
  if (buildCounterTestIamPermissionsRequest < 3) {
    o.permissions = buildUnnamed2570();
  }
  buildCounterTestIamPermissionsRequest--;
  return o;
}

checkTestIamPermissionsRequest(api.TestIamPermissionsRequest o) {
  buildCounterTestIamPermissionsRequest++;
  if (buildCounterTestIamPermissionsRequest < 3) {
    checkUnnamed2570(o.permissions);
  }
  buildCounterTestIamPermissionsRequest--;
}

buildUnnamed2571() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2571(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterTestIamPermissionsResponse = 0;
buildTestIamPermissionsResponse() {
  var o = new api.TestIamPermissionsResponse();
  buildCounterTestIamPermissionsResponse++;
  if (buildCounterTestIamPermissionsResponse < 3) {
    o.permissions = buildUnnamed2571();
  }
  buildCounterTestIamPermissionsResponse--;
  return o;
}

checkTestIamPermissionsResponse(api.TestIamPermissionsResponse o) {
  buildCounterTestIamPermissionsResponse++;
  if (buildCounterTestIamPermissionsResponse < 3) {
    checkUnnamed2571(o.permissions);
  }
  buildCounterTestIamPermissionsResponse--;
}

buildUnnamed2572() {
  var o = new core.List<api.Exon>();
  o.add(buildExon());
  o.add(buildExon());
  return o;
}

checkUnnamed2572(core.List<api.Exon> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkExon(o[0]);
  checkExon(o[1]);
}

core.int buildCounterTranscript = 0;
buildTranscript() {
  var o = new api.Transcript();
  buildCounterTranscript++;
  if (buildCounterTranscript < 3) {
    o.codingSequence = buildCodingSequence();
    o.exons = buildUnnamed2572();
    o.geneId = "foo";
  }
  buildCounterTranscript--;
  return o;
}

checkTranscript(api.Transcript o) {
  buildCounterTranscript++;
  if (buildCounterTranscript < 3) {
    checkCodingSequence(o.codingSequence);
    checkUnnamed2572(o.exons);
    unittest.expect(o.geneId, unittest.equals('foo'));
  }
  buildCounterTranscript--;
}

core.int buildCounterUndeleteDatasetRequest = 0;
buildUndeleteDatasetRequest() {
  var o = new api.UndeleteDatasetRequest();
  buildCounterUndeleteDatasetRequest++;
  if (buildCounterUndeleteDatasetRequest < 3) {
  }
  buildCounterUndeleteDatasetRequest--;
  return o;
}

checkUndeleteDatasetRequest(api.UndeleteDatasetRequest o) {
  buildCounterUndeleteDatasetRequest++;
  if (buildCounterUndeleteDatasetRequest < 3) {
  }
  buildCounterUndeleteDatasetRequest--;
}

buildUnnamed2573() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2573(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2574() {
  var o = new core.List<api.VariantCall>();
  o.add(buildVariantCall());
  o.add(buildVariantCall());
  return o;
}

checkUnnamed2574(core.List<api.VariantCall> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkVariantCall(o[0]);
  checkVariantCall(o[1]);
}

buildUnnamed2575() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2575(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2576() {
  var o = new core.List<core.Object>();
  o.add({'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'});
  o.add({'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'});
  return o;
}

checkUnnamed2576(core.List<core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted21 = (o[0]) as core.Map; unittest.expect(casted21, unittest.hasLength(3)); unittest.expect(casted21["list"], unittest.equals([1, 2, 3])); unittest.expect(casted21["bool"], unittest.equals(true)); unittest.expect(casted21["string"], unittest.equals('foo')); 
  var casted22 = (o[1]) as core.Map; unittest.expect(casted22, unittest.hasLength(3)); unittest.expect(casted22["list"], unittest.equals([1, 2, 3])); unittest.expect(casted22["bool"], unittest.equals(true)); unittest.expect(casted22["string"], unittest.equals('foo')); 
}

buildUnnamed2577() {
  var o = new core.Map<core.String, core.List<core.Object>>();
  o["x"] = buildUnnamed2576();
  o["y"] = buildUnnamed2576();
  return o;
}

checkUnnamed2577(core.Map<core.String, core.List<core.Object>> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUnnamed2576(o["x"]);
  checkUnnamed2576(o["y"]);
}

buildUnnamed2578() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2578(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterVariant = 0;
buildVariant() {
  var o = new api.Variant();
  buildCounterVariant++;
  if (buildCounterVariant < 3) {
    o.alternateBases = buildUnnamed2573();
    o.calls = buildUnnamed2574();
    o.created = "foo";
    o.end = "foo";
    o.filter = buildUnnamed2575();
    o.id = "foo";
    o.info = buildUnnamed2577();
    o.names = buildUnnamed2578();
    o.quality = 42.0;
    o.referenceBases = "foo";
    o.referenceName = "foo";
    o.start = "foo";
    o.variantSetId = "foo";
  }
  buildCounterVariant--;
  return o;
}

checkVariant(api.Variant o) {
  buildCounterVariant++;
  if (buildCounterVariant < 3) {
    checkUnnamed2573(o.alternateBases);
    checkUnnamed2574(o.calls);
    unittest.expect(o.created, unittest.equals('foo'));
    unittest.expect(o.end, unittest.equals('foo'));
    checkUnnamed2575(o.filter);
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2577(o.info);
    checkUnnamed2578(o.names);
    unittest.expect(o.quality, unittest.equals(42.0));
    unittest.expect(o.referenceBases, unittest.equals('foo'));
    unittest.expect(o.referenceName, unittest.equals('foo'));
    unittest.expect(o.start, unittest.equals('foo'));
    unittest.expect(o.variantSetId, unittest.equals('foo'));
  }
  buildCounterVariant--;
}

buildUnnamed2579() {
  var o = new core.List<api.ClinicalCondition>();
  o.add(buildClinicalCondition());
  o.add(buildClinicalCondition());
  return o;
}

checkUnnamed2579(core.List<api.ClinicalCondition> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkClinicalCondition(o[0]);
  checkClinicalCondition(o[1]);
}

buildUnnamed2580() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2580(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterVariantAnnotation = 0;
buildVariantAnnotation() {
  var o = new api.VariantAnnotation();
  buildCounterVariantAnnotation++;
  if (buildCounterVariantAnnotation < 3) {
    o.alternateBases = "foo";
    o.clinicalSignificance = "foo";
    o.conditions = buildUnnamed2579();
    o.effect = "foo";
    o.geneId = "foo";
    o.transcriptIds = buildUnnamed2580();
    o.type = "foo";
  }
  buildCounterVariantAnnotation--;
  return o;
}

checkVariantAnnotation(api.VariantAnnotation o) {
  buildCounterVariantAnnotation++;
  if (buildCounterVariantAnnotation < 3) {
    unittest.expect(o.alternateBases, unittest.equals('foo'));
    unittest.expect(o.clinicalSignificance, unittest.equals('foo'));
    checkUnnamed2579(o.conditions);
    unittest.expect(o.effect, unittest.equals('foo'));
    unittest.expect(o.geneId, unittest.equals('foo'));
    checkUnnamed2580(o.transcriptIds);
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterVariantAnnotation--;
}

buildUnnamed2581() {
  var o = new core.List<core.int>();
  o.add(42);
  o.add(42);
  return o;
}

checkUnnamed2581(core.List<core.int> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals(42));
  unittest.expect(o[1], unittest.equals(42));
}

buildUnnamed2582() {
  var o = new core.List<core.double>();
  o.add(42.0);
  o.add(42.0);
  return o;
}

checkUnnamed2582(core.List<core.double> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals(42.0));
  unittest.expect(o[1], unittest.equals(42.0));
}

buildUnnamed2583() {
  var o = new core.List<core.Object>();
  o.add({'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'});
  o.add({'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'});
  return o;
}

checkUnnamed2583(core.List<core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted23 = (o[0]) as core.Map; unittest.expect(casted23, unittest.hasLength(3)); unittest.expect(casted23["list"], unittest.equals([1, 2, 3])); unittest.expect(casted23["bool"], unittest.equals(true)); unittest.expect(casted23["string"], unittest.equals('foo')); 
  var casted24 = (o[1]) as core.Map; unittest.expect(casted24, unittest.hasLength(3)); unittest.expect(casted24["list"], unittest.equals([1, 2, 3])); unittest.expect(casted24["bool"], unittest.equals(true)); unittest.expect(casted24["string"], unittest.equals('foo')); 
}

buildUnnamed2584() {
  var o = new core.Map<core.String, core.List<core.Object>>();
  o["x"] = buildUnnamed2583();
  o["y"] = buildUnnamed2583();
  return o;
}

checkUnnamed2584(core.Map<core.String, core.List<core.Object>> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUnnamed2583(o["x"]);
  checkUnnamed2583(o["y"]);
}

core.int buildCounterVariantCall = 0;
buildVariantCall() {
  var o = new api.VariantCall();
  buildCounterVariantCall++;
  if (buildCounterVariantCall < 3) {
    o.callSetId = "foo";
    o.callSetName = "foo";
    o.genotype = buildUnnamed2581();
    o.genotypeLikelihood = buildUnnamed2582();
    o.info = buildUnnamed2584();
    o.phaseset = "foo";
  }
  buildCounterVariantCall--;
  return o;
}

checkVariantCall(api.VariantCall o) {
  buildCounterVariantCall++;
  if (buildCounterVariantCall < 3) {
    unittest.expect(o.callSetId, unittest.equals('foo'));
    unittest.expect(o.callSetName, unittest.equals('foo'));
    checkUnnamed2581(o.genotype);
    checkUnnamed2582(o.genotypeLikelihood);
    checkUnnamed2584(o.info);
    unittest.expect(o.phaseset, unittest.equals('foo'));
  }
  buildCounterVariantCall--;
}

buildUnnamed2585() {
  var o = new core.List<api.VariantSetMetadata>();
  o.add(buildVariantSetMetadata());
  o.add(buildVariantSetMetadata());
  return o;
}

checkUnnamed2585(core.List<api.VariantSetMetadata> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkVariantSetMetadata(o[0]);
  checkVariantSetMetadata(o[1]);
}

buildUnnamed2586() {
  var o = new core.List<api.ReferenceBound>();
  o.add(buildReferenceBound());
  o.add(buildReferenceBound());
  return o;
}

checkUnnamed2586(core.List<api.ReferenceBound> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkReferenceBound(o[0]);
  checkReferenceBound(o[1]);
}

core.int buildCounterVariantSet = 0;
buildVariantSet() {
  var o = new api.VariantSet();
  buildCounterVariantSet++;
  if (buildCounterVariantSet < 3) {
    o.datasetId = "foo";
    o.description = "foo";
    o.id = "foo";
    o.metadata = buildUnnamed2585();
    o.name = "foo";
    o.referenceBounds = buildUnnamed2586();
    o.referenceSetId = "foo";
  }
  buildCounterVariantSet--;
  return o;
}

checkVariantSet(api.VariantSet o) {
  buildCounterVariantSet++;
  if (buildCounterVariantSet < 3) {
    unittest.expect(o.datasetId, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2585(o.metadata);
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed2586(o.referenceBounds);
    unittest.expect(o.referenceSetId, unittest.equals('foo'));
  }
  buildCounterVariantSet--;
}

buildUnnamed2587() {
  var o = new core.List<core.Object>();
  o.add({'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'});
  o.add({'list' : [1, 2, 3], 'bool' : true, 'string' : 'foo'});
  return o;
}

checkUnnamed2587(core.List<core.Object> o) {
  unittest.expect(o, unittest.hasLength(2));
  var casted25 = (o[0]) as core.Map; unittest.expect(casted25, unittest.hasLength(3)); unittest.expect(casted25["list"], unittest.equals([1, 2, 3])); unittest.expect(casted25["bool"], unittest.equals(true)); unittest.expect(casted25["string"], unittest.equals('foo')); 
  var casted26 = (o[1]) as core.Map; unittest.expect(casted26, unittest.hasLength(3)); unittest.expect(casted26["list"], unittest.equals([1, 2, 3])); unittest.expect(casted26["bool"], unittest.equals(true)); unittest.expect(casted26["string"], unittest.equals('foo')); 
}

buildUnnamed2588() {
  var o = new core.Map<core.String, core.List<core.Object>>();
  o["x"] = buildUnnamed2587();
  o["y"] = buildUnnamed2587();
  return o;
}

checkUnnamed2588(core.Map<core.String, core.List<core.Object>> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUnnamed2587(o["x"]);
  checkUnnamed2587(o["y"]);
}

core.int buildCounterVariantSetMetadata = 0;
buildVariantSetMetadata() {
  var o = new api.VariantSetMetadata();
  buildCounterVariantSetMetadata++;
  if (buildCounterVariantSetMetadata < 3) {
    o.description = "foo";
    o.id = "foo";
    o.info = buildUnnamed2588();
    o.key = "foo";
    o.number = "foo";
    o.type = "foo";
    o.value = "foo";
  }
  buildCounterVariantSetMetadata--;
  return o;
}

checkVariantSetMetadata(api.VariantSetMetadata o) {
  buildCounterVariantSetMetadata++;
  if (buildCounterVariantSetMetadata < 3) {
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2588(o.info);
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.number, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterVariantSetMetadata--;
}


main() {
  unittest.group("obj-schema-Annotation", () {
    unittest.test("to-json--from-json", () {
      var o = buildAnnotation();
      var od = new api.Annotation.fromJson(o.toJson());
      checkAnnotation(od);
    });
  });


  unittest.group("obj-schema-AnnotationSet", () {
    unittest.test("to-json--from-json", () {
      var o = buildAnnotationSet();
      var od = new api.AnnotationSet.fromJson(o.toJson());
      checkAnnotationSet(od);
    });
  });


  unittest.group("obj-schema-BatchCreateAnnotationsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildBatchCreateAnnotationsRequest();
      var od = new api.BatchCreateAnnotationsRequest.fromJson(o.toJson());
      checkBatchCreateAnnotationsRequest(od);
    });
  });


  unittest.group("obj-schema-BatchCreateAnnotationsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildBatchCreateAnnotationsResponse();
      var od = new api.BatchCreateAnnotationsResponse.fromJson(o.toJson());
      checkBatchCreateAnnotationsResponse(od);
    });
  });


  unittest.group("obj-schema-Binding", () {
    unittest.test("to-json--from-json", () {
      var o = buildBinding();
      var od = new api.Binding.fromJson(o.toJson());
      checkBinding(od);
    });
  });


  unittest.group("obj-schema-CallSet", () {
    unittest.test("to-json--from-json", () {
      var o = buildCallSet();
      var od = new api.CallSet.fromJson(o.toJson());
      checkCallSet(od);
    });
  });


  unittest.group("obj-schema-CancelOperationRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildCancelOperationRequest();
      var od = new api.CancelOperationRequest.fromJson(o.toJson());
      checkCancelOperationRequest(od);
    });
  });


  unittest.group("obj-schema-CigarUnit", () {
    unittest.test("to-json--from-json", () {
      var o = buildCigarUnit();
      var od = new api.CigarUnit.fromJson(o.toJson());
      checkCigarUnit(od);
    });
  });


  unittest.group("obj-schema-ClinicalCondition", () {
    unittest.test("to-json--from-json", () {
      var o = buildClinicalCondition();
      var od = new api.ClinicalCondition.fromJson(o.toJson());
      checkClinicalCondition(od);
    });
  });


  unittest.group("obj-schema-CodingSequence", () {
    unittest.test("to-json--from-json", () {
      var o = buildCodingSequence();
      var od = new api.CodingSequence.fromJson(o.toJson());
      checkCodingSequence(od);
    });
  });


  unittest.group("obj-schema-CoverageBucket", () {
    unittest.test("to-json--from-json", () {
      var o = buildCoverageBucket();
      var od = new api.CoverageBucket.fromJson(o.toJson());
      checkCoverageBucket(od);
    });
  });


  unittest.group("obj-schema-Dataset", () {
    unittest.test("to-json--from-json", () {
      var o = buildDataset();
      var od = new api.Dataset.fromJson(o.toJson());
      checkDataset(od);
    });
  });


  unittest.group("obj-schema-Empty", () {
    unittest.test("to-json--from-json", () {
      var o = buildEmpty();
      var od = new api.Empty.fromJson(o.toJson());
      checkEmpty(od);
    });
  });


  unittest.group("obj-schema-Entry", () {
    unittest.test("to-json--from-json", () {
      var o = buildEntry();
      var od = new api.Entry.fromJson(o.toJson());
      checkEntry(od);
    });
  });


  unittest.group("obj-schema-Exon", () {
    unittest.test("to-json--from-json", () {
      var o = buildExon();
      var od = new api.Exon.fromJson(o.toJson());
      checkExon(od);
    });
  });


  unittest.group("obj-schema-Experiment", () {
    unittest.test("to-json--from-json", () {
      var o = buildExperiment();
      var od = new api.Experiment.fromJson(o.toJson());
      checkExperiment(od);
    });
  });


  unittest.group("obj-schema-ExportReadGroupSetRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildExportReadGroupSetRequest();
      var od = new api.ExportReadGroupSetRequest.fromJson(o.toJson());
      checkExportReadGroupSetRequest(od);
    });
  });


  unittest.group("obj-schema-ExportVariantSetRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildExportVariantSetRequest();
      var od = new api.ExportVariantSetRequest.fromJson(o.toJson());
      checkExportVariantSetRequest(od);
    });
  });


  unittest.group("obj-schema-ExternalId", () {
    unittest.test("to-json--from-json", () {
      var o = buildExternalId();
      var od = new api.ExternalId.fromJson(o.toJson());
      checkExternalId(od);
    });
  });


  unittest.group("obj-schema-GetIamPolicyRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildGetIamPolicyRequest();
      var od = new api.GetIamPolicyRequest.fromJson(o.toJson());
      checkGetIamPolicyRequest(od);
    });
  });


  unittest.group("obj-schema-ImportReadGroupSetsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildImportReadGroupSetsRequest();
      var od = new api.ImportReadGroupSetsRequest.fromJson(o.toJson());
      checkImportReadGroupSetsRequest(od);
    });
  });


  unittest.group("obj-schema-ImportReadGroupSetsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildImportReadGroupSetsResponse();
      var od = new api.ImportReadGroupSetsResponse.fromJson(o.toJson());
      checkImportReadGroupSetsResponse(od);
    });
  });


  unittest.group("obj-schema-ImportVariantsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildImportVariantsRequest();
      var od = new api.ImportVariantsRequest.fromJson(o.toJson());
      checkImportVariantsRequest(od);
    });
  });


  unittest.group("obj-schema-ImportVariantsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildImportVariantsResponse();
      var od = new api.ImportVariantsResponse.fromJson(o.toJson());
      checkImportVariantsResponse(od);
    });
  });


  unittest.group("obj-schema-LinearAlignment", () {
    unittest.test("to-json--from-json", () {
      var o = buildLinearAlignment();
      var od = new api.LinearAlignment.fromJson(o.toJson());
      checkLinearAlignment(od);
    });
  });


  unittest.group("obj-schema-ListBasesResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListBasesResponse();
      var od = new api.ListBasesResponse.fromJson(o.toJson());
      checkListBasesResponse(od);
    });
  });


  unittest.group("obj-schema-ListCoverageBucketsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListCoverageBucketsResponse();
      var od = new api.ListCoverageBucketsResponse.fromJson(o.toJson());
      checkListCoverageBucketsResponse(od);
    });
  });


  unittest.group("obj-schema-ListDatasetsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListDatasetsResponse();
      var od = new api.ListDatasetsResponse.fromJson(o.toJson());
      checkListDatasetsResponse(od);
    });
  });


  unittest.group("obj-schema-ListOperationsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildListOperationsResponse();
      var od = new api.ListOperationsResponse.fromJson(o.toJson());
      checkListOperationsResponse(od);
    });
  });


  unittest.group("obj-schema-MergeVariantsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildMergeVariantsRequest();
      var od = new api.MergeVariantsRequest.fromJson(o.toJson());
      checkMergeVariantsRequest(od);
    });
  });


  unittest.group("obj-schema-Operation", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperation();
      var od = new api.Operation.fromJson(o.toJson());
      checkOperation(od);
    });
  });


  unittest.group("obj-schema-OperationEvent", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperationEvent();
      var od = new api.OperationEvent.fromJson(o.toJson());
      checkOperationEvent(od);
    });
  });


  unittest.group("obj-schema-OperationMetadata", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperationMetadata();
      var od = new api.OperationMetadata.fromJson(o.toJson());
      checkOperationMetadata(od);
    });
  });


  unittest.group("obj-schema-Policy", () {
    unittest.test("to-json--from-json", () {
      var o = buildPolicy();
      var od = new api.Policy.fromJson(o.toJson());
      checkPolicy(od);
    });
  });


  unittest.group("obj-schema-Position", () {
    unittest.test("to-json--from-json", () {
      var o = buildPosition();
      var od = new api.Position.fromJson(o.toJson());
      checkPosition(od);
    });
  });


  unittest.group("obj-schema-Program", () {
    unittest.test("to-json--from-json", () {
      var o = buildProgram();
      var od = new api.Program.fromJson(o.toJson());
      checkProgram(od);
    });
  });


  unittest.group("obj-schema-Range", () {
    unittest.test("to-json--from-json", () {
      var o = buildRange();
      var od = new api.Range.fromJson(o.toJson());
      checkRange(od);
    });
  });


  unittest.group("obj-schema-Read", () {
    unittest.test("to-json--from-json", () {
      var o = buildRead();
      var od = new api.Read.fromJson(o.toJson());
      checkRead(od);
    });
  });


  unittest.group("obj-schema-ReadGroup", () {
    unittest.test("to-json--from-json", () {
      var o = buildReadGroup();
      var od = new api.ReadGroup.fromJson(o.toJson());
      checkReadGroup(od);
    });
  });


  unittest.group("obj-schema-ReadGroupSet", () {
    unittest.test("to-json--from-json", () {
      var o = buildReadGroupSet();
      var od = new api.ReadGroupSet.fromJson(o.toJson());
      checkReadGroupSet(od);
    });
  });


  unittest.group("obj-schema-Reference", () {
    unittest.test("to-json--from-json", () {
      var o = buildReference();
      var od = new api.Reference.fromJson(o.toJson());
      checkReference(od);
    });
  });


  unittest.group("obj-schema-ReferenceBound", () {
    unittest.test("to-json--from-json", () {
      var o = buildReferenceBound();
      var od = new api.ReferenceBound.fromJson(o.toJson());
      checkReferenceBound(od);
    });
  });


  unittest.group("obj-schema-ReferenceSet", () {
    unittest.test("to-json--from-json", () {
      var o = buildReferenceSet();
      var od = new api.ReferenceSet.fromJson(o.toJson());
      checkReferenceSet(od);
    });
  });


  unittest.group("obj-schema-SearchAnnotationSetsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchAnnotationSetsRequest();
      var od = new api.SearchAnnotationSetsRequest.fromJson(o.toJson());
      checkSearchAnnotationSetsRequest(od);
    });
  });


  unittest.group("obj-schema-SearchAnnotationSetsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchAnnotationSetsResponse();
      var od = new api.SearchAnnotationSetsResponse.fromJson(o.toJson());
      checkSearchAnnotationSetsResponse(od);
    });
  });


  unittest.group("obj-schema-SearchAnnotationsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchAnnotationsRequest();
      var od = new api.SearchAnnotationsRequest.fromJson(o.toJson());
      checkSearchAnnotationsRequest(od);
    });
  });


  unittest.group("obj-schema-SearchAnnotationsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchAnnotationsResponse();
      var od = new api.SearchAnnotationsResponse.fromJson(o.toJson());
      checkSearchAnnotationsResponse(od);
    });
  });


  unittest.group("obj-schema-SearchCallSetsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchCallSetsRequest();
      var od = new api.SearchCallSetsRequest.fromJson(o.toJson());
      checkSearchCallSetsRequest(od);
    });
  });


  unittest.group("obj-schema-SearchCallSetsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchCallSetsResponse();
      var od = new api.SearchCallSetsResponse.fromJson(o.toJson());
      checkSearchCallSetsResponse(od);
    });
  });


  unittest.group("obj-schema-SearchReadGroupSetsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchReadGroupSetsRequest();
      var od = new api.SearchReadGroupSetsRequest.fromJson(o.toJson());
      checkSearchReadGroupSetsRequest(od);
    });
  });


  unittest.group("obj-schema-SearchReadGroupSetsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchReadGroupSetsResponse();
      var od = new api.SearchReadGroupSetsResponse.fromJson(o.toJson());
      checkSearchReadGroupSetsResponse(od);
    });
  });


  unittest.group("obj-schema-SearchReadsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchReadsRequest();
      var od = new api.SearchReadsRequest.fromJson(o.toJson());
      checkSearchReadsRequest(od);
    });
  });


  unittest.group("obj-schema-SearchReadsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchReadsResponse();
      var od = new api.SearchReadsResponse.fromJson(o.toJson());
      checkSearchReadsResponse(od);
    });
  });


  unittest.group("obj-schema-SearchReferenceSetsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchReferenceSetsRequest();
      var od = new api.SearchReferenceSetsRequest.fromJson(o.toJson());
      checkSearchReferenceSetsRequest(od);
    });
  });


  unittest.group("obj-schema-SearchReferenceSetsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchReferenceSetsResponse();
      var od = new api.SearchReferenceSetsResponse.fromJson(o.toJson());
      checkSearchReferenceSetsResponse(od);
    });
  });


  unittest.group("obj-schema-SearchReferencesRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchReferencesRequest();
      var od = new api.SearchReferencesRequest.fromJson(o.toJson());
      checkSearchReferencesRequest(od);
    });
  });


  unittest.group("obj-schema-SearchReferencesResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchReferencesResponse();
      var od = new api.SearchReferencesResponse.fromJson(o.toJson());
      checkSearchReferencesResponse(od);
    });
  });


  unittest.group("obj-schema-SearchVariantSetsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchVariantSetsRequest();
      var od = new api.SearchVariantSetsRequest.fromJson(o.toJson());
      checkSearchVariantSetsRequest(od);
    });
  });


  unittest.group("obj-schema-SearchVariantSetsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchVariantSetsResponse();
      var od = new api.SearchVariantSetsResponse.fromJson(o.toJson());
      checkSearchVariantSetsResponse(od);
    });
  });


  unittest.group("obj-schema-SearchVariantsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchVariantsRequest();
      var od = new api.SearchVariantsRequest.fromJson(o.toJson());
      checkSearchVariantsRequest(od);
    });
  });


  unittest.group("obj-schema-SearchVariantsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildSearchVariantsResponse();
      var od = new api.SearchVariantsResponse.fromJson(o.toJson());
      checkSearchVariantsResponse(od);
    });
  });


  unittest.group("obj-schema-SetIamPolicyRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildSetIamPolicyRequest();
      var od = new api.SetIamPolicyRequest.fromJson(o.toJson());
      checkSetIamPolicyRequest(od);
    });
  });


  unittest.group("obj-schema-Status", () {
    unittest.test("to-json--from-json", () {
      var o = buildStatus();
      var od = new api.Status.fromJson(o.toJson());
      checkStatus(od);
    });
  });


  unittest.group("obj-schema-StreamReadsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildStreamReadsRequest();
      var od = new api.StreamReadsRequest.fromJson(o.toJson());
      checkStreamReadsRequest(od);
    });
  });


  unittest.group("obj-schema-StreamReadsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildStreamReadsResponse();
      var od = new api.StreamReadsResponse.fromJson(o.toJson());
      checkStreamReadsResponse(od);
    });
  });


  unittest.group("obj-schema-StreamVariantsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildStreamVariantsRequest();
      var od = new api.StreamVariantsRequest.fromJson(o.toJson());
      checkStreamVariantsRequest(od);
    });
  });


  unittest.group("obj-schema-StreamVariantsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildStreamVariantsResponse();
      var od = new api.StreamVariantsResponse.fromJson(o.toJson());
      checkStreamVariantsResponse(od);
    });
  });


  unittest.group("obj-schema-TestIamPermissionsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildTestIamPermissionsRequest();
      var od = new api.TestIamPermissionsRequest.fromJson(o.toJson());
      checkTestIamPermissionsRequest(od);
    });
  });


  unittest.group("obj-schema-TestIamPermissionsResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildTestIamPermissionsResponse();
      var od = new api.TestIamPermissionsResponse.fromJson(o.toJson());
      checkTestIamPermissionsResponse(od);
    });
  });


  unittest.group("obj-schema-Transcript", () {
    unittest.test("to-json--from-json", () {
      var o = buildTranscript();
      var od = new api.Transcript.fromJson(o.toJson());
      checkTranscript(od);
    });
  });


  unittest.group("obj-schema-UndeleteDatasetRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildUndeleteDatasetRequest();
      var od = new api.UndeleteDatasetRequest.fromJson(o.toJson());
      checkUndeleteDatasetRequest(od);
    });
  });


  unittest.group("obj-schema-Variant", () {
    unittest.test("to-json--from-json", () {
      var o = buildVariant();
      var od = new api.Variant.fromJson(o.toJson());
      checkVariant(od);
    });
  });


  unittest.group("obj-schema-VariantAnnotation", () {
    unittest.test("to-json--from-json", () {
      var o = buildVariantAnnotation();
      var od = new api.VariantAnnotation.fromJson(o.toJson());
      checkVariantAnnotation(od);
    });
  });


  unittest.group("obj-schema-VariantCall", () {
    unittest.test("to-json--from-json", () {
      var o = buildVariantCall();
      var od = new api.VariantCall.fromJson(o.toJson());
      checkVariantCall(od);
    });
  });


  unittest.group("obj-schema-VariantSet", () {
    unittest.test("to-json--from-json", () {
      var o = buildVariantSet();
      var od = new api.VariantSet.fromJson(o.toJson());
      checkVariantSet(od);
    });
  });


  unittest.group("obj-schema-VariantSetMetadata", () {
    unittest.test("to-json--from-json", () {
      var o = buildVariantSetMetadata();
      var od = new api.VariantSetMetadata.fromJson(o.toJson());
      checkVariantSetMetadata(od);
    });
  });


  unittest.group("resource-AnnotationsResourceApi", () {
    unittest.test("method--batchCreate", () {

      var mock = new HttpServerMock();
      api.AnnotationsResourceApi res = new api.GenomicsApi(mock).annotations;
      var arg_request = buildBatchCreateAnnotationsRequest();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.BatchCreateAnnotationsRequest.fromJson(json);
        checkBatchCreateAnnotationsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 26), unittest.equals("v1/annotations:batchCreate"));
        pathOffset += 26;

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
        var resp = convert.JSON.encode(buildBatchCreateAnnotationsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.batchCreate(arg_request).then(unittest.expectAsync(((api.BatchCreateAnnotationsResponse response) {
        checkBatchCreateAnnotationsResponse(response);
      })));
    });

    unittest.test("method--create", () {

      var mock = new HttpServerMock();
      api.AnnotationsResourceApi res = new api.GenomicsApi(mock).annotations;
      var arg_request = buildAnnotation();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Annotation.fromJson(json);
        checkAnnotation(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("v1/annotations"));
        pathOffset += 14;

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
        var resp = convert.JSON.encode(buildAnnotation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.create(arg_request).then(unittest.expectAsync(((api.Annotation response) {
        checkAnnotation(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.AnnotationsResourceApi res = new api.GenomicsApi(mock).annotations;
      var arg_annotationId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("v1/annotations/"));
        pathOffset += 15;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_annotationId"));

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
        var resp = convert.JSON.encode(buildEmpty());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_annotationId).then(unittest.expectAsync(((api.Empty response) {
        checkEmpty(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AnnotationsResourceApi res = new api.GenomicsApi(mock).annotations;
      var arg_annotationId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("v1/annotations/"));
        pathOffset += 15;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_annotationId"));

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
        var resp = convert.JSON.encode(buildAnnotation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_annotationId).then(unittest.expectAsync(((api.Annotation response) {
        checkAnnotation(response);
      })));
    });

    unittest.test("method--search", () {

      var mock = new HttpServerMock();
      api.AnnotationsResourceApi res = new api.GenomicsApi(mock).annotations;
      var arg_request = buildSearchAnnotationsRequest();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.SearchAnnotationsRequest.fromJson(json);
        checkSearchAnnotationsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 21), unittest.equals("v1/annotations/search"));
        pathOffset += 21;

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
        var resp = convert.JSON.encode(buildSearchAnnotationsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.search(arg_request).then(unittest.expectAsync(((api.SearchAnnotationsResponse response) {
        checkSearchAnnotationsResponse(response);
      })));
    });

    unittest.test("method--update", () {

      var mock = new HttpServerMock();
      api.AnnotationsResourceApi res = new api.GenomicsApi(mock).annotations;
      var arg_request = buildAnnotation();
      var arg_annotationId = "foo";
      var arg_updateMask = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Annotation.fromJson(json);
        checkAnnotation(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("v1/annotations/"));
        pathOffset += 15;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_annotationId"));

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
        unittest.expect(queryMap["updateMask"].first, unittest.equals(arg_updateMask));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAnnotation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.update(arg_request, arg_annotationId, updateMask: arg_updateMask).then(unittest.expectAsync(((api.Annotation response) {
        checkAnnotation(response);
      })));
    });

  });


  unittest.group("resource-AnnotationsetsResourceApi", () {
    unittest.test("method--create", () {

      var mock = new HttpServerMock();
      api.AnnotationsetsResourceApi res = new api.GenomicsApi(mock).annotationsets;
      var arg_request = buildAnnotationSet();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.AnnotationSet.fromJson(json);
        checkAnnotationSet(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("v1/annotationsets"));
        pathOffset += 17;

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
        var resp = convert.JSON.encode(buildAnnotationSet());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.create(arg_request).then(unittest.expectAsync(((api.AnnotationSet response) {
        checkAnnotationSet(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.AnnotationsetsResourceApi res = new api.GenomicsApi(mock).annotationsets;
      var arg_annotationSetId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18), unittest.equals("v1/annotationsets/"));
        pathOffset += 18;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_annotationSetId"));

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
        var resp = convert.JSON.encode(buildEmpty());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_annotationSetId).then(unittest.expectAsync(((api.Empty response) {
        checkEmpty(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AnnotationsetsResourceApi res = new api.GenomicsApi(mock).annotationsets;
      var arg_annotationSetId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18), unittest.equals("v1/annotationsets/"));
        pathOffset += 18;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_annotationSetId"));

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
        var resp = convert.JSON.encode(buildAnnotationSet());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_annotationSetId).then(unittest.expectAsync(((api.AnnotationSet response) {
        checkAnnotationSet(response);
      })));
    });

    unittest.test("method--search", () {

      var mock = new HttpServerMock();
      api.AnnotationsetsResourceApi res = new api.GenomicsApi(mock).annotationsets;
      var arg_request = buildSearchAnnotationSetsRequest();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.SearchAnnotationSetsRequest.fromJson(json);
        checkSearchAnnotationSetsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 24), unittest.equals("v1/annotationsets/search"));
        pathOffset += 24;

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
        var resp = convert.JSON.encode(buildSearchAnnotationSetsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.search(arg_request).then(unittest.expectAsync(((api.SearchAnnotationSetsResponse response) {
        checkSearchAnnotationSetsResponse(response);
      })));
    });

    unittest.test("method--update", () {

      var mock = new HttpServerMock();
      api.AnnotationsetsResourceApi res = new api.GenomicsApi(mock).annotationsets;
      var arg_request = buildAnnotationSet();
      var arg_annotationSetId = "foo";
      var arg_updateMask = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.AnnotationSet.fromJson(json);
        checkAnnotationSet(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18), unittest.equals("v1/annotationsets/"));
        pathOffset += 18;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_annotationSetId"));

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
        unittest.expect(queryMap["updateMask"].first, unittest.equals(arg_updateMask));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAnnotationSet());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.update(arg_request, arg_annotationSetId, updateMask: arg_updateMask).then(unittest.expectAsync(((api.AnnotationSet response) {
        checkAnnotationSet(response);
      })));
    });

  });


  unittest.group("resource-CallsetsResourceApi", () {
    unittest.test("method--create", () {

      var mock = new HttpServerMock();
      api.CallsetsResourceApi res = new api.GenomicsApi(mock).callsets;
      var arg_request = buildCallSet();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.CallSet.fromJson(json);
        checkCallSet(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("v1/callsets"));
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
        var resp = convert.JSON.encode(buildCallSet());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.create(arg_request).then(unittest.expectAsync(((api.CallSet response) {
        checkCallSet(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.CallsetsResourceApi res = new api.GenomicsApi(mock).callsets;
      var arg_callSetId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("v1/callsets/"));
        pathOffset += 12;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_callSetId"));

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
        var resp = convert.JSON.encode(buildEmpty());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_callSetId).then(unittest.expectAsync(((api.Empty response) {
        checkEmpty(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.CallsetsResourceApi res = new api.GenomicsApi(mock).callsets;
      var arg_callSetId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("v1/callsets/"));
        pathOffset += 12;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_callSetId"));

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
        var resp = convert.JSON.encode(buildCallSet());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_callSetId).then(unittest.expectAsync(((api.CallSet response) {
        checkCallSet(response);
      })));
    });

    unittest.test("method--patch", () {

      var mock = new HttpServerMock();
      api.CallsetsResourceApi res = new api.GenomicsApi(mock).callsets;
      var arg_request = buildCallSet();
      var arg_callSetId = "foo";
      var arg_updateMask = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.CallSet.fromJson(json);
        checkCallSet(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("v1/callsets/"));
        pathOffset += 12;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_callSetId"));

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
        unittest.expect(queryMap["updateMask"].first, unittest.equals(arg_updateMask));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildCallSet());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.patch(arg_request, arg_callSetId, updateMask: arg_updateMask).then(unittest.expectAsync(((api.CallSet response) {
        checkCallSet(response);
      })));
    });

    unittest.test("method--search", () {

      var mock = new HttpServerMock();
      api.CallsetsResourceApi res = new api.GenomicsApi(mock).callsets;
      var arg_request = buildSearchCallSetsRequest();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.SearchCallSetsRequest.fromJson(json);
        checkSearchCallSetsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18), unittest.equals("v1/callsets/search"));
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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildSearchCallSetsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.search(arg_request).then(unittest.expectAsync(((api.SearchCallSetsResponse response) {
        checkSearchCallSetsResponse(response);
      })));
    });

  });


  unittest.group("resource-DatasetsResourceApi", () {
    unittest.test("method--create", () {

      var mock = new HttpServerMock();
      api.DatasetsResourceApi res = new api.GenomicsApi(mock).datasets;
      var arg_request = buildDataset();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Dataset.fromJson(json);
        checkDataset(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("v1/datasets"));
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
        var resp = convert.JSON.encode(buildDataset());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.create(arg_request).then(unittest.expectAsync(((api.Dataset response) {
        checkDataset(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.DatasetsResourceApi res = new api.GenomicsApi(mock).datasets;
      var arg_datasetId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("v1/datasets/"));
        pathOffset += 12;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_datasetId"));

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
        var resp = convert.JSON.encode(buildEmpty());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_datasetId).then(unittest.expectAsync(((api.Empty response) {
        checkEmpty(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.DatasetsResourceApi res = new api.GenomicsApi(mock).datasets;
      var arg_datasetId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("v1/datasets/"));
        pathOffset += 12;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_datasetId"));

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
        var resp = convert.JSON.encode(buildDataset());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_datasetId).then(unittest.expectAsync(((api.Dataset response) {
        checkDataset(response);
      })));
    });

    unittest.test("method--getIamPolicy", () {

      var mock = new HttpServerMock();
      api.DatasetsResourceApi res = new api.GenomicsApi(mock).datasets;
      var arg_request = buildGetIamPolicyRequest();
      var arg_resource = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.GetIamPolicyRequest.fromJson(json);
        checkGetIamPolicyRequest(obj);

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildPolicy());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.getIamPolicy(arg_request, arg_resource).then(unittest.expectAsync(((api.Policy response) {
        checkPolicy(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.DatasetsResourceApi res = new api.GenomicsApi(mock).datasets;
      var arg_projectId = "foo";
      var arg_pageSize = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("v1/datasets"));
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
        unittest.expect(queryMap["projectId"].first, unittest.equals(arg_projectId));
        unittest.expect(core.int.parse(queryMap["pageSize"].first), unittest.equals(arg_pageSize));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListDatasetsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(projectId: arg_projectId, pageSize: arg_pageSize, pageToken: arg_pageToken).then(unittest.expectAsync(((api.ListDatasetsResponse response) {
        checkListDatasetsResponse(response);
      })));
    });

    unittest.test("method--patch", () {

      var mock = new HttpServerMock();
      api.DatasetsResourceApi res = new api.GenomicsApi(mock).datasets;
      var arg_request = buildDataset();
      var arg_datasetId = "foo";
      var arg_updateMask = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Dataset.fromJson(json);
        checkDataset(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("v1/datasets/"));
        pathOffset += 12;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_datasetId"));

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
        unittest.expect(queryMap["updateMask"].first, unittest.equals(arg_updateMask));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildDataset());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.patch(arg_request, arg_datasetId, updateMask: arg_updateMask).then(unittest.expectAsync(((api.Dataset response) {
        checkDataset(response);
      })));
    });

    unittest.test("method--setIamPolicy", () {

      var mock = new HttpServerMock();
      api.DatasetsResourceApi res = new api.GenomicsApi(mock).datasets;
      var arg_request = buildSetIamPolicyRequest();
      var arg_resource = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.SetIamPolicyRequest.fromJson(json);
        checkSetIamPolicyRequest(obj);

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildPolicy());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.setIamPolicy(arg_request, arg_resource).then(unittest.expectAsync(((api.Policy response) {
        checkPolicy(response);
      })));
    });

    unittest.test("method--testIamPermissions", () {

      var mock = new HttpServerMock();
      api.DatasetsResourceApi res = new api.GenomicsApi(mock).datasets;
      var arg_request = buildTestIamPermissionsRequest();
      var arg_resource = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.TestIamPermissionsRequest.fromJson(json);
        checkTestIamPermissionsRequest(obj);

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTestIamPermissionsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.testIamPermissions(arg_request, arg_resource).then(unittest.expectAsync(((api.TestIamPermissionsResponse response) {
        checkTestIamPermissionsResponse(response);
      })));
    });

    unittest.test("method--undelete", () {

      var mock = new HttpServerMock();
      api.DatasetsResourceApi res = new api.GenomicsApi(mock).datasets;
      var arg_request = buildUndeleteDatasetRequest();
      var arg_datasetId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.UndeleteDatasetRequest.fromJson(json);
        checkUndeleteDatasetRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("v1/datasets/"));
        pathOffset += 12;
        index = path.indexOf(":undelete", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_datasetId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 9), unittest.equals(":undelete"));
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
        var resp = convert.JSON.encode(buildDataset());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.undelete(arg_request, arg_datasetId).then(unittest.expectAsync(((api.Dataset response) {
        checkDataset(response);
      })));
    });

  });


  unittest.group("resource-OperationsResourceApi", () {
    unittest.test("method--cancel", () {

      var mock = new HttpServerMock();
      api.OperationsResourceApi res = new api.GenomicsApi(mock).operations;
      var arg_request = buildCancelOperationRequest();
      var arg_name = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.CancelOperationRequest.fromJson(json);
        checkCancelOperationRequest(obj);

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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildEmpty());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.cancel(arg_request, arg_name).then(unittest.expectAsync(((api.Empty response) {
        checkEmpty(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.OperationsResourceApi res = new api.GenomicsApi(mock).operations;
      var arg_name = "foo";
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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_name).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.OperationsResourceApi res = new api.GenomicsApi(mock).operations;
      var arg_name = "foo";
      var arg_filter = "foo";
      var arg_pageSize = 42;
      var arg_pageToken = "foo";
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
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["pageSize"].first), unittest.equals(arg_pageSize));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListOperationsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_name, filter: arg_filter, pageSize: arg_pageSize, pageToken: arg_pageToken).then(unittest.expectAsync(((api.ListOperationsResponse response) {
        checkListOperationsResponse(response);
      })));
    });

  });


  unittest.group("resource-ReadgroupsetsResourceApi", () {
    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.ReadgroupsetsResourceApi res = new api.GenomicsApi(mock).readgroupsets;
      var arg_readGroupSetId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("v1/readgroupsets/"));
        pathOffset += 17;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_readGroupSetId"));

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
        var resp = convert.JSON.encode(buildEmpty());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_readGroupSetId).then(unittest.expectAsync(((api.Empty response) {
        checkEmpty(response);
      })));
    });

    unittest.test("method--export", () {

      var mock = new HttpServerMock();
      api.ReadgroupsetsResourceApi res = new api.GenomicsApi(mock).readgroupsets;
      var arg_request = buildExportReadGroupSetRequest();
      var arg_readGroupSetId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.ExportReadGroupSetRequest.fromJson(json);
        checkExportReadGroupSetRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("v1/readgroupsets/"));
        pathOffset += 17;
        index = path.indexOf(":export", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_readGroupSetId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7), unittest.equals(":export"));
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
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.export(arg_request, arg_readGroupSetId).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.ReadgroupsetsResourceApi res = new api.GenomicsApi(mock).readgroupsets;
      var arg_readGroupSetId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("v1/readgroupsets/"));
        pathOffset += 17;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_readGroupSetId"));

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
        var resp = convert.JSON.encode(buildReadGroupSet());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_readGroupSetId).then(unittest.expectAsync(((api.ReadGroupSet response) {
        checkReadGroupSet(response);
      })));
    });

    unittest.test("method--import", () {

      var mock = new HttpServerMock();
      api.ReadgroupsetsResourceApi res = new api.GenomicsApi(mock).readgroupsets;
      var arg_request = buildImportReadGroupSetsRequest();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.ImportReadGroupSetsRequest.fromJson(json);
        checkImportReadGroupSetsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 23), unittest.equals("v1/readgroupsets:import"));
        pathOffset += 23;

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
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.import(arg_request).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--patch", () {

      var mock = new HttpServerMock();
      api.ReadgroupsetsResourceApi res = new api.GenomicsApi(mock).readgroupsets;
      var arg_request = buildReadGroupSet();
      var arg_readGroupSetId = "foo";
      var arg_updateMask = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.ReadGroupSet.fromJson(json);
        checkReadGroupSet(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("v1/readgroupsets/"));
        pathOffset += 17;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_readGroupSetId"));

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
        unittest.expect(queryMap["updateMask"].first, unittest.equals(arg_updateMask));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildReadGroupSet());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.patch(arg_request, arg_readGroupSetId, updateMask: arg_updateMask).then(unittest.expectAsync(((api.ReadGroupSet response) {
        checkReadGroupSet(response);
      })));
    });

    unittest.test("method--search", () {

      var mock = new HttpServerMock();
      api.ReadgroupsetsResourceApi res = new api.GenomicsApi(mock).readgroupsets;
      var arg_request = buildSearchReadGroupSetsRequest();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.SearchReadGroupSetsRequest.fromJson(json);
        checkSearchReadGroupSetsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 23), unittest.equals("v1/readgroupsets/search"));
        pathOffset += 23;

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
        var resp = convert.JSON.encode(buildSearchReadGroupSetsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.search(arg_request).then(unittest.expectAsync(((api.SearchReadGroupSetsResponse response) {
        checkSearchReadGroupSetsResponse(response);
      })));
    });

  });


  unittest.group("resource-ReadgroupsetsCoveragebucketsResourceApi", () {
    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.ReadgroupsetsCoveragebucketsResourceApi res = new api.GenomicsApi(mock).readgroupsets.coveragebuckets;
      var arg_readGroupSetId = "foo";
      var arg_referenceName = "foo";
      var arg_start = "foo";
      var arg_end = "foo";
      var arg_targetBucketWidth = "foo";
      var arg_pageToken = "foo";
      var arg_pageSize = 42;
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("v1/readgroupsets/"));
        pathOffset += 17;
        index = path.indexOf("/coveragebuckets", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_readGroupSetId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 16), unittest.equals("/coveragebuckets"));
        pathOffset += 16;

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
        unittest.expect(queryMap["referenceName"].first, unittest.equals(arg_referenceName));
        unittest.expect(queryMap["start"].first, unittest.equals(arg_start));
        unittest.expect(queryMap["end"].first, unittest.equals(arg_end));
        unittest.expect(queryMap["targetBucketWidth"].first, unittest.equals(arg_targetBucketWidth));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first), unittest.equals(arg_pageSize));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListCoverageBucketsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_readGroupSetId, referenceName: arg_referenceName, start: arg_start, end: arg_end, targetBucketWidth: arg_targetBucketWidth, pageToken: arg_pageToken, pageSize: arg_pageSize).then(unittest.expectAsync(((api.ListCoverageBucketsResponse response) {
        checkListCoverageBucketsResponse(response);
      })));
    });

  });


  unittest.group("resource-ReadsResourceApi", () {
    unittest.test("method--search", () {

      var mock = new HttpServerMock();
      api.ReadsResourceApi res = new api.GenomicsApi(mock).reads;
      var arg_request = buildSearchReadsRequest();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.SearchReadsRequest.fromJson(json);
        checkSearchReadsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("v1/reads/search"));
        pathOffset += 15;

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
        var resp = convert.JSON.encode(buildSearchReadsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.search(arg_request).then(unittest.expectAsync(((api.SearchReadsResponse response) {
        checkSearchReadsResponse(response);
      })));
    });

    unittest.test("method--stream", () {

      var mock = new HttpServerMock();
      api.ReadsResourceApi res = new api.GenomicsApi(mock).reads;
      var arg_request = buildStreamReadsRequest();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.StreamReadsRequest.fromJson(json);
        checkStreamReadsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("v1/reads:stream"));
        pathOffset += 15;

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
        var resp = convert.JSON.encode(buildStreamReadsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.stream(arg_request).then(unittest.expectAsync(((api.StreamReadsResponse response) {
        checkStreamReadsResponse(response);
      })));
    });

  });


  unittest.group("resource-ReferencesResourceApi", () {
    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.ReferencesResourceApi res = new api.GenomicsApi(mock).references;
      var arg_referenceId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("v1/references/"));
        pathOffset += 14;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_referenceId"));

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
        var resp = convert.JSON.encode(buildReference());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_referenceId).then(unittest.expectAsync(((api.Reference response) {
        checkReference(response);
      })));
    });

    unittest.test("method--search", () {

      var mock = new HttpServerMock();
      api.ReferencesResourceApi res = new api.GenomicsApi(mock).references;
      var arg_request = buildSearchReferencesRequest();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.SearchReferencesRequest.fromJson(json);
        checkSearchReferencesRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 20), unittest.equals("v1/references/search"));
        pathOffset += 20;

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
        var resp = convert.JSON.encode(buildSearchReferencesResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.search(arg_request).then(unittest.expectAsync(((api.SearchReferencesResponse response) {
        checkSearchReferencesResponse(response);
      })));
    });

  });


  unittest.group("resource-ReferencesBasesResourceApi", () {
    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.ReferencesBasesResourceApi res = new api.GenomicsApi(mock).references.bases;
      var arg_referenceId = "foo";
      var arg_start = "foo";
      var arg_end = "foo";
      var arg_pageToken = "foo";
      var arg_pageSize = 42;
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("v1/references/"));
        pathOffset += 14;
        index = path.indexOf("/bases", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_referenceId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("/bases"));
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
        unittest.expect(queryMap["start"].first, unittest.equals(arg_start));
        unittest.expect(queryMap["end"].first, unittest.equals(arg_end));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));
        unittest.expect(core.int.parse(queryMap["pageSize"].first), unittest.equals(arg_pageSize));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListBasesResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_referenceId, start: arg_start, end: arg_end, pageToken: arg_pageToken, pageSize: arg_pageSize).then(unittest.expectAsync(((api.ListBasesResponse response) {
        checkListBasesResponse(response);
      })));
    });

  });


  unittest.group("resource-ReferencesetsResourceApi", () {
    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.ReferencesetsResourceApi res = new api.GenomicsApi(mock).referencesets;
      var arg_referenceSetId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("v1/referencesets/"));
        pathOffset += 17;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_referenceSetId"));

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
        var resp = convert.JSON.encode(buildReferenceSet());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_referenceSetId).then(unittest.expectAsync(((api.ReferenceSet response) {
        checkReferenceSet(response);
      })));
    });

    unittest.test("method--search", () {

      var mock = new HttpServerMock();
      api.ReferencesetsResourceApi res = new api.GenomicsApi(mock).referencesets;
      var arg_request = buildSearchReferenceSetsRequest();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.SearchReferenceSetsRequest.fromJson(json);
        checkSearchReferenceSetsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 23), unittest.equals("v1/referencesets/search"));
        pathOffset += 23;

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
        var resp = convert.JSON.encode(buildSearchReferenceSetsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.search(arg_request).then(unittest.expectAsync(((api.SearchReferenceSetsResponse response) {
        checkSearchReferenceSetsResponse(response);
      })));
    });

  });


  unittest.group("resource-VariantsResourceApi", () {
    unittest.test("method--create", () {

      var mock = new HttpServerMock();
      api.VariantsResourceApi res = new api.GenomicsApi(mock).variants;
      var arg_request = buildVariant();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Variant.fromJson(json);
        checkVariant(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 11), unittest.equals("v1/variants"));
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
        var resp = convert.JSON.encode(buildVariant());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.create(arg_request).then(unittest.expectAsync(((api.Variant response) {
        checkVariant(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.VariantsResourceApi res = new api.GenomicsApi(mock).variants;
      var arg_variantId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("v1/variants/"));
        pathOffset += 12;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_variantId"));

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
        var resp = convert.JSON.encode(buildEmpty());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_variantId).then(unittest.expectAsync(((api.Empty response) {
        checkEmpty(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.VariantsResourceApi res = new api.GenomicsApi(mock).variants;
      var arg_variantId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("v1/variants/"));
        pathOffset += 12;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_variantId"));

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
        var resp = convert.JSON.encode(buildVariant());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_variantId).then(unittest.expectAsync(((api.Variant response) {
        checkVariant(response);
      })));
    });

    unittest.test("method--import", () {

      var mock = new HttpServerMock();
      api.VariantsResourceApi res = new api.GenomicsApi(mock).variants;
      var arg_request = buildImportVariantsRequest();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.ImportVariantsRequest.fromJson(json);
        checkImportVariantsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18), unittest.equals("v1/variants:import"));
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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.import(arg_request).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--merge", () {

      var mock = new HttpServerMock();
      api.VariantsResourceApi res = new api.GenomicsApi(mock).variants;
      var arg_request = buildMergeVariantsRequest();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.MergeVariantsRequest.fromJson(json);
        checkMergeVariantsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 17), unittest.equals("v1/variants:merge"));
        pathOffset += 17;

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
        var resp = convert.JSON.encode(buildEmpty());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.merge(arg_request).then(unittest.expectAsync(((api.Empty response) {
        checkEmpty(response);
      })));
    });

    unittest.test("method--patch", () {

      var mock = new HttpServerMock();
      api.VariantsResourceApi res = new api.GenomicsApi(mock).variants;
      var arg_request = buildVariant();
      var arg_variantId = "foo";
      var arg_updateMask = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Variant.fromJson(json);
        checkVariant(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 12), unittest.equals("v1/variants/"));
        pathOffset += 12;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_variantId"));

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
        unittest.expect(queryMap["updateMask"].first, unittest.equals(arg_updateMask));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildVariant());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.patch(arg_request, arg_variantId, updateMask: arg_updateMask).then(unittest.expectAsync(((api.Variant response) {
        checkVariant(response);
      })));
    });

    unittest.test("method--search", () {

      var mock = new HttpServerMock();
      api.VariantsResourceApi res = new api.GenomicsApi(mock).variants;
      var arg_request = buildSearchVariantsRequest();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.SearchVariantsRequest.fromJson(json);
        checkSearchVariantsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18), unittest.equals("v1/variants/search"));
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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildSearchVariantsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.search(arg_request).then(unittest.expectAsync(((api.SearchVariantsResponse response) {
        checkSearchVariantsResponse(response);
      })));
    });

    unittest.test("method--stream", () {

      var mock = new HttpServerMock();
      api.VariantsResourceApi res = new api.GenomicsApi(mock).variants;
      var arg_request = buildStreamVariantsRequest();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.StreamVariantsRequest.fromJson(json);
        checkStreamVariantsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 18), unittest.equals("v1/variants:stream"));
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


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildStreamVariantsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.stream(arg_request).then(unittest.expectAsync(((api.StreamVariantsResponse response) {
        checkStreamVariantsResponse(response);
      })));
    });

  });


  unittest.group("resource-VariantsetsResourceApi", () {
    unittest.test("method--create", () {

      var mock = new HttpServerMock();
      api.VariantsetsResourceApi res = new api.GenomicsApi(mock).variantsets;
      var arg_request = buildVariantSet();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.VariantSet.fromJson(json);
        checkVariantSet(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 14), unittest.equals("v1/variantsets"));
        pathOffset += 14;

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
        var resp = convert.JSON.encode(buildVariantSet());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.create(arg_request).then(unittest.expectAsync(((api.VariantSet response) {
        checkVariantSet(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.VariantsetsResourceApi res = new api.GenomicsApi(mock).variantsets;
      var arg_variantSetId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("v1/variantsets/"));
        pathOffset += 15;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_variantSetId"));

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
        var resp = convert.JSON.encode(buildEmpty());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_variantSetId).then(unittest.expectAsync(((api.Empty response) {
        checkEmpty(response);
      })));
    });

    unittest.test("method--export", () {

      var mock = new HttpServerMock();
      api.VariantsetsResourceApi res = new api.GenomicsApi(mock).variantsets;
      var arg_request = buildExportVariantSetRequest();
      var arg_variantSetId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.ExportVariantSetRequest.fromJson(json);
        checkExportVariantSetRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("v1/variantsets/"));
        pathOffset += 15;
        index = path.indexOf(":export", pathOffset);
        unittest.expect(index >= 0, unittest.isTrue);
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset, index));
        pathOffset = index;
        unittest.expect(subPart, unittest.equals("$arg_variantSetId"));
        unittest.expect(path.substring(pathOffset, pathOffset + 7), unittest.equals(":export"));
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
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.export(arg_request, arg_variantSetId).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.VariantsetsResourceApi res = new api.GenomicsApi(mock).variantsets;
      var arg_variantSetId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("v1/variantsets/"));
        pathOffset += 15;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_variantSetId"));

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
        var resp = convert.JSON.encode(buildVariantSet());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_variantSetId).then(unittest.expectAsync(((api.VariantSet response) {
        checkVariantSet(response);
      })));
    });

    unittest.test("method--patch", () {

      var mock = new HttpServerMock();
      api.VariantsetsResourceApi res = new api.GenomicsApi(mock).variantsets;
      var arg_request = buildVariantSet();
      var arg_variantSetId = "foo";
      var arg_updateMask = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.VariantSet.fromJson(json);
        checkVariantSet(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("v1/variantsets/"));
        pathOffset += 15;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_variantSetId"));

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
        unittest.expect(queryMap["updateMask"].first, unittest.equals(arg_updateMask));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildVariantSet());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.patch(arg_request, arg_variantSetId, updateMask: arg_updateMask).then(unittest.expectAsync(((api.VariantSet response) {
        checkVariantSet(response);
      })));
    });

    unittest.test("method--search", () {

      var mock = new HttpServerMock();
      api.VariantsetsResourceApi res = new api.GenomicsApi(mock).variantsets;
      var arg_request = buildSearchVariantSetsRequest();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.SearchVariantSetsRequest.fromJson(json);
        checkSearchVariantSetsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 21), unittest.equals("v1/variantsets/search"));
        pathOffset += 21;

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
        var resp = convert.JSON.encode(buildSearchVariantSetsResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.search(arg_request).then(unittest.expectAsync(((api.SearchVariantSetsResponse response) {
        checkSearchVariantSetsResponse(response);
      })));
    });

  });


}

