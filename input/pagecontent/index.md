# Guia de Implementação: iNNOVIAN para SOARIAN

## 1. Introdução
Este guia define as regras de interoperabilidade e a arquitetura de dados para a extração síncrona do valor mais próximo (*snapshot*) de sinais vitais registados no sistema iNNOVIAN, para integração no sistema SOARIAN.

A solução assenta numa operação FHIR personalizada (`$vitals-snapshot`) que permite solicitar sinais vitais com base na Hora da Colheita, garantindo segurança clínica através da utilização de códigos LOINC, regras temporais explícitas e tratamento seguro de ausência de dados.

---

## 2. Trigger da Integração
O pedido de dados é acionado de forma síncrona pelo SOARIAN quando o utilizador solicita a importação de sinais vitais numa *flowsheet*.

Nesse momento, o SOARIAN define o instante **T** (“Hora da Colheita”) e envia o pedido ao middleware de integração.

---

## 3. Regras de Extração e Tolerâncias Temporais
Para garantir relevância clínica e evitar a importação de valores desatualizados, o middleware deve pesquisar no iNNOVIAN dentro de uma janela temporal definida em torno de **T**.

As tolerâncias clínicas adotadas neste projeto são:

* **Frequência Cardíaca, Frequência Respiratória, SpO2, Pressão Arterial Sistólica e Pressão Arterial Diastólica**: **± 3 minutos**
* **Temperatura Corporal**: **± 60 minutos**

A pesquisa deve respeitar a janela assimétrica `[T - tolerância, T + tolerância[`.

---

## 4. Tratamento da Ausência de Dados
Se não existir nenhum valor válido dentro da janela temporal definida para um determinado parâmetro, o sistema não deve devolver valores artificiais como `0` ou `null`.

Nessas situações, a observação deve usar o mecanismo FHIR de ausência de dados:

* `dataAbsentReason = not-performed`

Isto permite que o SOARIAN mantenha o campo em branco de forma segura, evitando interpretações clínicas erradas, como por exemplo a leitura indevida de assístolia por ausência de frequência cardíaca válida.

---

## 5. Validação Clínica dos Dados
Os valores devolvidos pela operação `$vitals-snapshot` correspondem a medições automáticas provenientes do iNNOVIAN. Estes valores destinam-se ao pré-preenchimento da interface de registo no SOARIAN e devem ser considerados preliminares até validação por um enfermeiro.

O SOARIAN deve permitir a revisão e correção manual destes valores antes do registo definitivo, de forma a garantir a segurança do doente e a fidelidade clínica da informação.