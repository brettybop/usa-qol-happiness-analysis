USE usa_qol;
GO

CREATE OR ALTER VIEW mart.v_metro_delta_2019_2023_enhanced AS
SELECT
  cbsa_code,
  metro_name,

  rpp_2019, rpp_2023,
  rpp_change,
  rpp_pct_change = (rpp_change / NULLIF(rpp_2019, 0)) * 100.0,

  housing_2019, housing_2023,
  housing_change,
  housing_pct_change = (housing_change / NULLIF(housing_2019, 0)) * 100.0,

  income_2019, income_2023,
  income_change,
  income_pct_change = (income_change / NULLIF(income_2019, 0)) * 100.0,

  value_2019, value_2023,
  value_change,
  value_pct_change = (value_change / NULLIF(value_2019, 0)) * 100.0,

  -- key: “how much did housing move relative to overall COL move?”
  housing_to_rpp_ratio = housing_change / NULLIF(rpp_change, 0),

  -- same flag, but now backed by ratio you can visualize
  housing_driven_flag =
    CASE WHEN ABS(housing_change) >= ABS(rpp_change) * 2 THEN 1 ELSE 0 END,

  -- readable classification for Tableau
  affordability_outcome =
    CASE
      WHEN value_change >= 0 THEN 'Value Improved'
      ELSE 'Value Worsened'
    END

FROM mart.v_metro_delta_2019_2023;
GO
