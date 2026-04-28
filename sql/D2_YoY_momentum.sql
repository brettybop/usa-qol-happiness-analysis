USE usa_qol;
GO

CREATE OR ALTER VIEW mart.v_metro_year_yoy AS
SELECT
    cbsa_code,
    metro_name,
    [year],

    rpp_all_items_index,
    real_per_capita_income_2017,
    value_index_simple,

    rpp_yoy_change = rpp_all_items_index
        - LAG(rpp_all_items_index) OVER (PARTITION BY cbsa_code ORDER BY [year]),

    income_yoy_change = real_per_capita_income_2017
        - LAG(real_per_capita_income_2017) OVER (PARTITION BY cbsa_code ORDER BY [year]),

    value_yoy_change = value_index_simple
        - LAG(value_index_simple) OVER (PARTITION BY cbsa_code ORDER BY [year])

FROM mart.v_metro_year_rpp;
GO
