SELECT TOP 20
  metro_name, rpp_pct_change, housing_pct_change, value_pct_change, housing_driven_flag
FROM mart.v_metro_delta_2019_2023_enhanced
ORDER BY value_pct_change DESC;
