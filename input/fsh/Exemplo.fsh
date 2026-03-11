//Exemplo de como devem ser enviados os valores dos Parâmetros Vitais do iNNOVIAN para o Soarian

// Frequência Cardíaca
Instance: ExampleHeartRate
InstanceOf: SinaisVitaisInnovianBase
Usage: #example
Title: "Exemplo - Frequência Cardíaca"
Description: "Exemplo de extração de Frequência Cardíaca (Snapshot) do iNNOVIAN."

* status = #preliminary
* category = $obscat#vital-signs "Vital Signs"
* category.text = "Vital Signs"
* code = $loinc#8867-4 "Heart rate"

* subject = Reference(ExemploClienteLuz)

* encounter.identifier.system = "http://hospitaldaluz.pt/soarian/encounter"
* encounter.identifier.value = "enc-2026-0001"

* performer[0].display = "Dräger iNNOVIAN"

* effectiveDateTime = "2026-03-09T15:03:15Z"
* valueQuantity.value = 82
* valueQuantity.unit = "bpm"
* valueQuantity.system = $ucum
* valueQuantity.code = #/min

// Frequência Respiratória
Instance: ExemploRespiratoryRate
InstanceOf: SinaisVitaisInnovianBase
Usage: #example
Title: "Exemplo - Frequência Respiratória"
Description: "Exemplo de extração de Frequência Respiratória (Snapshot) do iNNOVIAN."

* status = #preliminary
* category = $obscat#vital-signs "Vital Signs"
* category.text = "Vital Signs"
* code = $loinc#9279-1 "Respiratory rate"

* subject = Reference(ExemploClienteLuz)

* encounter.identifier.system = "http://hospitaldaluz.pt/soarian/encounter"
* encounter.identifier.value = "enc-2026-0001"

* performer[0].display = "Dräger iNNOVIAN"

* effectiveDateTime = "2026-03-09T15:03:15Z"
* valueQuantity.value = 16
* valueQuantity.unit = "resp/min"
* valueQuantity.system = $ucum
* valueQuantity.code = #/min

// Temperatura Corporal
Instance: ExemploBodyTemperature
InstanceOf: SinaisVitaisInnovianBase
Usage: #example
Title: "Exemplo - Temperatura Corporal"
Description: "Exemplo de Temperatura Corporal."

* status = #preliminary
* category = $obscat#vital-signs "Vital Signs"
* category.text = "Vital Signs"
* code = $loinc#8310-5 "Body temperature"

* subject = Reference(ExemploClienteLuz)

* encounter.identifier.system = "http://hospitaldaluz.pt/soarian/encounter"
* encounter.identifier.value = "enc-2026-0001"

* performer[0].display = "Dräger iNNOVIAN"

* effectiveDateTime = "2026-03-09T15:03:15Z"
* valueQuantity.value = 36.8
* valueQuantity.unit = "ºC"
* valueQuantity.system = $ucum
* valueQuantity.code = #Cel 

// Pressão Arterial (Painel Agregado)
Instance: ExemploBloodPressure
InstanceOf: SinaisVitaisInnovianBase
Usage: #example
Title: "Exemplo - Pressão Arterial (Painel)"
Description: "Exemplo de observação de Pressão Arterial agregada em painel, exigida pelo standard FHIR. Contém Sistólica e Diastólica como componentes."

* status = #preliminary
* category = $obscat#vital-signs "Vital Signs"
* code = $loinc#85354-9 "Blood pressure panel with all children optional"

* subject = Reference(ExemploClienteLuz)
* encounter.identifier.system = "http://hospitaldaluz.pt/soarian/encounter"
* encounter.identifier.value = "enc-2026-0001"

* performer[0].display = "Dräger iNNOVIAN"

* effectiveDateTime = "2026-03-09T15:03:15Z"

// Componente 1: Sistólica
* component[0].code = $loinc#8480-6 "Systolic blood pressure"
* component[0].valueQuantity.value = 120
* component[0].valueQuantity.unit = "mmHg"
* component[0].valueQuantity.system = $ucum
* component[0].valueQuantity.code = #mm[Hg]

// Componente 2: Diastólica
* component[1].code = $loinc#8462-4 "Diastolic blood pressure"
* component[1].valueQuantity.value = 80
* component[1].valueQuantity.unit = "mmHg"
* component[1].valueQuantity.system = $ucum
* component[1].valueQuantity.code = #mm[Hg]

//Exemplo do Patient
Instance: ExemploClienteLuz
InstanceOf: Patient
Usage: #example
Title: "Exemplo - Cliente"
Description: "Cliente Ficticio criado para demonstração"

* identifier.system = "http://hospitaldaluz.pt/identifier/nhc"
* identifier.value = "12345678"
* name.family = "Silva"
* name.given[0] = "João"
* birthDate = "1950-01-01"

// Exemplo do Bundle (Resposta do Middleware)
Instance: ExemploBundleResposta
InstanceOf: Bundle
Usage: #example
Title: "Exemplo - Resposta de Sinais Vitais (Bundle)"
Description: "Pacote de resposta devolvido contendo o Snapshot da extração, com todos os parâmetros vitais capturados dentro da janela T ± 3 minutos."

* type = #searchset
* total = 4

// Entrada 1: Frequência Cardíaca
* entry[0].fullUrl = "http://hospitaldaluz.pt/fhir/Observation/ExampleHeartRate"
* entry[0].resource = ExampleHeartRate
* entry[0].search.mode = #match

// Entrada 2: Frequência Respiratória
* entry[+].fullUrl = "http://hospitaldaluz.pt/fhir/Observation/ExemploRespiratoryRate"
* entry[=].resource = ExemploRespiratoryRate
* entry[=].search.mode = #match

// Entrada 3: Temperatura Corporal
* entry[+].fullUrl = "http://hospitaldaluz.pt/fhir/Observation/ExemploBodyTemperature"
* entry[=].resource = ExemploBodyTemperature
* entry[=].search.mode = #match

// Entrada 4: Pressão Arterial (Painel)
* entry[+].fullUrl = "http://hospitaldaluz.pt/fhir/Observation/ExemploBloodPressure"
* entry[=].resource = ExemploBloodPressure
* entry[=].search.mode = #match