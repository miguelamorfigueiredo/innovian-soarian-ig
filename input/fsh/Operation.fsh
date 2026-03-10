// My observation example
Instance: OperacaoVitalsSnapshot
InstanceOf: OperationDefinition
Usage: #definition
Title: "Operação - Extração de Snapshot de Sinais Vitais"
Description: "Operação personalizada para pedir os sinais vitais ao iNNOVIAN baseada na Hora da Colheita."

// Configueração do Endpoint
* id = "vitals-snapshot"

* name = "VitalsSnapshot"
* status = #draft
* kind = #operation
* code = #vitals-snapshot
* resource[0] = #Observation
* url = "http://hospitaldaluz.pt/fhir/ig/vitalsigns/OperationDefinition/vitals-snapshot"
* system = false
* type = true
* instance = false


//Parâmetros de entrada
//======================

// Id único auditoria e idempotencia - requestid
* parameter[+].name = #requestId
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #string
* parameter[=].documentation = "Identificador único do pedido (UUID)."

// Id do Cliente (NHC) - patientmrn
* parameter[+].name = #patient
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #Identifier
* parameter[=].documentation = "Identificador do Cliente (Preferencialmente o NHC)."

// "Hora da Colheita" - requestedAt
* parameter[+].name = #requestedDateTime
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #dateTime
* parameter[=].documentation = "Hora da colheita no Soarian (timestamp T)."

//Parâmetros (Lista de códigos LOINC)
* parameter[+].name = #code
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "*"
* parameter[=].type = #Coding
* parameter[=].documentation = "Lista de códigos LOINC dos sinais vitais a extrair"


//parâmetros de saída - Resposta Middleware
// ===================

//Bundle

* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].type = #Bundle
* parameter[=].documentation = "Resposta do servidor em formato de Bundle com as avaliações individuais"
