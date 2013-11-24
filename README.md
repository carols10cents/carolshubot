# Hubot

This is a version of GitHub's Campfire bot, hubot. He's pretty cool. Carol uses
this code to run 2 bots: mathbot in TTM's hipchat rooms, and carolshubot, who
hangs out in #pghrb on freenode.

This version is designed to be deployed on [Heroku][heroku].

[heroku]: http://www.heroku.com

## Playing with Hubot

You'll need to install the necessary dependencies for hubot. All of
those dependencies are provided by [npm][npmjs].

[npmjs]: http://npmjs.org

Take a look at the scripts in the `./scripts` folder for examples.

### Testing Hubot Locally

Carol has chosen to use postgres (via pg-brain.coffee) instead of redis for storage because heroku's free postgres addon persists across restarts of the bot, while the free redis addon does not.

Running postgres locally is not required unless you want to test scripts that store information, like karma.coffee.

**Without postgres**, you can test your hubot by running the following.

    % bin/hubot

You'll see some start up output about where your scripts come from and some warnings, one of which will be that you didn't provide a DATABASE_URL, so you can't store anything. When the output stops, you are at a prompt, even though you may not see the "Hubot>" line at the end since the warnings printed after that.

    [Sun, 04 Dec 2011 18:41:11 GMT] INFO Loading adapter shell
    [Sun, 04 Dec 2011 18:41:11 GMT] INFO Loading scripts from /home/tomb/Development/hubot/scripts
    [Sun, 04 Dec 2011 18:41:11 GMT] INFO Loading scripts from /home/tomb/Development/hubot/src/scripts
    Hubot>

Then you can interact with hubot by typing `hubot help` (in this mode, the bot's name is "hubot" rather than "mathbot" or "carolshubot").

    Hubot> hubot help

    Hubot> animate me <query> - The same thing as `image me`, except adds a few
    convert me <expression> to <units> - Convert expression to given units.
    help - Displays all of the help commands that Hubot knows about.
    ...

Use control-c to quit.

**With postgres**, create a database in your local installation of postgres, then run this sql in that database to set up the tables:

    CREATE TABLE hubot (
      id CHARACTER VARYING(1024) NOT NULL,
      storage TEXT,
      CONSTRAINT hubot_pkey PRIMARY KEY (id)
    );
    INSERT INTO hubot VALUES(1, NULL);

Then start your hubot with a DATABASE_URL:

    $ DATABASE_URL=postgres://localhost:5432/your-database-name bin/hubot
