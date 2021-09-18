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
You should see something like
>Need a phone verification code\
>req_phone_verify_code\
>Requesting a phone verification code\
>Request a phone verification code successfully\
>Command tips: input_phone_verify_code -code=123456\
> &gt;&gt;&gt;

You should receive a verification code on the phone, enter the code
> &gt;&gt;&gt;input_phone_verify_code -code=YOUR_VERIFICATION_CODE

and press enter, if there is no error, type 
> exit

to exit, since we would like to run FutuOpenD as a daemon.

Finally, Start FutuOpenD as a daemon and exit the container.
```
./start-futu-opend-daemon.sh
exit
```
