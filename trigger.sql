-- trigger para atualizar estoque após inserir uma venda na tabela vendas

CREATE OR REPLACE TRIGGER trg_atualiza_estoque
AFTER INSERT ON vendas
FOR EACH ROW
BEGIN
    -- Atualiza a quantidade em estoque do produto vendido
    UPDATE produtos
    SET quantidade_estoque = quantidade_estoque - :NEW.quantidade
    WHERE id_produto = :NEW.id_produto;
    
    -- Opcional: você pode adicionar verificação de estoque negativo
    -- IF (quantidade_estoque - :NEW.quantidade < 0) THEN
    --    RAISE_APPLICATION_ERROR(-20001, 'Estoque insuficiente!');
    -- END IF;
END;
/
