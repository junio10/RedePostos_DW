use bd_rede_postos

CREATE OR ALTER PROCEDURE SP_OLTP_VENDA(@DATA_CARGA DATETIME,@DATA_INICIAL DATETIME, @DATA_FINAL DATETIME)
AS 
BEGIN
       DELETE FROM TB_AUX_VENDA WHERE @DATA_CARGA = DATA_CARGA
	   INSERT INTO TB_AUX_VENDA(DATA_CARGA,DATA_VENDA,COD_VENDA,COD_LOJA,COD_FUNCIONARIO,COD_PRODUTO,COD_TIPO_PAGAMENTO,VOLUME,VALOR) 
	   SELECT @DATA_CARGA, V.DATA_VENDA, V.COD_VENDA, V.COD_LOJA, V.COD_FUNCIONARIO, V.COD_PRODUTO, V.COD_TIPO_PAGAMENTO,V.VOLUME, V.VALOR FROM TB_VENDA V
	   WHERE V.DATA_VENDA >= @DATA_INICIAL AND V.DATA_VENDA <= @DATA_FINAL

END