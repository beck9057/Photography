# Kyle Falconer Photography

## Public-facing views
* Portfolio - for showcasing photos
* About - for providing background and skill information
* Contact - for general inquiries and booking

## Administration views
* Users - for adding, editing and removing users who act as either photographers or administrators.
* Photos - for adding, editing, and removing photos
* Events - not yet implemented; to have the ability to add, edit, and remove events.
* Clients - not yet implemented; to have the ability to add, edit, and remove clients.


### Setup
I am currently hosting this Rails application through DigitalOcean, using the "Ruby on Rails on Ubuntu 12.10 (Nginx + Unicorn)" image. Once created, I followed the instructions on [this community article][1].

Aside from this preliminary setup, I needed to add a `secret_key_base` to the `config/secrets.yml` and to copy it over to the server, since it is not in the repository. Along with this file, the config/initializers/devise.rb file needed to have a secret_key set as well.

Nginx needed to have its `client_max_body_size` increased because working with large file uploads is critical for functionality on the site.

Aside from these things, there was nothing else that needed to be done in order to deploy the application. I do plan on (at some later date) setting up and using a more seamless deployment method. For now I will just pull down changes from GitHub or move them over using SFTP like I did this time. 

  [1]: https://www.digitalocean.com/community/articles/how-to-launch-your-ruby-on-rails-app-with-the-digitalocean-one-click-image