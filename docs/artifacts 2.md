# Artifacts Summary - Guia de Implementação: Integração de Sinais Vitais (iNNOVIAN -> SOARIAN) v1.0.0

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Behavior: Operation Definitions 

These are custom operations that can be supported by and/or invoked by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Operação - Extração de Snapshot de Sinais Vitais](OperationDefinition-vitals-snapshot.md) | Operação personalizada para pedir os sinais vitais ao iNNOVIAN baseada na Hora da Colheita. |

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Sinais Vitais Base - iNNOVIAN](StructureDefinition-sinais-vitais-innovian-base.md) | Perfil base para os sinais vitais extraídos do iNNOVIAN para o SOARIAN. |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Value Set de Sinais Vitais do iNNOVIAN](ValueSet-codigos-vitais-innovian-vs.md) | Códigos LOINC permitidos para a extração de sinais vitais do iNNOVIAN para o SOARIAN |

### Example: Example Instances 

These are example instances that show what data produced and consumed by systems conforming with this implementation guide might look like.

| | |
| :--- | :--- |
| [Exemplo de Frequência Cardíaca Preliminar](Observation-ExampleHeartRatePreliminary.md) | Exemplo de observação de frequência cardíaca proveniente do iNNOVIAN, devolvida para pré-preenchimento no Soarian antes de validação pelo Enfermeiro. A referência ao doente é simplificada para fins ilustrativos; em produção, a identificação deverá ser resolvida por NHC e/ou episódio clínico. |

