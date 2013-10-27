# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get '/guide', :to  => 'help#index'
get '/guide/:id', :to => 'help#show'