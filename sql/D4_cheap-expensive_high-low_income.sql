USE usa_qol;
GO

CREATE OR ALTER VIEW mart.v_metro_year_segment AS
WITH yr_medians AS (
    SELECT
        [year],
        median_rpp = PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY rpp_all_items_index)
            OVER (PARTITION BY [year]),
        median_income = PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY real_per_capita_income_2017)
            OVER (PARTITION BY [year])
    FROM mart.v_metro_year_rpp
)
SELECT
    r.cbsa_code,
    r.metro_name,
    r.[year],
    r.rpp_all_items_index,
    r.real_per_capita_income_2017,
    r.value_index_simple,

    segment =
      CASE
        WHEN r.rpp_all_items_index <= m.median_rpp AND r.real_per_capita_income_2017 >= m.median_income THEN 'High Income / Low Cost'
        WHEN r.rpp_all_items_index >  m.median_rpp AND r.real_per_capita_income_2017 >= m.median_income THEN 'High Income / High Cost'
        WHEN r.rpp_all_items_index <= m.median_rpp AND r.real_per_capita_income_2017 <  m.median_income THEN 'Low Income / Low Cost'
        ELSE 'Low Income / High Cost'
      END

FROM mart.v_metro_year_rpp r
JOIN (
    SELECT DISTINCT [year], median_rpp, median_income
    FROM yr_medians
) m
  ON m.[year] = r.[year];
GO
