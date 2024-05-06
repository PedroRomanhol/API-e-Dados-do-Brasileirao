# API de Estatísticas do Brasileirão Série A

Este projeto consiste em uma API em Python para coletar estatísticas de jogo dos times da Série A do Campeonato Brasileiro a partir do site SofaScore. 
Além disso, inclui um script para inserção dos dados em um banco de dados SQL e uma consulta SQL para obter os dados da primeira rodada do campeonato.

## Funcionalidades

- **Coleta de Dados:** Utiliza ferramentas como BeautifulSoup, Pandas e JSON para extrair estatísticas de jogo dos times da Série A do SofaScore.
- **Inserção em Banco de Dados:** Um script Python para inserir os dados coletados em um banco e também inserceção de dados em SQL.
- **Consulta SQL:** Uma consulta pré-definida para obter os dados do campeonato diretamente do banco de dados.

## Como Usar

1. **Coleta e Inserção de Dados:**
   - Execute o script `API_BR24.ipynb` para coletar as estatísticas do SofaScore e salvar em um arquivo JSON.
   - Execute os scripts `Criacao_Base_e_Tabela_Brasileirao.sql` e `Insercao_rodada1_Brasileirao_A.sql` para coletar e inserir os dados em SQL

2. **Consulta SQL:**
   - Execute a consulta SQL `Consulta_Rodada_1.sql` no seu banco de dados para obter os dados da primeira rodada do campeonato.
   - Execute o script `API_BR24.ipynb` para encontrar a tabela com as estatísticas dos times e fazer consultas

## Estrutura do Projeto

- `API_BR24.ipynb`: Script Python para coletar os dados do SofaScore e consultar a tabela.
- `Criacao_Base_e_Tabela_Brasileirao.sql` e `Insercao_rodada1_Brasileirao_A.sql` : Script em SQL para inserir os dados coletados em um banco de dados SQL.
- `Consulta_Rodada_1.sql`: Consulta SQL para obter os dados da primeira rodada do campeonato.

## Contribuições

Contribuições são bem-vindas! Se você encontrar um problema ou tiver uma ideia para melhorar o projeto, sinta-se à vontade para abrir uma issue ou enviar um pull request.
