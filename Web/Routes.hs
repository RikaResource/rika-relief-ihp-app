module Web.Routes where
import IHP.RouterPrelude
import Generated.Types
import Web.Types

-- Generator Marker
instance HasPath StaticController where
    pathTo WelcomeAction = "/home"
    pathTo AboutAction   = "/about"
    pathTo ContactAction = "/contact"

instance CanRoute StaticController where
    parseRoute' = 
        (string "/home" <* endOfInput >> pure WelcomeAction)
        <|> (string "/about" <* endOfInput >> pure AboutAction)
        <|> (string "/contact" <* endOfInput >> pure ContactAction)

instance AutoRoute BlogPostsController

instance AutoRoute CommentsController

