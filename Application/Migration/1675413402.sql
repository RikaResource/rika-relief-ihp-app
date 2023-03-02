ALTER TABLE blog_posts DROP COLUMN post_teaser;
ALTER TABLE blog_posts ADD COLUMN blog_post_teaser TEXT DEFAULT '';
