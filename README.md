## Dog app

set the envfiles:
```
####.env.development
ADMIN_EMAIL
DATABASE_USERNAME_DEVELOPMENT
DATABASE_PASSWORD_DEVELOPMENT
SMTP_SERVER_ADDRESS
SMTP_SERVER_PORT
SMTP_SERVER_DOMAIN
SMTP_SERVER_USER_NAME
SMTP_SERVER_PASSWORD
```

Start with 
```
foreman start -f Procfile.dev
```

live reload
first make sure you have this installed 
```
https://chromewebstore.google.com/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei?hl=en
```
then turn the extention on by clicking on it from the extentions area