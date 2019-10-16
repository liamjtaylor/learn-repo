FROM davidgasquez/dbt:0.10.0

COPY . /dbt

CMD ["dbt", "run", "--profiles-dir", "profile"]
