CREATE OR REPLACE PROCEDURE registrar_venda (
    p_id_cliente   IN NUMBER,
    p_id_produto   IN NUMBER,
    p_quantidade   IN NUMBER,
    p_msg          OUT VARCHAR2
)
AS
    v_cliente_ativo   CHAR(1);
    v_produto_ativo   CHAR(1);
    v_estoque_atual   NUMBER;
BEGIN
    --------------------------------------------------------------------
    -- 1) Verifica se o cliente existe e está ativo
    --------------------------------------------------------------------
    BEGIN
        SELECT ativo
        INTO v_cliente_ativo
        FROM clientes
        WHERE id_cliente = p_id_cliente;

        IF v_cliente_ativo = 'N' THEN
            p_msg := 'Cliente inativo. Venda não realizada.';
            RETURN;
        END IF;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            p_msg := 'Cliente não encontrado. Venda não realizada.';
            RETURN;
    END;


    --------------------------------------------------------------------
    -- 2) Verifica se o produto existe e está ativo
    --------------------------------------------------------------------
    BEGIN
        SELECT ativo
        INTO v_produto_ativo
        FROM produtos
        WHERE id_produto = p_id_produto;

        IF v_produto_ativo = 'N' THEN
            p_msg := 'Produto inativo. Venda não realizada.';
            RETURN;
        END IF;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            p_msg := 'Produto não encontrado. Venda não realizada.';
            RETURN;
    END;


    --------------------------------------------------------------------
    -- 3) Verifica estoque disponível
    --------------------------------------------------------------------
    SELECT quantidade_estoque
    INTO v_estoque_atual
    FROM produtos
    WHERE id_produto = p_id_produto;

    IF v_estoque_atual < p_quantidade THEN
        p_msg := 'Estoque insuficiente. Venda não realizada.';
        RETURN;
    END IF;


    --------------------------------------------------------------------
    -- 4) Insere a venda
    --------------------------------------------------------------------
    INSERT INTO vendas (id_usuario, id_produto, quantidade)
    VALUES (p_id_cliente, p_id_produto, p_quantidade);


    --------------------------------------------------------------------
    -- 5) Atualiza estoque do produto
    --------------------------------------------------------------------
    UPDATE produtos
    SET quantidade_estoque = quantidade_estoque - p_quantidade,
        data_atualizacao   = SYSDATE
    WHERE id_produto = p_id_produto;


    --------------------------------------------------------------------
    -- 6) Finaliza com sucesso
    --------------------------------------------------------------------
    p_msg := 'Venda realizada com sucesso!';

EXCEPTION
    WHEN OTHERS THEN
        p_msg := 'Erro inesperado: ' || SQLERRM;
END;
/
