# cloudinv-agent-ubuntu

## Build the image
`docker build -t cloudinv-agent-ubuntu ~/path/to/Dockerfile --build-arg DOWNLOAD_URL=https://path/to/.deb --build-arg SITE_KEY=actualKey
`

Example URL for the stable public repo/build:

`DOWNLOAD_URL=https://spiceworks.jfrog.io/spiceworks/deb-public/pool/spiceworks-agentshell-cloud-inventory_0.3.16_all.deb`

## List images 
`docker images`

## Run the new image in a container
`docker run -dit cloudinv-agent-ubuntu`

The container is launched in the background with interactive mode enabled, which means we can "attach" to the container's console.

## Lookup the name of the container (its dynamic)
`docker ps -a`
 
## Then attach to the console using
`docker attach <dynamic name>`
 
After running docker attach you'll have a cmd console. You can call powershell to get a PS console.
You can detach and leave the container running using Ctrl+P , Ctrl+Q.
