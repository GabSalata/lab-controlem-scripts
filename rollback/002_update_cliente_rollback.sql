-- 002_update_cliente_rollback.sql
-- Rollback do script 002_update_cliente.sql

BEGIN TRY
    BEGIN TRANSACTION;
    
    UPDATE [dbo].[CLIENTE]
    SET [STATUS] = 'ATIVO'
    WHERE [ID] = 1;
    
    COMMIT TRANSACTION;
    PRINT 'Rollback executado com sucesso';
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
    
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    RAISERROR(@ErrorMessage, 16, 1);
END CATCH;