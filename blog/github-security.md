---
blog-date: 2018-05-11
blog-title: GitHub Security
disqus-page-url: http://linluk.github.io/blog/github-security
disqus-page-identifier: linluk.github.io/blog/github-security
---


*Due to the latest security issue github I rethought my workflow on working with
it. I switched from username/password to ssh key for my repositories. This blog
post is about setting up ssh keys with github.*


##Motivation and Goal

I was lazy, too lazy to learn how to use [GitHub](https://github.com/) with [SSH
Key](https://en.wikipedia.org/wiki/Secure_Shell) based authentication.  And I
was to lazy to update my muscle memory of my GitHub password every now and then.
When pushed to a repository I have always entered my password manually.

On May 1, 2018 GitHub sent out emails to some users that their passwords may has
been leaked to a small amount of GitHub employees
[1](https://www.bleepingcomputer.com/news/security/github-accidentally-recorded-some-plaintext-passwords-in-its-internal-logs/).

I was not affected (at least I have not received an email) but the incident made
me rethink my workflow with my GitHub repositories. I decided to learn about SSH
keys and how to use it to authenticate with my GitHub repositories. My main
goals were to have a secure and simple to use git with GitHub via the command
line and have a long clumpsy unreadable but "secure" password which I can change
without having to retrain my muscle memory.


##The GitHub Help

My starting point was the [GitHub Help page](https://help.github.com/). They
recommend the following steps when setting up SSH keys for a repository.

1. Check for existing SSH keys
1. Generate anew SSH key and add it to the ssh-agent
1. Adding a new SSH key to your GitHub account
1. Test you SSH connection
1. Working with SSH key passphrases


##Let's get the Party started


###Check for existing SSH keys

###Generate anew SSH key and add it to the ssh-agent

###Adding a new SSH key to your GitHub account

###Test you SSH connection

###Working with SSH key passphrases

##Conclusion



<center>
*Have fun* :-)
</center>
<br/>





