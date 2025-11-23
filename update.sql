SELECT * FROM produtos;
SELECT * FROM clientes;
SELECT * FROM vendas;

--Teste para ver se trigger está funcionando

UPDATE vendas
SET quantidade = 20
WHERE id_venda = 25;

--

UPDATE clientes
SET ativo = 'N'
WHERE id_cliente = 21;



-- teste para procedure de incluir nova venda

SET SERVEROUTPUT ON;

DECLARE
    v_msg VARCHAR2(200);
BEGIN
    registrar_venda(
        p_id_cliente => 21,
        p_id_produto => 2,
        p_quantidade => 1,
        p_msg        => v_msg
    );

    DBMS_OUTPUT.PUT_LINE(v_msg);
END;
/

-- teste para cancelar uma venda

BEGIN
    cancelar_venda(42);   -- troque pelo id_venda real da tabela
END;
/

