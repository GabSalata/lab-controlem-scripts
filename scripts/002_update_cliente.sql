-- 002_update_cliente.sql
-- Descrição: Atualiza status do cliente
-- Autor: Seu Nome
-- Data: 2026-10-03

BEGIN TRY
    BEGIN TRANSACTION;
    
    UPDATE [dbo].[CLIENTE]
    SET [STATUS] = 'INATIVO'
    WHERE [ID] = 1;
    
    COMMIT TRANSACTION;
    PRINT 'Update executado com sucesso';
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
    
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    RAISERROR(@ErrorMessage, 16, 1);
END CATCH;