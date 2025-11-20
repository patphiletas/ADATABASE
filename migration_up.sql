
CREATE TYPE resource_type_enum AS ENUM ('guide', 'video', 'exercice', 'projet');

CREATE TABLE themes (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    update_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE skills (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL 
);

CREATE TABLE resources (
    id SERIAL PRIMARY KEY,
    type resource_type_enum NOT NULL,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    url TEXT NOT NULL,
    is_ada BOOLEAN DEFAULT FALSE,
    theme_id INTEGER REFERENCES themes(id),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    update_at TIMESTAMPTZ DEFAULT NOW()
);


CREATE TABLE resources_skills (
    id SERIAL PRIMARY KEY,
    resources_id INTEGER REFERENCES resources(id),
    skills_id INTEGER REFERENCES skills(id)
);