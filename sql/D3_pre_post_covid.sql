USE usa_qol;
GO

CREATE OR ALTER VIEW mart.v_metro_delta_2019_2023 AS
WITH base AS (
    SELECT
        cbsa_code,
        metro_name,
        [year],
        rpp_all_items_index,
        rpp_housing_index,
        real_per_capita_income_2017,
        value_index_simple
    FROM mart.v_metro_year_rpp
    WHERE [year] IN (2019, 2023)
)
SELECT
    cbsa_code,
    metro_name,

    rpp_2019  = MAX(CASE WHEN [year] = 2019 THEN rpp_all_items_index END),
    rpp_2023  = MAX(CASE WHEN [year] = 2023 THEN rpp_all_items_index END),
    rpp_change = MAX(CASE WHEN [year] = 2023 THEN rpp_all_items_index END)
               - MAX(CASE WHEN [year] = 2019 THEN rpp_all_items_index END),

    housing_2019  = MAX(CASE WHEN [year] = 2019 THEN rpp_housing_index END),
    housing_2023  = MAX(CASE WHEN [year] = 2023 THEN rpp_housing_index END),
    housing_change = MAX(CASE WHEN [year] = 2023 THEN rpp_housing_index END)
                  - MAX(CASE WHEN [year] = 2019 THEN rpp_housing_index END),

    income_2019 = MAX(CASE WHEN [year] = 2019 THEN real_per_capita_income_2017 END),
    income_2023 = MAX(CASE WHEN [year] = 2023 THEN real_per_capita_income_2017 END),
    income_change = MAX(CASE WHEN [year] = 2023 THEN real_per_capita_income_2017 END)
                  - MAX(CASE WHEN [year] = 2019 THEN real_per_capita_income_2017 END),

    value_2019 = MAX(CASE WHEN [year] = 2019 THEN value_index_simple END),
    value_2023 = MAX(CASE WHEN [year] = 2023 THEN value_index_simple END),
    value_change = MAX(CASE WHEN [year] = 2023 THEN value_index_simple END)
                 - MAX(CASE WHEN [year] = 2019 THEN value_index_simple END)

FROM base
GROUP BY cbsa_code, metro_name;
GO
