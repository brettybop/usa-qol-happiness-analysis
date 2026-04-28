SELECT
  cbsa_code, metro_name, [year],
  rpp_all_items_index, rpp_housing_index, rpp_goods_index, rpp_other_services_index
FROM mart.v_metro_year_rpp
WHERE cbsa_code = '31080'
  AND [year] IN (2019, 2023)
ORDER BY [year];
