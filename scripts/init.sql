CREATE TABLE IF NOT EXISTS post (
    id                  SERIAL                      NOT NULL,
    theme               VARCHAR(100)                NULL,
    summary             TEXT                        NULL,
    content             TEXT                        NULL,
    data                TIMESTAMP WITH TIME ZONE    NULL,
    likes_count         INT4                        NULL DEFAULT 0,
    dislikes_count      INT4                        NULL DEFAULT 0,
    author              VARCHAR(50)                 NULL,
    CONSTRAINT PK_POST PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS file (
    id                  SERIAL                      NOT NULL,
    post_id             INT4                        NOT NULL,
    type                VARCHAR(15)                 NULL,
    status              VARCHAR(15)                 NULL,
    file_path           VARCHAR(150)                NULL,
    CONSTRAINT PK_FILE PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS file
    ADD CONSTRAINT FK_post_file FOREIGN KEY (post_id)
        REFERENCES post (id)
        ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE IF NOT EXISTS comment (
    id                  SERIAL                      NOT NULL,
    post_id             INT4                        NOT NULL,
    author              VARCHAR(50)                 NULL,
    data                TIMESTAMP WITH TIME ZONE    NULL,
    content             TEXT                        NULL,
    likes_count         INT4                        NULL DEFAULT 0,
    dislikes_count      INT4                        NULL DEFAULT 0,
    CONSTRAINT PK_COMMENT PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS comment
    ADD CONSTRAINT FK_post_comment FOREIGN KEY (post_id)
        REFERENCES post (id)
        ON DELETE RESTRICT ON UPDATE RESTRICT;
