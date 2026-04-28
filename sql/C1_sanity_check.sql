USE usa_qol;
GO

SELECT TOP 10 *
FROM mart.v_metro_year_rpp
WHERE cbsa_code = '10180'
ORDER BY [year];
