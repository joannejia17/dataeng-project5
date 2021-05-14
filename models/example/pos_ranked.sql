SELECT borough_name, pos_pct, RANK() OVER (ORDER BY pos_pct DESC) AS pos_rank
FROM {{ref('ada_compliance_pct_by_borough')}} 
ORDER BY pos_rank 
