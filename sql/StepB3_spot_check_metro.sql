SELECT TOP 50 *
FROM stg.v_rpp_long_msa
WHERE cbsa_code = '10180'  -- Abilene
ORDER BY linecode, [year];
