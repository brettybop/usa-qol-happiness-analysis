SELECT TOP 15
  metro_name, rpp_pct_change, housing_pct_change, housing_to_rpp_ratio, value_pct_change, affordability_outcome
FROM mart.v_metro_delta_2019_2023_enhanced
ORDER BY rpp_pct_change DESC;
