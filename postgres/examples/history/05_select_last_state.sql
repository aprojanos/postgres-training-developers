INSERT INTO current_states (object_id, state, updated_at, user_id, product_id, status) 
SELECT DISTINCT ON (object_id)
    object_id,
    state,
    updated_at,
    user_id,
    product_id,
    'active'
FROM
    history_states
ORDER BY object_id, updated_at DESC;


SELECT c.object_id, c.state AS current_state, c.updated_at current_update, h.state AS previous_state, h.updated_at previous_update
FROM current_states c
LEFT JOIN LATERAL (
    SELECT state, updated_at 
    FROM history_states h 
    WHERE h.object_id = c.object_id 
    ORDER BY updated_at DESC 
    LIMIT 1 OFFSET 1
) h ON true;


SELECT * FROM (
    SELECT
        *,
        rank() OVER (PARTITION by object_id ORDER BY updated_at desc) AS rank_value
    FROM history_states
) AS a
WHERE rank_value = 2;
