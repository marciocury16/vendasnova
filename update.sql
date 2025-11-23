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

-- job de limpeza de vendas antigas

BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
        job_name        => 'JOB_LIMPAR_VENDAS_ANTIGAS',
        job_type        => 'STORED_PROCEDURE',
        job_action      => 'LIMPAR_VENDAS_ANTIGAS',
        start_date      => SYSTIMESTAMP,
        repeat_interval => 'FREQ=MONTHLY; BYMONTHDAY=1; BYHOUR=2; BYMINUTE=0; BYSECOND=0',
        enabled         => TRUE,
        comments        => 'Job para remover vendas com mais de 2 anos.'
    );
END;
/


--verificar job existe:

SELECT job_name, state, last_start_date
FROM dba_scheduler_jobs
WHERE job_name = 'JOB_LIMPAR_VENDAS_ANTIGAS';

-- verificar se job está ativo

SELECT job_name, enabled
FROM dba_scheduler_jobs
WHERE job_name = 'JOB_LIMPAR_VENDAS_ANTIGAS';

-- se precisar executar job manual

BEGIN
    DBMS_SCHEDULER.RUN_JOB('JOB_LIMPAR_VENDAS_ANTIGAS');
END;
/

-- conferência do job

SELECT job_name,
       status,
       actual_start_date,
       run_duration,
       error#
FROM dba_scheduler_job_run_details
WHERE job_name = 'JOB_LIMPAR_VENDAS_ANTIGAS'
ORDER BY log_id DESC;

