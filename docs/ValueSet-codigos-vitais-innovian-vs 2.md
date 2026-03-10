# Value Set de Sinais Vitais do iNNOVIAN - Guia de Implementação: Integração de Sinais Vitais (iNNOVIAN -> SOARIAN) v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Value Set de Sinais Vitais do iNNOVIAN**

## ValueSet: Value Set de Sinais Vitais do iNNOVIAN 

| | |
| :--- | :--- |
| *Official URL*:http://hospitaldaluz.pt/fhir/ig/vitalsigns/ValueSet/codigos-vitais-innovian-vs | *Version*:1.0.0 |
| Draft as of 2026-03-09 | *Computable Name*:CodigosVitaisInnovianVS |

 
Códigos LOINC permitidos para a extração de sinais vitais do iNNOVIAN para o SOARIAN 

 **References** 

* [Sinais Vitais Base - iNNOVIAN](StructureDefinition-sinais-vitais-innovian-base.md)

### Logical Definition (CLD)

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "codigos-vitais-innovian-vs",
  "url" : "http://hospitaldaluz.pt/fhir/ig/vitalsigns/ValueSet/codigos-vitais-innovian-vs",
  "version" : "1.0.0",
  "name" : "CodigosVitaisInnovianVS",
  "title" : "Value Set de Sinais Vitais do iNNOVIAN",
  "status" : "draft",
  "experimental" : false,
  "date" : "2026-03-09T17:59:40+00:00",
  "publisher" : "Miguel Figueiredo",
  "description" : "Códigos LOINC permitidos para a extração de sinais vitais do iNNOVIAN para o SOARIAN",
  "compose" : {
    "include" : [{
      "system" : "http://loinc.org",
      "concept" : [{
        "code" : "8867-4",
        "display" : "Heart rate"
      },
      {
        "code" : "9279-1",
        "display" : "Respiratory rate"
      },
      {
        "code" : "59408-5",
        "display" : "Oxygen saturation in Arterial blood by Pulse oximetry"
      },
      {
        "code" : "8480-6",
        "display" : "Systolic blood pressure"
      },
      {
        "code" : "8462-4",
        "display" : "Diastolic blood pressure"
      },
      {
        "code" : "8310-5",
        "display" : "Body temperature"
      }]
    }]
  }
}

```
