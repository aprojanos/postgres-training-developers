CREATE OR REPLACE PROCEDURE generate_history_states(
    object_ids INT = 200000,
    num_days INT = 100
)
LANGUAGE plpgsql
AS $$
DECLARE
    start_date DATE;
    end_date DATE;
    curr_date DATE;
    curr_product_id INT := 1;
    curr_user_id INT := 1;
    chunk_size INT := 100000.0;
    num_chunks INT;
    max_poduct_id INT;
    max_user_id INT;
    c INT;
    start_time TIMESTAMP := NOW(); -- Start time for logging
BEGIN

    TRUNCATE TABLE history_states;
    
    SELECT MAX(product_id) INTO max_poduct_id FROM products;
    SELECT MAX(user_id) INTO max_user_id FROM users;

    start_date := make_date(extract(year FROM now())::integer - 1, 1, 1);        
    end_date := start_date + num_days -1;
    num_chunks := CEIL(object_ids::NUMERIC / chunk_size);    

    RAISE NOTICE 'Starting data generation from % to %, chunks: %, at %', start_date, end_date, num_chunks, start_time;

    FOR curr_date IN SELECT generate_series(start_date::TIMESTAMP, end_date::TIMESTAMP, '1 day') LOOP
        FOR c IN 1 .. num_chunks LOOP
            
            INSERT INTO history_states (object_id, state, updated_at, product_id, user_id, status)
            SELECT 
                obj_id,
                jsonb_build_object('key', 'value') AS state, -- Dummy JSON state
                curr_date,
                curr_product_id,
                curr_user_id,
                'archived'
            FROM generate_series((c-1) * chunk_size, least(c*chunk_size -1, object_ids)) AS obj_id;
            
            curr_product_id := curr_product_id + 1;
            IF curr_product_id > max_poduct_id THEN
                curr_product_id := 1;
            END IF;

            curr_user_id := curr_user_id + 1;
            IF curr_user_id > max_user_id THEN
                curr_user_id := 1;
            END IF;

        END LOOP;
        RAISE NOTICE 'Inserted date %', curr_date;
    END LOOP;

    RAISE NOTICE 'Data generation completed in % seconds', EXTRACT(SECOND FROM current_timestamp - start_time);
END;
$$;
CALL generate_history_states(200000, 100);