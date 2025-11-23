-- procedure para cancelar uma venda:

CREATE OR REPLACE PROCEDURE cancelar_venda (
    p_id_venda IN NUMBER
)
IS
    v_id_produto   vendas.id_produto%TYPE;
    v_quantidade   vendas.quantidade%TYPE;
BEGIN
    -- 1. Buscar os dados da venda
    SELECT id_produto, quantidade
    INTO v_id_produto, v_quantidade
    FROM vendas
    WHERE id_venda = p_id_venda;

    -- 2. Devolver a quantidade ao estoque do produto
    UPDATE produtos
    SET quantidade_estoque = quantidade_estoque + v_quantidade,
        data_atualizacao = SYSDATE
    WHERE id_produto = v_id_produto;

    -- 3. Remover a venda
    DELETE FROM vendas
    WHERE id_venda = p_id_venda;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Venda não encontrada.');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END cancelar_venda;
/
