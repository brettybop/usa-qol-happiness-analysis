# tableau-sql-world-happiness-project
World Happiness × Cost of Living: Postgres views + Tableau dashboards highlighting trends, drivers, and best value countries.

# Project Structure
```
/data/raw/               (zips + extracted CSVs; don’t commit huge files if massive)
/sql/
  00_setup.sql
  01_raw_load_notes.md   (or .sql if using BULK INSERT)
  02_staging.sql
  03_dimensions.sql
  04_facts.sql
  05_mart_views.sql
  06_quality_checks.sql
/tableau/
  usa_qol.twbx
README.md
```
