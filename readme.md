REST API AUTHENTICATION SYSTEM FOR HOPE RESEARCH GROUP ASSIGNMENT

REGISTER USER 

- Allows the user to register into the API using name, email, password and confirmed password

LOGIN USER 

- Allow the user to login provided the email and password match 

FORGOT PASSWORD 

- Sends an email to the concerned person whose email has been sent in the body of the Request
- Asks the user to send email id, old password, new password, confirm new password 
- checks whether email id exists and also matches the old password with the current user password 
- sends Error information or updates the password accordingly

RESET PASSWORD

- Sends an email to the concerned person whose email has been sent in the body o
- A token is generated for that particular email id 
- In the Reset password, checks the email id and the token attached to that email id with that 
of the link sent earlier 
- If they match changes the password otherwise shows errors 

Files used to make the above API 

1. api.php (Contains all the routes for the apis)
2. userController.php (For signup and login)
3. passwordForgotController.php (For implementation of Forgot Password)
4. passwordResetController.php (For implementation of Reset Password)

5. passwordForgotSendToUser.php (For sending email notification to concerned user)
6. passwordForgotDone.php (For sending email once the password is set)

7. passwordResetSendToUser.php (For sending email notification to concerned user)
8. passwordResetDone.php (For sending email once the password is reset)

9. passwordForgot.php (Model used for sending the email and token)
10. .env (For setting the db configuration and SMTP for mail)

DB name - authAPI



