get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  erb :index
end

get "/:handle" do #placeholder in this case params[:twitterhandle]
  
  handle = params[:handle] #input.value
  
  @handle = TwitterUser.find_by(user: handle)
  if @handle
    puts '=' * 50
    puts 'handle = '+handle+' exist !!!!'
    puts  @handle.id
    @tweets = @handle.tweets
  else
    puts '=' * 50
    puts 'handle = '+handle+' create !!!'
    tu = TwitterUser.create(user: handle)
    @tweets = []
    arr = CLIENT.user_timeline(handle)
    arr.each do |tweet|
       @tweets << Tweet.create(twitter_user_id: tu.id ,tuit: tweet.text)
    end
    
  end
  
  
   erb :index
end


post '/fetch' do
  
   # handle = params[:twitterhandle]
  
  # @handle = TwitterUser.find_by(user: handle)
  # if @handle
  #   puts '=' * 50
  #   puts 'handle = '+handle+' exist !!!!'
  #   puts  @handle.id
  #   @tweets = @handle.tweets
  # else
  #   puts '=' * 50
  #   puts 'handle = '+handle+' create !!!'
  #   tu = TwitterUser.create(user: handle)
  #   @tweets = []
  #   arr = CLIENT.user_timeline(handle)
  #   arr.each do |tweet|
  #      @tweets << Tweet.create(twitter_user_id: tu.id ,tuit: tweet.text)
  #   end
    
  # end
  redirect to ("/#{params[:twitterhandle]}")
  

end
