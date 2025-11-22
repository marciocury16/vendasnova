CREATE OR REPLACE PROCEDURE registrar_venda (
    p_id_cliente IN NUMBER,
    p_id_produto IN NUMBER,
    p_quantidade IN NUMBER,
    p_msg OUT VARCHAR2
)
AS
    v_estoque_atual NUMBER;
BEGIN
    -- Verifica se o cliente existe e está ativo
    DECLARE
        v_cliente_ativo CHAR(1);
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

    -- Verifica se o produto existe e está ativo
    DECLARE
        v_produto_ativo CHAR(1);
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

    -- Verifica estoque disponível
    SELECT quantidade_estoque
    INTO v_estoque_atual
    FROM produtos
    WHERE id_produto = p_id_produto;

    IF v_estoque_atual < p_quantidade THEN
        p_msg := 'Estoque insuficiente. Venda não realizada.';
        RETURN;
    END IF;

    -- Insere a venda
    INSERT INTO vendas (id_usuario, id_produto, quantidade)
    VALUES (p_id_cliente, p_id_produto, p_quantidade);

    -- Atualiza o estoque do produto
    UPDATE produtos
    SET quantidade_estoque = quantidade_estoque - p_quantidade
    WHERE id_produto = p_id_produto;

    p_msg := 'Venda realizada com sucesso!';
EXCEPTION
    WHEN OTHERS THEN
        p_msg := 'Erro inesperado: ' || SQLERRM;
END;

-- usar a procedure: 

DECLARE
    v_mensagem VARCHAR2(200);
BEGIN
    registrar_venda(1, 1, 2, v_mensagem); -- Cliente 1 compra 2 unidades do produto 1
    DBMS_OUTPUT.PUT_LINE(v_mensagem);
END;
/

SELECT * FROM VENDAS;
