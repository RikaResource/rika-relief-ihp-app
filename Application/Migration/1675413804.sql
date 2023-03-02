ALTER TABLE blog_posts ALTER COLUMN author SET NOT NULL;
ALTER TABLE blog_posts DROP COLUMN blog_post_teaser;
ALTER TABLE blog_posts ADD COLUMN post_teaser TEXT NOT NULL;
