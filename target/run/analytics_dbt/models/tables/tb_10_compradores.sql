

  create  table
    "dev"."public"."tb_10_compradores__dbt_tmp"
    
    
    
  as (
    with sales as (
    SELECT * from "dev"."public"."vw_sales"
),

compradores as (

    SELECT
        (firstname ||' '|| lastname) as Nome_Completo, userid
    FROM users
),

top_10_compradores as (

    SELECT
        compradores.Nome_Completo as Nome_Completo,
        sum(sales.quantidade_vendida) as Vendas_totais,
        sales.comissao as Comissao
    FROM sales INNER JOIN compradores
    ON sales.id_comprador = compradores.userid
    GROUP BY compradores.userid, compradores.Nome_Completo, sales.comissao
    ORDER BY Vendas_totais DESC
    LIMIT 10

)

SELECT * FROM top_10_compradores
  );