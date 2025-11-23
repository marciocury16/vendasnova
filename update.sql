SELECT * FROM produtos;
SELECT * FROM clientes;
SELECT * FROM vendas;

--Teste para ver se trigger está funcionando

UPDATE vendas
SET quantidade = 20
WHERE id_venda = 25;

--

UPDATE clientes

SET nome = 'Juliana dos santos',
email = 'juliana.santos@abcd.com.br'
WHERE id_cliente = 21;




SET SERVEROUTPUT ON;

DECLARE
    v_msg VARCHAR2(200);
BEGIN
    registrar_venda(
        p_id_cliente => 22,
        p_id_produto => 2,
        p_quantidade => 1,
        p_msg        => v_msg
    );

    DBMS_OUTPUT.PUT_LINE(v_msg);
END;
/
