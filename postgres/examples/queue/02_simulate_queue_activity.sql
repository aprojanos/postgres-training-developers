SET search_path TO deadtuples;

CREATE OR REPLACE FUNCTION simulate_queue_activity(iterations INT) RETURNS VOID AS
$$
DECLARE
    i INT;
    task_id INT;
BEGIN
    FOR i IN 1..iterations LOOP
        -- 1. Insert new queue items and process each returned ID individually
        FOR task_id IN 
            INSERT INTO queue (payload, status) 
            VALUES 
                (('{"task": "task_' || i || '"}')::JSONB, 'pending'),
                (('{"task": "task_' || (i+1) || '"}')::JSONB, 'pending'),
                (('{"task": "task_' || (i+2) || '"}')::JSONB, 'pending')
            RETURNING id
        LOOP
            -- 2. Simulate processing: update status to 'processing'
            UPDATE queue 
            SET status = 'processing'
            WHERE id = task_id;

            -- 3. Simulate completion: update status to 'completed'
            UPDATE queue 
            SET status = 'completed'
            WHERE id = task_id;
            -- 4. Delete some completed tasks to create dead tuples
            IF task_id % 2 = 0 THEN
                DELETE FROM queue WHERE id = task_id;
            END IF;
        END LOOP;
    END LOOP;
END;
$$ LANGUAGE plpgsql;