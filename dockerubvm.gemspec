require 'docker'
require 'net/ssh'

# Install Docker
if system('docker --version')
  puts 'Docker is already installed.'
else
  puts 'Docker is not installed. Installing now...'
  system('curl -fsSL https://get.docker.com -o get-docker.sh')
  system('sh get-docker.sh')
end

# Connect to the Docker daemon
Docker.url = 'tcp://localhost:2375'

# Create a new Docker container
container = Docker::Container.create('Image' => 'ubuntu:latest')

# Start the container
container.start

# Print the container ID
puts "Container ID: #{container.id}"

# SSH into the container
Net::SSH.start('localhost', 'root', :password => 'your_password', :port => 22) do |ssh|
  # Execute your commands here
  output = ssh.exec!("ls")
  puts output
end