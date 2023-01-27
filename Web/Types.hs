module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController 
    = WelcomeAction
    | AboutAction
    | ContactAction deriving (Eq, Show, Data)

data BlogPostsController
    = BlogPostsAction
    | ShowBlogPostAction { blogPostId :: !(Id BlogPost) }
    deriving (Eq, Show, Data)

data CommentsController
    = CommentsAction
    | NewCommentAction { blogPostId :: !(Id BlogPost)}
    | ShowCommentAction { commentId :: !(Id Comment) }
    | CreateCommentAction
    | EditCommentAction { commentId :: !(Id Comment) }
    | UpdateCommentAction { commentId :: !(Id Comment) }
    | DeleteCommentAction { commentId :: !(Id Comment) }
    deriving (Eq, Show, Data)
