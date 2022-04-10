README.md:

	touch README.md
	echo "# The Great Guessing Game" >> README.md
	echo "\n*<u>A Unix bash shell scripting based guessing game for counting Unix files within a directory</u>*" >> README.md
	echo "\n*Created by Manisha Basu.*" >> README.md 
	echo "\n*Delivered by John Hopkins University.*" >> README.md
	echo "\n\n\n\n **1. Project Title : A Guessing Game for the Unix file system** " >> README.md
	echo -n "\n **2. Make was run on :** " >> README.md
	date | cat >> README.md
	echo "\n **3. Number of lines of code in guessinggame.sh : 49**" >> README.md
	echo "\n\n\n\n\n\n*My project details can be followed up through the GitHub web page* [link](https://manisha-netizen.github.io/my-first-repo/)" >> README.md


clean:
	rm README.md
