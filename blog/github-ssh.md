---
blog-date: 2018-05-14
blog-title: GitHub via SSH
keywords:
- github
- ssh
- authentication
- password
- passphrase
disqus-page-url: http://linluk.github.io/blog/github-ssh
disqus-page-identifier: linluk.github.io/blog/github-ssh
---


*Due to the latest security issues at github I wanted to change my password but
don't wanted to retrain my muscle memory to remember a new password.
I switched from username/password to ssh key authentication when using git via
command line. This blog post is about setting up ssh keys for github.*


Motivation and Goal
-------------------

I was lazy, too lazy to learn how to use [GitHub](https://github.com/) with [SSH
key](https://en.wikipedia.org/wiki/Secure_Shell) based authentication.  And I
was to lazy to update my muscle memory of my GitHub password every now and then.
When pushed to a repository I have always entered my password manually.

On May 1, 2018 GitHub sent out emails to some users that their passwords may has
been leaked to a small amount of GitHub employees
[[1]](https://www.bleepingcomputer.com/news/security/github-accidentally-recorded-some-plaintext-passwords-in-its-internal-logs/).

I was not affected (at least I have not received an email) but nevertheless I
wanted to change my GitHub password. I decided to learn about SSH keys and how
to use it to authenticate with my GitHub account. My main goal is to have a
long clumpsy unreadable but "secure" password for my GitHub account but still
use my old password when using git via command line.


Let's get the Party started
---------------------------

At first we have to create a ssh key pair.

Generating a new key pair is a simple command with some options.
I want to create an RSA key with 4096 Bits length. That's what the options `-t
rsa` and `-b 4096` mean. With `-f ~/.ssh/github_rsa` we specify the file where
*ssh-keygen* should save the private key and with `-C "my.email@example.com"` I
specify the email address of my GitHub account as the keys comment.

The command will prompt for a passphrase. [Here](http://www.useapassphrase.com/)
you can find out how to create a secure passphrase. I was lazy and just used my
old GitHub password (the one I had before writing this blog post). IMHO it is
secure enough because nobody should have access to my private key.

```
 $ ssh-keygen -t rsa -b 4096 -C "my.email@example.com.com" -f ~/.ssh/github_rsa
Generating public/private rsa key pair.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/linluk/.ssh/github_rsa.
Your public key has been saved in /home/linluk/.ssh/github_rsa.pub.
The key fingerprint is:
SHA256:Fb5N1T0IKi8JGjmXKcWDAmkDhxvDfegCgkaTu86rABE my.email@example.com
The key's randomart image is:
+---[RSA 4096]----+
| E = ++o o++     |
|O * o +o+oo      |
| * + +. .+ + 9   |
|* o=     o ++h   |
|o  p    S    h   |
| \ /    v  __/   |
|  v    v   //    |
|  vv  v          |
|   vvv           |
+----[SHA256]-----+
```

If everything was successful you should find two new files in your *~/.ssh*
directory.

```
 $ ls ~/.ssh/
github_rsa  github_rsa.pub
```

Now we are ready to upload the newly created public key to our GitHub account.
Navigate to *SSH and GPG keys* of your GitHub settings page (or use this
[link](https://github.com/settings/keys)). Here we can copy and paste
the content of the file *github_rsa.pub* and give it a title. GitHub will ask
us for your password.

Lets test the uploaded key! This is simple as trying to open a ssh session to
*git@github.com* and see if it welcomes us with our GitHub user name. The
command will generate a warning on first attempt wich should be no problem, but
you should double check the fingerprint of github.com.

```
 $ ssh git@github.com
The authenticity of host 'github.com (192.30.253.112)' can't be established.
RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'github.com,192.30.253.112' (RSA) to the list of known hosts.
PTY allocation request failed on channel 0
Hi linluk! You've successfully authenticated, but GitHub does not provide shell access.
Connection to github.com closed.
```

If you see the line *Hi USERNAME! You've successfully authenticated, but GitHub
does not provide shell access.* everything is fine and you are able to
authenticate via your ssh key.

You can `git clone` a repository with a ssh link. You will find a repositories
ssh link either via the web interface (click *Clone or Download* and than *Use
SSH*) or simply build it yourself. GitHub ssh links are in the format
`git@github.com:USERNAME/REPOSITORY.git`. For example with the command:

```
 $ git clone git@github.com:linluk/my-dot-files.git
```

You can also update the remote url of an existing repository to its ssh link
using this `git remote set-url`. For example with the command:

```
 $ git remote set-url origin git@github.com:linluk/my-dot-files.git
```

When pushing git will prompt for your passphrase and authenticate with your
GitHub account using ssh.



Conclusion
----------

Just few minutes of work and we have set up an ssh key to authenticate on
GitHub. This allows us to have a strong password for your account which you
don't need to remember. (If you use a password manager, what you definitely
should!) But still can use an easy to remember passphrase when pushing via
command line.


<center>
*Have fun* :-)
</center>
<br/>

