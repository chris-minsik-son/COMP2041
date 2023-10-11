#!/bin/dash

if test "$#" -eq 0
then
    echo "No image has been added to the email draft"
    exit 1
fi

for image in "$@"
do
    echo "You have selected the image $image to send"
    echo "Address to e-mail this image to?"
    read email
    if test -z "$email"
    then
        echo "No email address has been selected"
        echo "No email sent"
        exit 1
    fi

    echo "Message to accompany image?"
    read message
    if test -z "$message"
    then
        echo "No message added to the email draft"
    fi
    echo "$message" | mutt -a "$image" -- "$email"
    echo "$image sent to $email\n"
done