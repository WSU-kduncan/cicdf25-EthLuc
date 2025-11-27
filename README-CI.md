# Ethan Lucas Project 4

### Part 1: Docker File & Building Images

- The website in "web-content" was created by chatGPT using this prompt: `"Create me a website using two html files (one being an index) and one css file. The website is about how Path of Exile (1) is the best arpg of all time and is heavily inspired from Diablo 2."`
    - You can view the content at: `http://(ip given by AWS)/index.html`
    - Web-content is located in my repo at: `https://github.com/WSU-kduncan/cicdf25-EthLuc/tree/main/web-content`
- Our Dockerfile copies all website content in `web-content` and using apache's httpd2.4 image, creates a container that hosts our website on port 80.
    - The Dockerfile in my repo is located at: `https://github.com/WSU-kduncan/cicdf25-EthLuc/blob/main/web-content/DockerFile`
- How to build the container
    - In your terminal type `docker build -t (dockerhub username)/(desired image name):(tag) ./web-content`
    - To make more tags `docker tag (dockerhub username)/(desired image name):1.0.0` The 1.0.0 is a tag example.
        - Then push your new tags `docker push (dockerhub username)/(desired image name):(tag)`
- How to run the container
    - Once you have the image built, type in your terminal `docker run -d -p 8080:80 (dockerhub username)/(chosen image name):(tag)`



### Part 2: Github Actions & DockerHub
- Configuring Github Repo Secrets
    - To create a PAT (for dockerhub), login to dockerhub's website and go into your account settings.
        - Then go down to `Personal access tokens` > `Generate new tokens`.
        - Give your token a name and set its permissions, for this project it is recommended to set them to Read/Write.
    - Setting up Secrets / Making Secrets
        - Go to your repository then `Settings` > `Secrets and Variables` > `Actions` > `New Repository Secret`.
        - The secrets for this project are for logging into dockerhub. One secret is for our username, `DOCKER_USERNAME`, and the other is for our PAT, `DOCKER_TOKEN`.
    - CI with Github Actions
        - Our workflow triggers on any push to main
        - Whenever a push to main happens, the steps are: check out the repo, login to dockerhub using secrets, build the docker image, push to dockerhub
            - Link to workflow file in my repo `https://github.com/WSU-kduncan/cicdf25-EthLuc/blob/main/.github/workflows/main.yml`
    - Testing and Validating
        - To test if the workflow is working, do any commit and push to main. Head over to the repository and there now should be either a yellow circle, green checkmark or red x. The yellow circle indicates the workflow is still ongoing (wait a bit), the green checkmark indicates that it worked and had no issues, the red x indicates that something went wrong.
            - If red x, click the red x and see where the workflow failed. Fix the issues and then try another commit and push to main to check if it is working.
            - If green checkmark, check your dockerhub repo to make sure that the image was pushed to the dockerhub repo.
                - To be extra sure you can pull your docker image from your repository and see if it is serving your web-content correctly.
        - Link to dockerhub repo `https://hub.docker.com/repository/docker/ethluc/docker-site`