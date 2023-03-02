# RikaRelief Web App

## Web App Features

The app mainly consists of three main components; The map and dynamics view, the information window and the navigation bar. It also consists of the a user
window (button) and the app icon (which could also serve as a 'home' button).

## Development notes

### Web page for organization

This is different from the webapp as this provides information about the organization, the webapp provides the desired functionality for the organization.

#### 13 Jan 2023

Made a simple landing page with the logo and a button that redirects to the github organization. (as of this commit)

Notable isssues:

    - Dark mode missing.
    - The page is not responsive.
    - The nav bar has deal links.
    - The overall style needs to be imporoved.
    - The page content may need to be changed to fit better.

#### 21 Jan 2023

Added the BlogPost scafolding, this includes:

- The Actions for creating new blog posts
- The Views for viewing the blogPosts and the comments associated
- The Controllers for the BlogPosts and the Comments.
- Also this is a sort of continuation to the other stuff on deploying to shipnix and some fiddling with authentication (which doesn't work as exprected)

This opens up the direction for ensuring only the admins can add blogposts and comments are added by anyone really.

Here are some of the things we need to in the next coding session:

- Complete the authentication both for the admins and other users.
- Move the createPost and EditPosts to the Admin app (Maybe we just need to import the relavant modules)
- Look at some of the other issues opened the other time.
- The tags look like shit, need to fix that.
- Redesign the entire blog page to match the overall aesthetic of the page.
- Design an admin page, both in the visuals only and also the html and css part (Mostly thinking of flex box and some forms)

#### 27 Jan 2023

Some ideas On Admin management:

- To keep the creation of Admin accounts to few people, we'll have a key system where there will be a zeroth admin who will then invite other admins who
  can then generate other keys to invite other admins. The set of keys an admin can create is limited.
- Changed the blog page to mostlty be modifiable through the admin application.
- Made some responsive tweaks.

### 8 Feb 2023

Some idea on the core and app interface:

There was this notion of using tags to display the inner semantics of the core to the web front-end. It's like the tags are a symbolic representation
(Kinda like the show instance) of structures in the core. There could be an automated representation generation system but that's subject to more thought
on how the core and the web app communicate.

### 15 Feb 2023

- Made some chnages to the blog page to dispaly the posts list in a pleasing way (go cards!!).
- A bug with getting some entries from the d.b (Maybe has to do with foreign keys...).
- Fixed the weird bug with the nav bar shrinking.
- The nav bar still behaves weirdly in smaller screens.
- Found a library for the map... looks promising (Might have to work with npm, hope nix won't be a fritz).
- Need to work faster, the drought is really killing!!!
