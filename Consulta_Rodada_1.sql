-- 17-04 -- RODADA 1
select * from Brasileirao.dbo.Serie_A

-- Cartões
SELECT 
    Id_jogo,
    Time_mandante,
    Time_visitante,
    Cartao_mandante + Cartao_visitante AS TotalCartoes
FROM Serie_A
ORDER BY TotalCartoes DESC;

-- Total de Cartões
SELECT 
    Rodada,
    SUM(Cartao_mandante + Cartao_visitante) AS TotalCartoesPorRodada
FROM Serie_A
WHERE Rodada = 1
GROUP BY Rodada;


-- Faltas
SELECT 
    Id_jogo,
    Time_mandante,
    Time_visitante,
    Faltas_mandante + Faltas_visitante AS TotalFaltas
FROM Serie_A
ORDER BY TotalFaltas DESC;

-- Total de faltas
SELECT 
    Rodada,
    SUM(Faltas_mandante + Faltas_visitante) AS TotalFaltasPorRodada
FROM Serie_A
WHERE Rodada = 1
GROUP BY Rodada;

-- Faltas x Cartão
SELECT 
    Time,
    SUM(TotalFaltas) AS TotalFaltas,
    SUM(TotalCartoes) AS TotalCartoes,
    SUM(TotalFaltas) / NULLIF(SUM(TotalCartoes), 0) AS Relacao_Faltas_Cartoes
FROM (
    SELECT 
        Time_mandante AS Time,
        Faltas_mandante AS TotalFaltas,
        Cartao_mandante AS TotalCartoes
    FROM Serie_A
    
    UNION ALL
    
    SELECT 
        Time_visitante AS Time,
        Faltas_visitante AS TotalFaltas,
        Cartao_visitante AS TotalCartoes
    FROM Serie_A
) AS DadosPorTime
GROUP BY Time
ORDER BY Relacao_Faltas_Cartoes DESC;

-- Posse de bola x gols
SELECT 
    Time_mandante,
    Posse_de_bola_mandante AS Posse_de_bola_mandante,
    Gols_mandante AS Gols_mandante,
    Time_visitante,
    Posse_de_bola_visitante AS Posse_de_bola_visitante,
    Gols_visitante AS Gols_visitante
FROM Serie_A
ORDER BY Posse_de_bola_mandante DESC, Posse_de_bola_visitante DESC;

-- Fin e SoT x gols
SELECT 
    'Mandante' AS Tipo_time,
    Time_mandante AS Time,
    Finalizacao_mandante AS Finalizacoes,
    Gols_mandante AS Gols,
    CAST(Finalizacao_mandante AS FLOAT) / NULLIF(Gols_mandante, 0) AS Relacao_Finalizacoes_Gols
FROM Serie_A

UNION ALL

SELECT 
    'Visitante' AS Tipo_time,
    Time_visitante AS Time,
    Finalizacao_visitante AS Finalizacoes,
    Gols_visitante AS Gols,
    CAST(Finalizacao_visitante AS FLOAT) / NULLIF(Gols_visitante, 0) AS Relacao_Finalizacoes_Gols
FROM Serie_A
ORDER BY Finalizacoes DESC;

-- Passes x Gol
SELECT 
    Id_jogo,
    'Mandante' AS Tipo_time,
    Time_mandante AS Time,
    Passes_mandante AS Passes,
    Precisao_de_passes_mandante AS Precisao_passes,
    Gols_mandante AS Gols
FROM Serie_A

UNION ALL

SELECT 
    Id_jogo,
    'Visitante' AS Tipo_time,
    Time_visitante AS Time,
    Passes_visitante AS Passes,
    Precisao_de_passes_visitante AS Precisao_passes,
    Gols_visitante AS Gols
FROM Serie_A
ORDER BY Passes, Tipo_time;

-- Média Gols
SELECT 
    Tipo_time,
    AVG(Gols) AS Media_gols_por_jogo
FROM (
    SELECT 
        'Mandante' AS Tipo_time,
        Gols_mandante AS Gols
    FROM Serie_A

    UNION ALL

    SELECT 
        'Visitante' AS Tipo_time,
        Gols_visitante AS Gols
    FROM Serie_A
    
    UNION ALL
    
    SELECT 
        'Geral' AS Tipo_time,
        Gols_mandante + Gols_visitante AS Gols
    FROM Serie_A
) AS GolsPorTime
GROUP BY Tipo_time;

-- Média Escanteios
SELECT 
    Tipo_time,
    AVG(Escanteios) AS Media_escanteios_por_jogo
FROM (
    SELECT 
        'Mandante' AS Tipo_time,
        Escanteios_mandante AS Escanteios
    FROM Serie_A

    UNION ALL

    SELECT 
        'Visitante' AS Tipo_time,
        Escanteio_visitante AS Escanteios
    FROM Serie_A
    
    UNION ALL
    
    SELECT 
        'Geral' AS Tipo_time,
        Escanteios_mandante + Escanteio_visitante AS Escanteios
    FROM Serie_A
) AS EscanteiosPorTime
GROUP BY Tipo_time;

-- Média Cartão
SELECT 
    Tipo_time,
    AVG(Cartoes) AS Media_cartoes_por_jogo
FROM (
    SELECT 
        'Mandante' AS Tipo_time,
        Cartao_mandante AS Cartoes
    FROM Serie_A

    UNION ALL

    SELECT 
        'Visitante' AS Tipo_time,
        Cartao_visitante AS Cartoes
    FROM Serie_A
    
    UNION ALL
    
    SELECT 
        'Geral' AS Tipo_time,
        Cartao_mandante + Cartao_visitante AS Cartoes
    FROM Serie_A
) AS CartoesPorTime
GROUP BY Tipo_time;

-- Média Faltas
SELECT 
    Tipo_time,
    AVG(Faltas) AS Media_faltas_por_jogo
FROM (
    SELECT 
        'Mandante' AS Tipo_time,
        Faltas_mandante AS Faltas
    FROM Serie_A

    UNION ALL

    SELECT 
        'Visitante' AS Tipo_time,
        Faltas_visitante AS Faltas
    FROM Serie_A
    
    UNION ALL
    
    SELECT 
        'Geral' AS Tipo_time,
        Faltas_mandante + Faltas_visitante AS Faltas
    FROM Serie_A
) AS FaltasPorTime
GROUP BY Tipo_time;

-- Média Defesas
SELECT 
    Tipo_time,
    AVG(Defesas) AS Media_defesas_por_jogo
FROM (
    SELECT 
        'Mandante' AS Tipo_time,
        Defesas_mandante AS Defesas
    FROM Serie_A

    UNION ALL

    SELECT 
        'Visitante' AS Tipo_time,
        Defesas_visitante AS Defesas
    FROM Serie_A
    
    UNION ALL
    
    SELECT 
        'Geral' AS Tipo_time,
        Defesas_mandante + Defesas_visitante AS Defesas
    FROM Serie_A
) AS DefesasPorTime
GROUP BY Tipo_time;

-- Média Impedimento
SELECT 
    Tipo_time,
    AVG(Impedimentos) AS Media_impedimentos_por_jogo
FROM (
    SELECT 
        'Mandante' AS Tipo_time,
        Impedimentos_mandante AS Impedimentos
    FROM Serie_A

    UNION ALL

    SELECT 
        'Visitante' AS Tipo_time,
        Impedimentos_visitante AS Impedimentos
    FROM Serie_A
    
    UNION ALL
    
    SELECT 
        'Geral' AS Tipo_time,
        Impedimentos_mandante + Impedimentos_visitante AS Impedimentos
    FROM Serie_A
) AS ImpedimentosPorTime
GROUP BY Tipo_time;

-- Média Finalização
SELECT 
    Tipo_time,
    AVG(Finalizacoes) AS Media_finalizacoes_por_jogo
FROM (
    SELECT 
        'Mandante' AS Tipo_time,
        Finalizacao_mandante AS Finalizacoes
    FROM Serie_A

    UNION ALL

    SELECT 
        'Visitante' AS Tipo_time,
        Finalizacao_visitante AS Finalizacoes
    FROM Serie_A
    
    UNION ALL
    
    SELECT 
        'Geral' AS Tipo_time,
        Finalizacao_mandante + Finalizacao_visitante AS Finalizacoes
    FROM Serie_A
) AS FinalizacoesPorTime
GROUP BY Tipo_time;

-- Média Finalização Certas
SELECT 
    Tipo_time,
    AVG(SoT) AS Media_SoT_por_jogo
FROM (
    SELECT 
        'Mandante' AS Tipo_time,
        SoT_mandante AS SoT
    FROM Serie_A

    UNION ALL

    SELECT 
        'Visitante' AS Tipo_time,
        SoT_visitante AS SoT
    FROM Serie_A
    
    UNION ALL
    
    SELECT 
        'Geral' AS Tipo_time,
        SoT_mandante + SoT_visitante AS SoT
    FROM Serie_A
) AS SoTPorTime
GROUP BY Tipo_time;

-- Média Posse de Bola
SELECT 
    Tipo_time,
    AVG(Posse_de_bola) AS Media_posse_de_bola_por_jogo
FROM (
    SELECT 
        'Mandante' AS Tipo_time,
        Posse_de_bola_mandante AS Posse_de_bola
    FROM Serie_A

    UNION ALL

    SELECT 
        'Visitante' AS Tipo_time,
        Posse_de_bola_visitante AS Posse_de_bola
    FROM Serie_A
    
    UNION ALL
    
    SELECT 
        'Geral' AS Tipo_time,
        Posse_de_bola_mandante + Posse_de_bola_visitante AS Posse_de_bola
    FROM Serie_A
) AS PosseDeBolaPorTime
GROUP BY Tipo_time;

-- Média Passes
SELECT 
    Tipo_time,
    AVG(Passes) AS Media_passes_por_jogo
FROM (
    SELECT 
        'Mandante' AS Tipo_time,
        Passes_mandante AS Passes
    FROM Serie_A

    UNION ALL

    SELECT 
        'Visitante' AS Tipo_time,
        Passes_visitante AS Passes
    FROM Serie_A
    
    UNION ALL
    
    SELECT 
        'Geral' AS Tipo_time,
        Passes_mandante + Passes_visitante AS Passes
    FROM Serie_A
) AS PassesPorTime
GROUP BY Tipo_time;

-- Média Precisão
SELECT 
    Tipo_time,
    AVG(Precisao_de_passes) AS Media_precisao_de_passes_por_jogo
FROM (
    SELECT 
        'Mandante' AS Tipo_time,
        Precisao_de_passes_mandante AS Precisao_de_passes
    FROM Serie_A

    UNION ALL

    SELECT 
        'Visitante' AS Tipo_time,
        Precisao_de_passes_visitante AS Precisao_de_passes
    FROM Serie_A
    
    UNION ALL
    
    SELECT 
        'Geral' AS Tipo_time,
        (Precisao_de_passes_mandante + Precisao_de_passes_visitante) / 2 AS Precisao_de_passes
    FROM Serie_A
) AS PrecisaoDePassesPorTime
GROUP BY Tipo_time;