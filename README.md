# Let's Collab

# INSTALLATION INSTRUCTIONS:

1. Upload a copy of the site files and folders as found in the git repo https://github.com/rachelpac/letscollab to the local root directory of your local web server (MAMP or WAMP etc.) OR to the root directory (public_html folder) of your hosting environment
2.	Create a database, add a user and set privileges using MySQL Databases in the C-Panel of the hosting environment OR phpMyAdmin of your local web server
3.	Import a copy of the database file letscollab.sql found at in the /api/sql folder to the database created in  phpMyAdmin
4.	Add localhost or your site domain to the CheckRefer() function by editing the ses.php file found in the /api folder 
5. Update the fetch request URLS to match your site domain or localhost. 
6.	Change the database name, user and password to the credentials you created above by editing the credentials in the database connection object found in the file db.php in the /api folder 
7.	Access the site on your local web server or live on the domain

# TECHNOLOGIES

Materalize - Version 1.0.0, implemented using CDN and installed via npm as the layout framework

React - Version 17.0.1, implemented via npm using create-react-app as the front end framework for the admin pages

PHP - Version 7.4.12, implemented in the API code
 
HTML, CSS, and JS implemented in additional code added to front end 

# NAVIGATING THE APP 
Browse Collaborations - All users can browse started collaborations 

Start Collaborations - Registered user accounts can start collaborations

SignUp/ Login - Registered users can log in and unregistered users can sign up 

My Collaborations - Registered users can view collaboration they have started or joined

My Profile - Registered users can view their profiles

Settings - All users can changes settings 

# CREDENTIALS:

username: testuseracc
password: Testuseraccpass1!