#!/usr bash

#Simple Parser for input.txt
for i in `cat input.txt`;do user=`echo "$i"|cut -d: -f1`; role=`echo "$i"|cut -d: -f2`; filename=`echo "$i"|cut -d: -f3`; remotebucket=`echo "$i"|cut -d: -f4`;done

ssh kyle@127.0.0.1 -p 2222 'bash -s' <<-ENDSSH
if id -u "$user" >/dev/null 2>&1; then
  echo "user $user exists!"
else
  echo "user does not exist!"
  echo "creating user..."
  cd ..
  useradd -m "$user"
fi

#Checking if remote bucket exists
if [ -d "$remotebucket" ]; then
    echo "remote bucket $remotebucket exists!"
else
    echo "remote bucket $remotebucket does not exist!"
    echo "creating remote bucket.."
    mkdir $remotebucket
    echo "remote bucket $remotebucket created!"
fi
exit
ENDSSH
#scp transfer and ssh back into VM to adjust permissions
scp -P 2222 /Users/kylebush/Desktop/$filename $user@127.0.0.1:$remotebucket$filename
ssh kyle@127.0.0.1 -p 2222 "chmod u+$role $remotebucket$filename"