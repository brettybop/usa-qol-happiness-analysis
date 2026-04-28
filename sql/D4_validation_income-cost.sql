SELECT TOP 10 *
FROM mart.v_metro_year_segment
WHERE [year] = 2023 AND segment = 'High Income / Low Cost'
ORDER BY value_index_simple DESC;
