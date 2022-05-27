# Mule server in Docker project

Project Mule in Docker


### To configure Heroku and Deploy

1. Install Heroku CLI https://devcenter.heroku.com/articles/heroku-cli
2. Login in and to create an app - in browser
3. You must also log in through the terminal on heroku to run the commands ``heroku login``
4. Need to run this command to register your repository in heroku repository ``heroku git:remote -a NAME_APP_HEROKU``
5. Set up container config ``heroku stack:set container``
6. More set up ``heroku labs:enable runtime-dyno-metadata``
7. For more logs ``heroku labs:enable log-runtime-metrics``
8. **IMPORTANT** ``In addition to the application jar, the domain jar will be required.``
9. To push changes to your code from your repository, use this command ``git push heroku main``
10. Scale dyno ``heroku ps:scale web=1:performance-m``
