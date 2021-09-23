read -p "Repository url: " repository
read -p "Dockerhub username: " username

OUTPUT=$(echo ${repository} | cut -d"/" -f 5 | cut -d"." -f 1)
git clone $repository

docker build "${OUTPUT}/" -t task-image
docker login
docker tag task-image $username/django-react
docker push $username/django-react