CREATE OR REPLACE PROCEDURE generate_users(
    total_users BIGINT -- Number of users to generate
)
LANGUAGE plpgsql
AS $$
DECLARE
    i BIGINT; -- Loop counter
BEGIN
    RAISE NOTICE 'Starting user generation for % users.', total_users;

    TRUNCATE TABLE users CASCADE;

    FOR i IN 1..total_users LOOP
        INSERT INTO users (name, email, created_at)
        VALUES (
            'user_' || i, -- Generate unique username
            'user_' || i || '@example.com', -- Generate unique email
            current_timestamp -- Use current timestamp for creation time
        );
    END LOOP;
    
    -- set department randomly
    UPDATE users SET department_id = CEIL(RANDOM()*10);

    RAISE NOTICE 'User generation completed for % users.', total_users;
END;
$$;
CALL generate_users(100000); 
