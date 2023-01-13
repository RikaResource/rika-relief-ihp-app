module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data BlogPostsController
    = BlogPostsAction
    | NewBlogPostAction
    | ShowBlogPostAction { blogPostId :: !(Id BlogPost) }
    | CreateBlogPostAction
    | EditBlogPostAction { blogPostId :: !(Id BlogPost) }
    | UpdateBlogPostAction { blogPostId :: !(Id BlogPost) }
    | DeleteBlogPostAction { blogPostId :: !(Id BlogPost) }
    deriving (Eq, Show, Data)
