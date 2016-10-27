## Supported tags and respective ``Dockerfile`` links

- ``latest`` : [Dockerfile](https://github.com/josechagas/rbenv-ruby-rails/blob/master/Dockerfile)


This is a working image , originally designed to be used as a base for another that will execute some RUBY on RAILS projects, but it's completely working if you want to use it to make a container for you project.

## This image contains:
- base image: ubuntu
- rbenv
- ruby
- ruby-build
- gem bundler
- nodejs

## Usage:

### - Creating a Container
You can use this image to execute some ruby on rails project, but you will need to manually make the configurations, like install gems.

#### Example:
- Creating a volume and defining the workdir
```shell
docker run \
       -v [directory on host of ruby on rails project]:[directory you want to add your project on container] \
       -w [directory you want to add your project on container] \
       josechagas/rbenv-ruby-rails [some method, like bundle install]
```
 
### - Using to Create another Image
As I mentioned above this image was designed to be a base for another images, because it has the basic to run a ruby on rails application.

#### Examples:
- Image using this image as base:

``
josechagas/ruby-rails_mysql-client
``


- When executing docker build:
 - After creating your dockerfile when you will execute the build you can use or not a build argument:

 - The build argument ``NEED_UPDATE_ON_BUILD`` ,witch default value is ``false``, indicates that you want or not update the installed packages of image ``rbenv-ruby-rails``.

```shell
docker build --build-arg NEED_UPDATE_ON_BUILD=true -t [image name] .
```

 

## Managing Updates

This image has a simple script called ``rbenv_ruby_rails`` created to help you with simple things like update the packages of this images and see the versions of them. It's location is ``/usr/local/bin/`` and you can see it's contents and make changes if you fell necessary.

- Inside the container execute:
```
rbenv_ruby_rails --help
```


- To see the content of this file you have some options, for example:
 - Take a look on GitHub repository ``rbenv-ruby-rails``
 - Create a docker volume during creation of container
 - execute the script inside the created container:
```shell
    apt-get install -y nano
    nano /usr/local/bin/rbenv_ruby_rails
```

