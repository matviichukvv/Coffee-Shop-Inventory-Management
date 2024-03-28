-- For Orders Activity Dashboard
select 
o.order_id, 
i.item_price,
i.item_cat,
i.item_name,
o.created_at, 
o.in_or_out
from orders o
left join items i 
	on o.item_id = i.item_id;

-- For Inventory Menage Dashboard
select 
    s2.ing_name,
    s2.ordered_weight,
    ing.ing_weight*inv.quantity as total_inv_weight,
    (ing.ing_weight*inv.quantity)-s2.ordered_weight as remaining_weight
from (select
    ing_id,
    ing_name,
    sum(ordered_weight) as ordered_weight 
from 
    stock
    GROUP BY ing_name, ing_id) as s2
left join inventory inv 
    on inv.ing_id = s2.ing_id
left join ingredients ing 
    on ing.ing_id = s2.ing_id;

-- For Staff Dashboard
SELECT 
    ro.date,
    st.first_name,
    st.last_name,
    st.sal_per_hour,
    sh.start_time,
    sh.end_time,
    ((hour(timediff(sh.end_time, sh.start_time))*60)+(minute(timediff(sh.end_time, sh.start_time))))/60 as hours_in_shift,
    ((hour(timediff(sh.end_time, sh.start_time))*60)+(minute(timediff(sh.end_time, sh.start_time))))/60 *st.sal_per_hour as staff_cost
FROM rota ro
left join staff st 
    on ro.staff_id = st.staff_id
left join shift sh 
    on ro.shift_id = sh.shift_id;