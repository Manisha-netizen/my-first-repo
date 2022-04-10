#!/usr/bin/env bash
#File: guessinggame.sh

function guessinggame {
   num_lines=0
   ls -la > allresults.txt
   grep "^-" allresults.txt > fileresultsonly.txt
   let num_lines=$num_lines+$(cat fileresultsonly.txt | wc -l) # In order to detect the total number of files in the current directory only
}

function userprompting {
   response_chars_count=0
   echo "Can you guess how many files you have in your current directory? Enter any number 0 or greater"

   while [[ $response_chars_count -ge 0 ]]
   do
      read response
      let response_chars_count=$(echo $response | wc -w) # In order to detect for spaces only where they are and set the count of chars to zero

      if [[ response_chars_count -eq 0 ]]  # check for spaces only - no other characters were entered 
      then 
         let response_chars_count=$response_chars_count+1  # make the spaces be counted as characters so that a new number is asked to be re-entered
         else    # check for no spaces - only real normal characters were entered
            echo $response > chars.txt  
            let response_chars_count=$(egrep "[^0-9]{1}" chars.txt | wc -w)
      fi
      echo $response_chars_count

      if [[ $response_chars_count -eq 0 ]]
      then
         if [[ $response -eq $num_lines ]]
         then
            echo "You guessed it alright. Congratulations!!!"
            exit 0
         elif [[ $response -gt $num_lines ]]
         then
            echo "Your guess is too high. Please try again with a smaller number..."
         elif [[ $response -lt $num_lines ]]
         then
            echo "Your guess is too low. Please try again with a bigger number..."
         fi
      elif [[ $response_chars_count -gt 0 ]]
      then
         echo "Your input is wrong, it is not a number. Please correct and guess once again..."
      fi
   done
}
guessinggame
userprompting
