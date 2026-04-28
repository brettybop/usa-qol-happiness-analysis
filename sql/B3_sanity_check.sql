SELECT
  MIN([year]) AS min_year,
  MAX([year]) AS max_year,
  MIN(linecode) AS min_linecode,
  MAX(linecode) AS max_linecode,
  COUNT(*) AS total_rows
FROM stg.v_rpp_long_msa;
