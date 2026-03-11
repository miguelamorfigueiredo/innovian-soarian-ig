# Guia de Implementação: iNNOVIAN para SOARIAN

## 1. Introdução
Este guia define as regras de interoperabilidade e a arquitetura de dados para a extração síncrona do valor mais próximo (*snapshot*) de sinais vitais registados no sistema iNNOVIAN, para integração no sistema SOARIAN.

A solução assenta numa operação FHIR personalizada (`$vitals-snapshot`) que permite solicitar sinais vitais com base na Hora da Colheita, garantindo segurança clínica através da utilização de códigos LOINC, regras temporais explícitas e tratamento seguro de ausência de dados.

### Arquitetura de Integração
```mermaid
flowchart LR
    %% Bloco Superior: Arquitetura e Mapeamento
    subgraph Fluxo de Integração e Transformação LOINC
        direction LR
        A[(Monitor\niNNOVIAN box3)] -->|Extração API| B{Servidor de\nIntegração FHIR}
        
        B -->|FC: 8867-4 bpm| C1[Freq. Cardíaca]
        B -->|SpO2: 59408-5 %| C2[Oximetria]
        B -->|FRi: 9279-1 resp./min| C3[Freq. Respiratória]
        B -->|PNI: 8480-6 / 8462-4 mmHg| C4[Pressão Arterial]
        
        %% Agrupar a tabela do Soarian
        subgraph Tabela Soarian
            C1
            C2
            C3
            C4
        end
    end

    %% Bloco Inferior: O Modelo de Dados FHIR
    subgraph Modelo de Dados FHIR (Exemplo Frequência Cardíaca)
        direction LR
        P((Paciente\nID: 5390745)) -->|subject.reference\nPatient/5390745| O(Observação FHIR\nFC: 130 bpm)
        D[[Monitor Draeger\nID: 999]] -->|device.reference\nDevice/999| O
    end
```
---

## 2. Trigger da Integração
O pedido de dados é acionado de forma síncrona pelo SOARIAN quando o utilizador solicita a importação de sinais vitais numa *flowsheet*.

Nesse momento, o SOARIAN define o instante **T** (“Hora da Colheita”) e envia o pedido ao middleware de integração.

---

## 3. Tolerâncias Temporais (Regras de Extração)
Para garantir que o doente não recebe dados desatualizados, o *Middleware* (DSTI) tem de aplicar uma janela de pesquisa assimétrica `[T - tol, T + tol[` na base de dados do iNNOVIAN.

As tolerâncias definidas clinicamente para este projeto são:
* **Todos os Sinais Vitais** (Frequência Cardíaca, Frequência Respiratória, SpO2, Pressão Arterial Sistólica/Diastólica e Temperatura Corporal): Tolerância estrita de **± 3 minutos**.

*Nota Clínica sobre a Temperatura:* A extração da Temperatura Corporal via integração automática está desenhada especificamente para cenários de monitorização contínua (ex: sensores de temperatura nos monitores Dräger em Neonatologia ou Cuidados Intensivos). Avaliações pontuais de temperatura (ex: auricular) inseridas manualmente no iNNOVIAN não são alvo desta operação de *Snapshot*.

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