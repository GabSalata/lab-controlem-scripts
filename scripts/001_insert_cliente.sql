-- 001_insert_cliente.sql
-- Descrição: Insere novo cliente
-- Autor: Seu Nome
-- Data: 2026-10-03

BEGIN TRY
    BEGIN TRANSACTION;
    
    INSERT INTO [dbo].[CLIENTE] ([ID], [NOME], [STATUS])
    VALUES (1, 'Cliente Teste', 'ATIVO');
    
    COMMIT TRANSACTION;
    PRINT 'Insert executado com sucesso';
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
    
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    RAISERROR(@ErrorMessage, 16, 1);
END CATCH;