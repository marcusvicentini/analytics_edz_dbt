select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      --testa se existe valores negativos

SELECT *
    FROM tb_10_compradores
    WHERE vendas_totais < 0
      
    ) dbt_internal_test