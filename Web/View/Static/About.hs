module Web.View.Static.About where
import Web.View.Prelude
-- import Application.Helper.View

data AboutView = AboutView

instance View AboutView where
    html AboutView = [hsx|
    <div class="About">
        {renderNavBar}
        <div class="AboutContentWrapper">
            <div class="AboutContent">
                <h1>About</h1>
                <div class="AboutParagraphWrapper">
                    <p class="AboutParagraph">
                    At <span>RikaRelief</span> we are building a computational artefact that will coordinate and track resources contributed by peers to help solve
                    resource related problems contributed by other peers. For instance; disaster related problems, e.g famine due to flooding.
                    </p>
                </div>
            </div>
        </div>
    </div>
    |]


-- The old about 
-- The idea behind <span>RikaRelief</span> is simple. It is driven by the question: <span>How does one solve relief problems using peers?</span> 
--                     One answer is RikaRelief. We have, on one hand, people (peers) who have resources they can contribute to the network of peers. These resources may include 
--                     capital, assets, time, skills, infrastructure and pretty much anything you can think of. Once available to the network these resources will then be used to solve specific 
--                     relief problems that other peers have 'contributed' to the network. This brings us to the other side where in essence people (peers) have a deficit of resources, this could be 
--                     a food shortage due to a drought, a housing shortage due to a flood and other disaster related problems. The role of the 'platform' is to provide ways 
--                     in which the resources available can be used to fill the needs created.    