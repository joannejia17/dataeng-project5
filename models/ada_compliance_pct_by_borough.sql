select borough_name,(sum(positive)*100) / case when ((sum(negative)+sum(positive)) = 0) then 1 else (sum(negative)+sum(positive)) end as pos_pct
from {{ref('station_ada_compliance_status')}} 
    group by borough_name 