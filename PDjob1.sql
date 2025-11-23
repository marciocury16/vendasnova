-- procedure para job para limpar vendas antigas

CREATE OR REPLACE PROCEDURE limpar_vendas_antigas
IS
BEGIN
    DELETE FROM vendas
    WHERE id_venda IN (
        SELECT id_venda
        FROM vendas
        WHERE SYSDATE - (SELECT data_cadastro 
                         FROM clientes 
                         WHERE id_cliente = vendas.id_usuario) > 730
    );

    COMMIT;
END;
/
