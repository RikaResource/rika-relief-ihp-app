

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.admins DISABLE TRIGGER ALL;



ALTER TABLE public.admins ENABLE TRIGGER ALL;


ALTER TABLE public.blog_posts DISABLE TRIGGER ALL;

INSERT INTO public.blog_posts (id, title, body, tags) VALUES ('870f4700-ee6a-4f5c-acf4-da274b4104ee', 'Test Blog Post ', 'This is to the test the basic functioning of the block.', '{testing," Nothing"," Being"}');
INSERT INTO public.blog_posts (id, title, body, tags) VALUES ('35ee846c-4407-446a-853e-10e4621ba618', 'This had to be filled!', 'This tests if validation is working ', '{hello," validation"}');


ALTER TABLE public.blog_posts ENABLE TRIGGER ALL;


ALTER TABLE public.schema_migrations DISABLE TRIGGER ALL;

INSERT INTO public.schema_migrations (revision) VALUES (1673581470);
INSERT INTO public.schema_migrations (revision) VALUES (1673625988);
INSERT INTO public.schema_migrations (revision) VALUES (1673632810);
INSERT INTO public.schema_migrations (revision) VALUES (1673633118);


ALTER TABLE public.schema_migrations ENABLE TRIGGER ALL;


ALTER TABLE public.users DISABLE TRIGGER ALL;



ALTER TABLE public.users ENABLE TRIGGER ALL;


