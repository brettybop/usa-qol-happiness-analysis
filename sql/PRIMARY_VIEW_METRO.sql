USE usa_qol;
GO

CREATE OR ALTER VIEW mart.v_tableau_metro_dataset AS
SELECT
  r.cbsa_code,
  r.metro_name,
  r.[year],

  -- core metrics
  r.rpp_all_items_index,
  r.rpp_housing_index,
  r.real_per_capita_income_2017,
  r.value_index_simple,

  -- ranks (yearly)
  rk.rank_value,
  rk.rank_cost,
  rk.rank_income,

  -- segment
  seg.segment,

  -- YoY changes
  yoy.rpp_yoy_change,
  yoy.value_yoy_change,

  -- 2019→2023 deltas (attach to every year row for quick filtering/labeling)
  d.rpp_pct_change,
  d.housing_pct_change,
  d.value_pct_change,
  d.housing_driven_flag,
  d.housing_to_rpp_ratio,
  d.affordability_outcome

FROM mart.v_metro_year_rpp r
LEFT JOIN mart.v_metro_year_ranked rk
  ON rk.cbsa_code = r.cbsa_code AND rk.[year] = r.[year]
LEFT JOIN mart.v_metro_year_segment seg
  ON seg.cbsa_code = r.cbsa_code AND seg.[year] = r.[year]
LEFT JOIN mart.v_metro_year_yoy yoy
  ON yoy.cbsa_code = r.cbsa_code AND yoy.[year] = r.[year]
LEFT JOIN mart.v_metro_delta_2019_2023_enhanced d
  ON d.cbsa_code = r.cbsa_code;
GO
