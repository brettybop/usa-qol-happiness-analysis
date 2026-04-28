SELECT TOP 5 cbsa_code, metro_name, [year], rpp_all_items_index, real_per_capita_income_2017, value_index_simple
FROM mart.v_metro_year_rpp
ORDER BY value_index_simple DESC;
