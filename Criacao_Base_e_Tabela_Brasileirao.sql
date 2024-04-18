-- Criar base de dados
create database Brasileirao

-- Usar a base de dados
use Brasileirao

-- Criar Tabela
create table Serie_A (
Id_jogo int identity primary key,
Ano_campeonato INTEGER,
Data_jogo DATE,
Horario VARCHAR(20),
Rodada INTEGER,
Estadio VARCHAR(50),
Arbitro VARCHAR(40),
Publico INTEGER,
Time_mandante VARCHAR(30),
Time_visitante VARCHAR(30),
Tecnico_mandante VARCHAR(40),
Tecnico_visitante VARCHAR(40),
Colocacao_mandante INTEGER,
Colocacao_visitante INTEGER,
Idade_media_mandante INTEGER,
Idade_media_visitante INTEGER,
Gols_mandante INTEGER,
Gols_visitante INTEGER,
Gols_HT_mandante INTEGER,
Gols_HT_visitante INTEGER,
Escanteios_mandante INTEGER,
Escanteio_visitante INTEGER,
Cartao_mandante INTEGER,
Cartao_visitante INTEGER,
Faltas_mandante INTEGER,
Faltas_visitante INTEGER,
Defesas_mandante INTEGER,
Defesas_visitante INTEGER,
Impedimentos_mandante INTEGER,
Impedimentos_visitante INTEGER,
Finalizacao_mandante INTEGER,
Finalizacao_visitante INTEGER,
SoT_mandante INTEGER,
SoT_visitante INTEGER,
Posse_de_bola_mandante INTEGER,
Posse_de_bola_visitante INTEGER,
Passes_mandante INTEGER,
Passes_visitante INTEGER,
Precisao_de_passes_mandante INTEGER,
Precisao_de_passes_visitante INTEGER)

-- ver colunas
sp_columns Serie_A

-- Clausula where (and/or/in) - Exemplos
Select * from Brasileirao.dbo.Serie_A
where Time_visitante = 'Vasco da Gama'

Select Estadio, Arbitro, Publico
from Brasileirao.dbo.Serie_A
where Tecnico_visitante = 'Cruzeiro'
and Ano_campeonato = 2024

-- Ordenação dos Dados
Select Nome, time
from Jogadores_brasileirao.dbo.gols
where Jogos > 15
Order by Nome

-- Agrupamento de dados
Select Distinct time
from Brasileirao.dbo.Serie_A
group by Ano_campeonato
group by Ano_campeonato desc

-- Operações com Agrupamento
Select time, sum(gols) as goals_total
from Jogadores_brasileirao.dbo.gols
group by time
order by gol_total desc

Select time, count(Id_jogador) as qtde_jogador
from Jogadores_brasileirao.dbo.gols
group by time

-- Join
Select a.nome, a.time, a.finalizacao_certa, b.gols
from Jogadores_brasileirao.dbo.Finalizacoes as a
join Jogadores_brasileirao.dbo.gols as b
on a.Id_jogador = b.id_jogador
where a.time = 'Flamengo'
order by a.Time

-- Union
Select top 2 *
where nome in ('Bruno Henrique', 'Hulk')
union
Select top 2 *, (gols/jogos) as porcent
from Jogadores_brasileirao.dbo.gols
where nome in ('Bruno Henrique', 'Hulk')
