//Exemplo de como deve ser enviado o valor de FC para o Soarian
Instance: ExampleHeartRatePreliminary
InstanceOf: SinaisVitaisInnovianBase
Usage: #example
Title: "Exemplo de Frequência Cardíaca Preliminar"
Description: "Exemplo de observação de frequência cardíaca proveniente do iNNOVIAN, devolvida para pré-preenchimento no Soarian antes de validação pelo Enfermeiro. A referência ao doente é simplificada para fins ilustrativos; em produção, a identificação deverá ser resolvida por NHC e/ou episódio clínico."

* status = #preliminary
* category = $obscat#vital-signs "Vital Signs"
* category.text = "Vital Signs"
* code = $loinc#8867-4 "Heart rate"

* subject.identifier.system = "http://hospitaldaluz.pt/identifier/nhc"
* subject.identifier.value = "12345678"

* encounter.identifier.system = "http://hospitaldaluz.pt/soarian/encounter"
* encounter.identifier.value = "enc-2026-0001"

* performer[0].display = "Dräger iNNOVIAN"

* effectiveDateTime = "2026-03-09T15:03:15Z"
* valueQuantity.value = 82
* valueQuantity.unit = "bpm"
* valueQuantity.system = $ucum
* valueQuantity.code = #/min