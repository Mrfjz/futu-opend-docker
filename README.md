# futu-opend-docker
Start FutuOpenD as daemon with docker.

## Usage

Set login account and login password md5 in environment variables.
```
export LOGIN_ACCOUNT=YOUR_LOGIN_ACCOUNT
export LOGIN_PWD_MD5=YOUR_LOGIN_PWD_MD5
```
(You might generate the password md5 on https://www.md5hashgenerator.com, if the password is '123456', the md5 hash is 'e10adc3949ba59abbe56e057f20f883e')


Build image and start container.
```
docker-compose build
docker-compose up -d
```

Execute an interactive bash shell on the container
```
docker exec -it futu-opend bash
```

Start FutuOpenD and Verify with sms 
```
./verify-with-sms.sh
```

You should receive a verification code on the phone, type
> input_phone_verify_code -code=YOUR_VERIFICATION_CODE

and press enter, if there is no error, type 
> exit

to exit, since we would like the FutuOpenD to run as a daemon.

Finally, Start FutuOpenD as a daemon and exit the container.
```
./start-futu-opend-daemon.sh
exit
```
