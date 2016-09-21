# CSD-2323 Assignment 2

This set of files includes everything you need to place a basic LAMP application
on your server. Follow the steps below to install this in a CentOS 7 system.

For other systems (eg- Ubuntu, Debian, Arch, etc...) refer to the specific
distribution's documentation for default file locations.



## Installing Apache Web Server

In a terminal, execute the command:

```bash
sudo yum install httpd
```

This installs the HTTP Daemon (Apache Web Server).

To turn on the Apache Web Server execute:

```bash
sudo systemctl start httpd
```

The default location for Apache to read from is `/var/www/html`. If you place a
basic HTML file there as `index.html`, you will see the contents of this file
by navigating to [http://localhost](http://localhost). Open a text editor with:

```bash
sudo nano /var/www/html/index.html
```

If `nano` is not installed, install it with `sudo yum install -y nano`

And input the following text, then save and quit:

```html
<!DOCTYPE html>
<html>
<head>
  <title>Hello World</title>
</head>
<body>
  <h1>Hello World!</h1>
  <p>Welcome to Apache Web Server. My name is ...</p>
</body>
</html>
```

When you navigate to [http://localhost](http://localhost) from a web browser
on the server, you should see the Hello World message.



## Installing MySQL/MariaDB Database System

In a terminal, execute the command:

```bash
sudo yum install mariadb-server
```

This installs the MariaDB Database System.

To turn on the database system, execute the command:

```bash
sudo systemctl start mariadb
```

By default, your MariaDB system is not super secure. There are some basic steps
you can take to secure it. These are automated by running a command:

```bash
mysql_secure_installation
```

During this process, you will be asked to set your database *root* password. Do
not forget this password. It is annoying to change later.

Once you've set your root password, you can run:

```bash
mysql -u root -p
```

This will open the `mysql` (MariaDB) command line tool, that allows you to run
commands against the live running database. It will ask for your password.

The commands you want to run are all in the attached `assign2.sql` file. The
easiest way for you to run these commands is to paste them into your terminal
window at the MySQL command prompt. There are other effective ways too.

At the end of the commands, you should receive good results from executing:

```sql
SELECT * FROM assign2.personal;
```

You can use `exit` to leave the MySQL Command Prompt.



## Installing PHP Hypertext Preprocessor

To install PHP into the system execute:

```bash
sudo yum install php php-mysql
```

While this will install PHP, it will not turn it on. PHP is an Apache module,
so Apache needs to be restarted for PHP to be usable on the web server.

```bash
sudo systemctl restart httpd
```

You can now create a PHP file in a publicly accessible folder, and use it to
create dynamic web pages. Create a basic file with:

```bash
sudo nano /var/www/html/phpinfo.php
```

And enter into that file one simple line:

```php
<?php phpinfo(); ?>
```

When you save and quit, you should be able to navigate to
[http://localhost/phpinfo.php](http://localhost/phpinfo.php) and see a long list
of PHP configuration options in your web browser.

We want to use a slightly more interesting application, so we're going to place
a more robust PHP file into the `/var/www/html` folder and execute it.

Run the following commands to delete the existing files and grab a new one from
this GitHub repository using `wget`, an excellent file retrieval tool. We must
delete the existing `index.html` file so that our new `index.php` file is the
new default page when you navigate to the web server.

```bash
cd /var/www/html
sudo rm index.html
sudo wget https://raw.githubusercontent.com/LenPayne/CSD2323-Assign2/master/index.php
```

When this is completed, you should be able to navigate to [http://localhost](http://localhost)
from a web browser on the Linux machine, and see a table of all entries in the
MySQL Database Table we built.

Take a *screenshot* of this page in your web browser, and submit it to D2L.

![Sample Screenshot](https://github.com/LenPayne/CSD2323-Assign2/raw/master/finished-screencap.png)


## Optional Challenges for You to Explore

1. Add some more information to the database table.
2. Add some more styling to the PHP page.
3. Navigate to the web page from your host (Windows) machine's web browser.
