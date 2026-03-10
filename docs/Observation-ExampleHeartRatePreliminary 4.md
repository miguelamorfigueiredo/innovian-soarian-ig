# Exemplo de Frequência Cardíaca Preliminar - Guia de Implementação: Integração de Sinais Vitais (iNNOVIAN -> SOARIAN) v1.0.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Exemplo de Frequência Cardíaca Preliminar**

## Example Observation: Exemplo de Frequência Cardíaca Preliminar

Perfil: [Sinais Vitais Base - iNNOVIAN](StructureDefinition-sinais-vitais-innovian-base.md)

**status**: Preliminary

**category**: Vital Signs

**code**: Heart rate

**subject**: Identifier: `http://hospitaldaluz.pt/identifier/nhc`/12345678

**encounter**: Identifier: `http://hospitaldaluz.pt/soarian/encounter`/enc-2026-0001

**effective**: 2026-03-09 15:03:15+0000

**performer**: Dräger iNNOVIAN

**value**: 82 bpm (Detalhes: UCUM código/min = '/min')



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ExampleHeartRatePreliminary",
  "meta" : {
    "profile" : ["http://hospitaldaluz.pt/fhir/ig/vitalsigns/StructureDefinition/sinais-vitais-innovian-base"]
  },
  "status" : "preliminary",
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/observation-category",
      "code" : "vital-signs",
      "display" : "Vital Signs"
    }],
    "text" : "Vital Signs"
  }],
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "8867-4",
      "display" : "Heart rate"
    }]
  },
  "subject" : {
    "identifier" : {
      "system" : "http://hospitaldaluz.pt/identifier/nhc",
      "value" : "12345678"
    }
  },
  "encounter" : {
    "identifier" : {
      "system" : "http://hospitaldaluz.pt/soarian/encounter",
      "value" : "enc-2026-0001"
    }
  },
  "effectiveDateTime" : "2026-03-09T15:03:15Z",
  "performer" : [{
    "display" : "Dräger iNNOVIAN"
  }],
  "valueQuantity" : {
    "value" : 82,
    "unit" : "bpm",
    "system" : "http://unitsofmeasure.org",
    "code" : "/min"
  }
}

```
