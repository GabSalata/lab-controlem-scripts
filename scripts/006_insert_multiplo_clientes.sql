-- 006_insert_multiplo_clientes.sql
-- Descrição: Insere múltiplos clientes na tabela CLIENTE
-- Autor: GabSalata
-- Data: 2026-10-03

BEGIN TRY
    BEGIN TRANSACTION;
    
    -- Insere múltiplos clientes de uma vez
    INSERT INTO [dbo].[CLIENTE] ([ID], [NOME], [STATUS])
    VALUES 
        (2, 'Maria Silva', 'ATIVO'),
        (3, 'João Santos', 'ATIVO'),
        (4, 'Ana Oliveira', 'INATIVO'),
        (5, 'Pedro Costa', 'ATIVO'),
        (6, 'Carla Ferreira', 'ATIVO'),
        (7, 'Roberto Almeida', 'INATIVO'),
        (8, 'Juliana Lima', 'ATIVO'),
        (9, 'Fernando Souza', 'ATIVO'),
        (10, 'Patricia Rocha', 'INATIVO');
    
    COMMIT TRANSACTION;
    PRINT '9 clientes inseridos com sucesso';
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
    
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
    DECLARE @ErrorState INT = ERROR_STATE();
    
    RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
END CATCH;
