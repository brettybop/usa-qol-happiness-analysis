USE usa_qol;
GO

CREATE OR ALTER VIEW stg.v_rpp_long_msa AS
SELECT
    cbsa_code,
    metro_name = LTRIM(RTRIM(REPLACE(metro_name_raw, ' (Metropolitan Statistical Area)', ''))),
    [year],
    linecode,
    metric_description,
    metric_unit,
    value
FROM stg.v_rpp_long
WHERE metro_name_raw LIKE '%(Metropolitan Statistical Area)%';
GO
