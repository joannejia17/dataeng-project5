SELECT country, country_subdivision_primary, advertiser_id, advertiser_name, spend_usd, RANK() OVER (ORDER BY spend_usd DESC) AS spend_rank
FROM `plexiform-brand-313218.google_political_ads_copy.advertiser_geo_spend`
ORDER BY spend_usd DESC, spend_rank ASC
