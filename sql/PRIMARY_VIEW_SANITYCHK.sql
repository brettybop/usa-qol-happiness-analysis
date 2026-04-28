USE usa_qol;
GO

SELECT TOP 50 *
FROM mart.v_tableau_metro_dataset
ORDER BY [year] DESC, value_index_simple DESC;
