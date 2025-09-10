set search_path=public;
DROP TABLE IF EXISTS departments CASCADE;
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department_id INT REFERENCES departments(department_id) ON DELETE SET NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS user_department_idx ON users (department_id);


DROP TABLE IF EXISTS categories CASCADE;
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    parent_id INT REFERENCES categories(category_id) ON DELETE SET NULL
);

CREATE INDEX IF NOT EXISTS category_parent_idx ON categories (parent_id);

DROP TABLE IF EXISTS products CASCADE;
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    category_id INT NOT NULL REFERENCES categories(category_id) ON DELETE SET NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    CONSTRAINT product_category_fk FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE INDEX IF NOT EXISTS product_category_idx ON products (category_id);


DROP TABLE IF EXISTS current_states CASCADE;
CREATE TABLE IF NOT EXISTS current_states (
    object_id BIGINT NOT NULL PRIMARY KEY,
    state JSONB,
    updated_at TIMESTAMP WITHOUT TIME ZONE,
    user_id INT NOT NULL,
    product_id INT NOT NULL REFERENCES products(product_id) ON DELETE SET NULL,
    status VARCHAR(50) NOT NULL,

    CONSTRAINT current_states_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE INDEX IF NOT EXISTS current_object_id_idx ON current_states (object_id);

DROP TABLE IF EXISTS history_states CASCADE;
CREATE TABLE history_states (
    history_id BIGSERIAL PRIMARY KEY,
    object_id BIGINT NOT NULL,
    state JSONB NOT NULL,
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    user_id INT NOT NULL,
    product_id INT NOT NULL REFERENCES products(product_id) ON DELETE SET NULL,
    status VARCHAR(50) NOT NULL,

    -- Foreign keys
    CONSTRAINT history_states_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Indexes for optimization
CREATE INDEX IF NOT EXISTS history_object_idx ON history_states (object_id);
CREATE INDEX IF NOT EXISTS history_updated_at_idx ON history_states (updated_at DESC);
CREATE INDEX IF NOT EXISTS history_user_idx ON history_states (user_id);
CREATE INDEX IF NOT EXISTS history_product_idx ON history_states (product_id);
CREATE INDEX IF NOT EXISTS history_status_idx ON history_states (status);



