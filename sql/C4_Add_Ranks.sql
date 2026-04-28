CREATE OR ALTER VIEW mart.v_metro_year_rpp_ranked AS
SELECT
  *,
  rank_value = DENSE_RANK() OVER (PARTITION BY [year] ORDER BY value_index_simple DESC),
  rank_expensive = DENSE_RANK() OVER (PARTITION BY [year] ORDER BY rpp_all_items_index DESC),
  rank_real_income = DENSE_RANK() OVER (PARTITION BY [year] ORDER BY real_per_capita_income_2017 DESC)
FROM mart.v_metro_year_rpp;
GO
