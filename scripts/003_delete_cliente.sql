-- 003_delete_cliente.sql
-- Descrição: Remove cliente da tabela CLIENTE
-- Autor: Gabriel
-- Data: 2026-10-03

BEGIN TRY
    BEGIN TRANSACTION;
    
    DELETE FROM [dbo].[CLIENTE]
    WHERE [ID] = 1;
    
    COMMIT TRANSACTION;
    PRINT 'Delete executado com sucesso';
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
    
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    RAISERROR(@ErrorMessage, 16, 1);
END CATCH;
