USE usa_qol;
GO

CREATE OR ALTER VIEW mart.v_metro_year_rpp AS
SELECT
    cbsa_code,
    metro_name,
    [year],

    -- Income (already “real” / price-adjusted to 2017 dollars)
    real_personal_income_millions_2017 = MAX(CASE WHEN linecode = 1 THEN value END),
    real_per_capita_income_2017        = MAX(CASE WHEN linecode = 2 THEN value END),

    -- Cost of living (price level indices)
    rpp_all_items_index                = MAX(CASE WHEN linecode = 3 THEN value END),
    rpp_goods_index                    = MAX(CASE WHEN linecode = 4 THEN value END),
    rpp_housing_index                  = MAX(CASE WHEN linecode = 5 THEN value END),
    rpp_utilities_index                = MAX(CASE WHEN linecode = 6 THEN value END),
    rpp_other_services_index           = MAX(CASE WHEN linecode = 7 THEN value END),
    implicit_regional_deflator_index   = MAX(CASE WHEN linecode = 8 THEN value END),

    -- Portfolio metrics (simple but powerful)
    col_vs_us_all_items = MAX(CASE WHEN linecode = 3 THEN value END) - 100.0,
    col_vs_us_housing   = MAX(CASE WHEN linecode = 5 THEN value END) - 100.0,

    -- "Value" proxy: high real income + low prices
    value_index_simple =
        MAX(CASE WHEN linecode = 2 THEN value END) / NULLIF(MAX(CASE WHEN linecode = 3 THEN value END), 0) * 100.0

FROM stg.v_rpp_long_msa
WHERE [year] BETWEEN 2008 AND 2023
GROUP BY cbsa_code, metro_name, [year];
GO
