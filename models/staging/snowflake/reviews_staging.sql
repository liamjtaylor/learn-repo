{{ config(materialized='table') }}

with

  source as (
    select * from {{source('airbnb','reviews')}}
  )

select
  ID,
  REVIEWER_NAME,
  DATE,
  REVIEW,
  COMMENTS,
  LISTING_ID
from source
