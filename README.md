# futu-opend-docker

Start FutuOpenD with docker.

## Usage

1. Build image.
```
docker-compose build
```

2. Set login account and login password md5 in environment variables.
```
export LOGIN_ACCOUNT=YOUR_LOGIN_ACCOUNT
export LOGIN_PWD_MD5=YOUR_LOGIN_PWD_MD5
```
(You might generate the password md5 on https://www.md5hashgenerator.com, if the password is '123456', the md5 hash is 'e10adc3949ba59abbe56e057f20f883e')

3. Start container.
```
docker-compose up -d
```

4. Input the phone verify code, replace *YOUR_PHONE_VERIFY_CODE* with received phone verify code.
```
docker exec -it futu-opend bash -c "echo 'input_phone_verify_code -code=YOUR_PHONE_VERIFY_CODE' | telnet 127.0.0.1 22222"
```

5. Test if connection is ok
```
docker exec -it futu-opend python3 test_connection.py
```

Expected output:

>test connection pass