#!/bin/sh

# MAKE SURE ~/.ssh/git  ready 
gitKey="gitKey"
locationKey=~/.ssh/

arrReps=(
	"git@github.com:enisgur/rep1.git"
	"git@github.com:enisgur/rep2.git"
	"git@github.com:enisgur/rep3.git"
	"git@github.com:enisgur/rep4.git"
)


{
# Try
# login github
eval $(ssh-agent -s)
ssh-add $locationKey$gitKey
echo "✅-Done : Login github success!"
} || {
# Executed when above fails
echo "FAIL to Login to ssh-agent !"
exit 1
}


# CLONE ALL REPS
for arrayItem in "${arrReps[@]}"; do
	{
		# try
		echo "fetching... server...."
		git clone $arrayItem
	} || {
		# catch
		echo "git clone error on $arrayItem"
	}
done


echo "✅-Done : Cloning from git reps are done!"