

  create  table
    "dev"."public"."tb_vendas_primeiro_trimestre__dbt_tmp"
    
    
    
  as (
    


--cria a fonte com os dados de date e converte o nome das colunas
with source_date as (
    SELECT dateid as id_date,
           month as mes,
           year as ano
    from date
),

--cria uma fonte de dados unindo a tabela sales com date
sales_date as (

    SELECT source_date.mes,
           sum(quantidade_vendida)
    FROM "dev"."public"."vw_sales" sales INNER JOIN source_date
    ON sales.id_date = source_date.id_date
    WHERE source_date.mes in ('JAN', 'FEV', 'MAR')
    AND source_date.ano = '2008'
    GROUP BY source_date.mes
)

SELECT * FROM sales_date
  );