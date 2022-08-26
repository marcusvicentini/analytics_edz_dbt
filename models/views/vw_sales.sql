
with source_sales as (
    SELECT *
    FROM sales
),

renamed as (
    SELECT
        SALESID AS ID_VENDA,
        LISTID AS ID_LISTA,
        SELLERID AS ID_VENDEDOR,
        BUYERID AS ID_COMPRADOR,
        EVENTID AS ID_EVENTO,
        DATEID AS ID_DATE,
        QTYSOLD AS QUANTIDADE_VENDIDA,
        PRICEPAID AS VALOR_PAGO,
        COMMISSION AS COMISSÃO,
        TO_CHAR(SALETIME, 'dd/mm/yyyy HH24:MI:SS') AS DATA_HORA_VENDA,
        TO_CHAR(SALETIME, 'HH24:MI:SS') AS HORA_VENDA,
        cast(SALETIME as date) AS DATA_VENDA

FROM source_sales
)

SELECT * from renamed