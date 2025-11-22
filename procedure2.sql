-- procedure para cancelar uma venda:

CREATE OR REPLACE PROCEDURE cancelar_venda (
    p_id_venda IN NUMBER,
    p_msg OUT VARCHAR2
)
AS
    v_id_produto NUMBER;
    v_quantidade NUMBER;
BEGIN
    -- Verifica se a venda existe e captura produto e quantidade
    BEGIN
        SELECT id_produto, quantidade
        INTO v_id_produto, v_quantidade
        FROM vendas
        WHERE id_venda = p_id_venda;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            p_msg := 'Venda não encontrada.';
            RETURN;
    END;

    -- Remove a venda
    DELETE FROM vendas
    WHERE id_venda = p_id_venda;

    -- Devolve o estoque do produto
    UPDATE produtos
    SET quantidade_estoque = quantidade_estoque + v_quantidade
    WHERE id_produto = v_id_produto;

    p_msg := 'Venda cancelada com sucesso e estoque atualizado.';
EXCEPTION
    WHEN OTHERS THEN
        p_msg := 'Erro inesperado: ' || SQLERRM;
END;
/

-- usar:

DECLARE
    v_mensagem VARCHAR2(200);
BEGIN
    cancelar_venda(1, v_mensagem); -- Cancela a venda com id_venda = 1
    DBMS_OUTPUT.PUT_LINE(v_mensagem);
END;
/
