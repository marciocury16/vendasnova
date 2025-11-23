-- trigger para atualizar estoque após inserir uma venda na tabela vendas

CREATE OR REPLACE TRIGGER trg_atualiza_estoque
AFTER INSERT OR UPDATE ON vendas
FOR EACH ROW
BEGIN
    -- Caso seja INSERT: diminui a quantidade vendida do estoque
    IF INSERTING THEN
        UPDATE produtos
        SET quantidade_estoque = quantidade_estoque - :NEW.quantidade
        WHERE id_produto = :NEW.id_produto;
    END IF;

    -- Caso seja UPDATE: ajusta o estoque com base na diferença
    IF UPDATING THEN
        UPDATE produtos
        SET quantidade_estoque = quantidade_estoque - (:NEW.quantidade - :OLD.quantidade)
        WHERE id_produto = :NEW.id_produto;
    END IF;

END;
/