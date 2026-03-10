# Operação - Extração de Snapshot de Sinais Vitais - Guia de Implementação: Integração de Sinais Vitais (iNNOVIAN -> SOARIAN) v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Operação - Extração de Snapshot de Sinais Vitais**

## OperationDefinition: Operação - Extração de Snapshot de Sinais Vitais 

| | |
| :--- | :--- |
| *Official URL*:http://hospitaldaluz.pt/fhir/ig/vitalsigns/OperationDefinition/vitals-snapshot | *Version*:1.0.0 |
| Draft as of 2026-03-09 | *Computable Name*:VitalsSnapshot |

 
Operação personalizada para pedir os sinais vitais ao iNNOVIAN baseada na Hora da Colheita. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "vitals-snapshot",
  "url" : "http://hospitaldaluz.pt/fhir/ig/vitalsigns/OperationDefinition/vitals-snapshot",
  "version" : "1.0.0",
  "name" : "VitalsSnapshot",
  "title" : "Operação - Extração de Snapshot de Sinais Vitais",
  "status" : "draft",
  "kind" : "operation",
  "date" : "2026-03-09T17:59:40+00:00",
  "publisher" : "Miguel Figueiredo",
  "description" : "Operação personalizada para pedir os sinais vitais ao iNNOVIAN baseada na Hora da Colheita.",
  "code" : "vitals-snapshot",
  "resource" : ["Observation"],
  "system" : false,
  "type" : true,
  "instance" : false,
  "parameter" : [{
    "name" : "requestId",
    "use" : "in",
    "min" : 1,
    "max" : "1",
    "documentation" : "Identificador único do pedido (UUID).",
    "type" : "string"
  },
  {
    "name" : "patient",
    "use" : "in",
    "min" : 1,
    "max" : "1",
    "documentation" : "Identificador do Cliente (Preferencialmente o NHC).",
    "type" : "Identifier"
  },
  {
    "name" : "requestedDateTime",
    "use" : "in",
    "min" : 1,
    "max" : "1",
    "documentation" : "Hora da colheita no Soarian (timestamp T).",
    "type" : "dateTime"
  },
  {
    "name" : "code",
    "use" : "in",
    "min" : 1,
    "max" : "*",
    "documentation" : "Lista de códigos LOINC dos sinais vitais a extrair",
    "type" : "Coding"
  },
  {
    "name" : "return",
    "use" : "out",
    "min" : 1,
    "max" : "1",
    "documentation" : "Resposta do servidor em formato de Bundle com as avaliações individuais",
    "type" : "Bundle"
  }]
}

```
