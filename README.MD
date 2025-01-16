# **Aplicativo de Acompanhamento de Plantas**

Um aplicativo desenvolvido em **Swift** e **SwiftUI** para ajudar usuários a acompanhar o crescimento e o cuidado de plantas específicas (manjericão, coentro e salsa). O aplicativo fornece informações sobre a planta escolhida, condições ideais de cultivo e permite o acompanhamento do progresso com base nas condições climáticas locais.


## **Funcionalidades**

### **1. Tela Inicial**
- Carrossel interativo que exibe três opções de plantas: **manjericão**, **coentro** e **salsa**.
- Cada item do carrossel contém:
  - Nome da planta.
  - Imagem ilustrativa.
  - Botão para acessar informações detalhadas sobre a planta.
- **Ações**:
  - Toque na imagem: Redireciona para a **Tela de Acompanhamento da Planta**.
  - Toque no botão: Inicia o **Fluxo de Detalhes da Planta**.

### **2. Fluxo de Detalhes da Planta**
- Série de telas com informações textuais e imagens sobre:
  1. A planta selecionada.
  2. Solo adequado.
  3. Ferramentas recomendadas.
  4. Condições climáticas ideais.
- Cada tela inclui um botão para navegar para a próxima etapa, até chegar à **Tela de Acompanhamento da Planta**.

### **3. Tela de Acompanhamento da Planta**
- Informações dinâmicas sobre o progresso da planta, incluindo:
  - Dias e semanas desde o plantio.
  - Quantos dias faltam para regar, podar e colher.
  - Status atual da planta baseado nas condições climáticas locais.
- Exibição de informações climáticas, como:
  - Previsão do tempo (ensolarado, chuvoso, etc.).
  - Temperatura.
  - Umidade do ar.
- Indicadores visuais e texto descritivo sobre o estado esperado da planta.

### **4. Integração com API do Tempo**
- Utiliza serviços de previsão do tempo para obter:
  - Condições climáticas da localização atual do usuário (usando GPS).
  - Temperatura e umidade em tempo real.
- Possibilidade de configurar manualmente a localização, caso o usuário não deseje compartilhar dados de GPS.

## **Padrão de Desenvolvimento - GitFlow**

Para organizar o desenvolvimento do projeto, utilizamos o fluxo de trabalho baseado em **GitFlow**. Abaixo estão as diretrizes:

### **1. Estrutura de Branches**
- **Main**: 
  - Contém o código estável e pronto para produção.
  - Todo código na branch `main` deve ser testado e aprovado.
- **Develop**:
  - Contém o código em desenvolvimento.
  - É a base para novas funcionalidades e integrações.
- **Feature**:
  - Cada nova funcionalidade ou melhoria deve ser desenvolvida em uma branch de feature derivada de `develop`.
  - Nomeie as branches no formato: `feature/nome-da-feature`.
- **Release**:
  - Usada para preparar uma nova versão antes de enviá-la para produção.
  - Crie a branch a partir de `develop` e, ao final, mescle em `main` e `develop`.
- **Hotfix**:
  - Usada para corrigir bugs críticos encontrados em produção.
  - Crie a branch a partir de `main` e, ao final, mescle em `main` e `develop`.

### **2. Fluxo de Trabalho**
1. **Criar uma nova feature:**
   - Certifique-se de estar na branch `develop`:
     ```bash
     git checkout develop
     ```
   - Crie uma nova branch para a feature:
     ```bash
     git checkout -b feature/nome-da-feature
     ```
   - Após desenvolver, commit e envie as alterações:
     ```bash
     git add .
     git commit -m "Adiciona [descrição breve da feature]"
     git push origin feature/nome-da-feature
     ```
   - Abra um Pull Request para `develop`.

2. **Preparar uma versão (Release):**
   - Crie a branch de release a partir de `develop`:
     ```bash
     git checkout develop
     git checkout -b release/vX.X.X
     ```
   - Teste e faça ajustes na versão.
   - Após concluir, mescle a branch:
     ```bash
     git checkout main
     git merge release/vX.X.X
     git tag -a vX.X.X -m "Versão X.X.X"
     git push origin main --tags
     ```

3. **Correção rápida (Hotfix):**
   - Crie uma branch de hotfix a partir de `main`:
     ```bash
     git checkout main
     git checkout -b hotfix/descricao-do-bug
     ```
   - Após corrigir, mescle a branch:
     ```bash
     git checkout main
     git merge hotfix/descricao-do-bug
     git checkout develop
     git merge hotfix/descricao-do-bug
     ```

## **Estrutura de Dados**

Os dados das plantas estão armazenados em um arquivo **JSON** para facilitar o gerenciamento e a escalabilidade do aplicativo.

### Exemplo de estrutura JSON:
```json
[
  {
    "name": "Manjericão",
    "description": "Planta aromática amplamente utilizada na culinária.",
    "soilInfo": "Prefere solos bem drenados, ricos em matéria orgânica.",
    "toolsInfo": "Tesoura de poda, regador e pá pequena.",
    "climateInfo": "Clima quente e úmido, com boa exposição ao sol.",
    "wateringInterval": 3,
    "pruningInterval": 7,
    "harvestDays": 30,
    "image": "basil.png"
  },
  {
    "name": "Coentro",
    "description": "Erva versátil, utilizada em pratos frescos e temperados.",
    "soilInfo": "Necessita de solo bem drenado e rico em nutrientes.",
    "toolsInfo": "Pá pequena, regador e recipiente para plantio.",
    "climateInfo": "Clima ameno, preferencialmente entre 18-25ºC.",
    "wateringInterval": 2,
    "pruningInterval": 10,
    "harvestDays": 40,
    "image": "cilantro.png"
  }
]
```
## **Tecnologias Utilizadas**
- **Linguagem:** Swift
- **Framework:** SwiftUI
- **Serviços Externos:**
  - **CoreLocation:** Para obter a localização do usuário.
  - **API de Previsão do Tempo:** (ex.: OpenWeatherMap ou WeatherAPI).
- **Gerenciamento de Dados:** JSON integrado ao aplicativo.

## **Como Rodar o Projeto**

### **Pré-requisitos**
- Xcode 14 ou superior instalado no macOS.
- Conta no serviço de API de previsão do tempo (ex.: OpenWeatherMap).
- Chave de API para o serviço configurado.

### **Passos**
1. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/seu-repositorio.git
   cd seu-repositorio
   ```
2. Abra o arquivo do projeto no Xcode.
3. Adicione sua chave de API no arquivo de configuração do serviço de previsão do tempo:
   ```swift
   let apiKey = "SUA_CHAVE_DE_API"
   ```
4. Compile e rode o projeto em um simulador ou dispositivo físico.

## **Roadmap de Melhorias**
- Adicionar mais plantas ao catálogo.
- Permitir ao usuário registrar novas plantas manualmente.
- Adicionar notificações push para lembretes de rega e poda.
- Melhorar visualização de gráficos na tela de acompanhamento.
- Implementar suporte a múltiplos idiomas.


## **Contribuições**
Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests.

1. Faça um fork deste repositório.
2. Crie uma nova branch para sua feature:
   ```bash
   git checkout -b minha-nova-feature
   ```
3. Commit suas alterações:
   ```bash
   git commit -m "Adiciona nova feature"
   ```
4. Envie sua branch:
   ```bash
   git push origin minha-nova-feature
   ```
5. Abra um Pull Request.


## **Licença**
Este projeto está licenciado sob a licença MIT. Consulte o arquivo [LICENSE](LICENSE) para mais informações.

