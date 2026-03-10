# Sinais Vitais Base - iNNOVIAN - Guia de Implementação: Integração de Sinais Vitais (iNNOVIAN -> SOARIAN) v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Sinais Vitais Base - iNNOVIAN**

## Resource Profile: Sinais Vitais Base - iNNOVIAN 

| | |
| :--- | :--- |
| *Official URL*:http://hospitaldaluz.pt/fhir/ig/vitalsigns/StructureDefinition/sinais-vitais-innovian-base | *Version*:1.0.0 |
| Draft as of 2026-03-09 | *Computable Name*:SinaisVitaisInnovianBase |

 
Perfil base para os sinais vitais extraídos do iNNOVIAN para o SOARIAN. 

**Usos:**

* Exemplos para este Perfil: [Observation/ExampleHeartRatePreliminary](Observation-ExampleHeartRatePreliminary.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/innovian.to.soarian|current/StructureDefinition/sinais-vitais-innovian-base)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-sinais-vitais-innovian-base.csv), [Excel](StructureDefinition-sinais-vitais-innovian-base.xlsx), [Schematron](StructureDefinition-sinais-vitais-innovian-base.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "sinais-vitais-innovian-base",
  "url" : "http://hospitaldaluz.pt/fhir/ig/vitalsigns/StructureDefinition/sinais-vitais-innovian-base",
  "version" : "1.0.0",
  "name" : "SinaisVitaisInnovianBase",
  "title" : "Sinais Vitais Base - iNNOVIAN",
  "status" : "draft",
  "date" : "2026-03-09T17:59:40+00:00",
  "publisher" : "Miguel Figueiredo",
  "description" : "Perfil base para os sinais vitais extraídos do iNNOVIAN para o SOARIAN.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "sct-concept",
    "uri" : "http://snomed.info/conceptdomain",
    "name" : "SNOMED CT Concept Domain Binding"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "sct-attr",
    "uri" : "http://snomed.org/attributebinding",
    "name" : "SNOMED CT Attribute Binding"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Observation",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/vitalsigns",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation"
    },
    {
      "id" : "Observation.status",
      "path" : "Observation.status",
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://hl7.org/fhir/ValueSet/observation-status"
      }
    },
    {
      "id" : "Observation.code",
      "path" : "Observation.code",
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://hospitaldaluz.pt/fhir/ig/vitalsigns/ValueSet/codigos-vitais-innovian-vs"
      }
    },
    {
      "id" : "Observation.encounter",
      "path" : "Observation.encounter",
      "mustSupport" : true
    },
    {
      "id" : "Observation.effective[x]",
      "path" : "Observation.effective[x]",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "Observation.value[x]",
      "path" : "Observation.value[x]",
      "type" : [{
        "code" : "Quantity"
      }]
    },
    {
      "id" : "Observation.dataAbsentReason",
      "path" : "Observation.dataAbsentReason",
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "http://hl7.org/fhir/ValueSet/data-absent-reason"
      }
    }]
  }
}

```
