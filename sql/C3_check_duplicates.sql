SELECT cbsa_code, [year], COUNT(*) AS cnt
FROM mart.v_metro_year_rpp
GROUP BY cbsa_code, [year]
HAVING COUNT(*) > 1;
