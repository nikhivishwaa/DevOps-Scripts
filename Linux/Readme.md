```
docker run -it ubuntu
```

###### list user
```
cat /etc/passwd
```

###### create user
```
useradd -m -p Admin@8000 myuser
```

###### login as myuser
```
su myuser
```

###### check current user
```
whoami
```

###### navigate to user home
```

cd
```

###### add myuser to sudo group `run by root or sudo priviledged user`
```
usermod -aG sudo myuser
```

###### logout from myuser
```
exit
```