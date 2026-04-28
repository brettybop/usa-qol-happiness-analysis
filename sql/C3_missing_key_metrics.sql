SELECT
  SUM(CASE WHEN rpp_all_items_index IS NULL THEN 1 ELSE 0 END) AS missing_rpp,
  SUM(CASE WHEN real_per_capita_income_2017 IS NULL THEN 1 ELSE 0 END) AS missing_income
FROM mart.v_metro_year_rpp;
