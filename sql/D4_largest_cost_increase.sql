SELECT TOP 15 cbsa_code, metro_name, rpp_change, housing_change, value_change
FROM mart.v_metro_delta_2019_2023
ORDER BY rpp_change DESC;
