//Declaration
Profile: SinaisVitaisInnovianBase

//Keywords
Parent: $vitalsigns
Id: sinais-vitais-innovian-base
Title: "Sinais Vitais Base - iNNOVIAN"
Description: "Perfil base para os sinais vitais extraídos do iNNOVIAN para o SOARIAN."

//Value Set
* code from CodigosVitaisInnovianVS (required)

//Chaves de segurança obrigatórias para a Resolução de Identidade e temporalidade
* subject 1..1 MS
* subject only Reference(Patient)

* encounter 0..1 MS
* encounter only Reference(Encounter)

* effective[x] only dateTime
* effectiveDateTime 1..1 MS

* value[x] only Quantity
* valueQuantity 0..1 MS

//Mapeamento dos estados de validação
* status from $obs-status (required)

//Regra de Ausência de Dados (Quando a medição está fora da janela T ou dá erro)
* dataAbsentReason 0..1 MS
* dataAbsentReason from $data-absent-reason (extensible)