[[ $@ ]] || {
    printf "Usage\n\t./$0 <server> <from_email> <to_email> <subjet> <data>\n"
    exit 1
}
{
    sleep 1
    echo "helo pepe"
    sleep 0.5
    echo "mail from:$2"
    sleep 0.5
    echo "rcpt to:$3"
    echo
    echo "subject : $4"
    echo
    echo "DATA"
	echo "From: $2"
	echo "To: $3"
	echo "Subject: $4"
    echo "$5"
    echo "."
} | telnet $1 25 |
    grep -q "Unknown user" &&
    echo "Invalid email" ||
    echo "Valid email"
