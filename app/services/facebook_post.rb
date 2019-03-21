class FacebookPost
	attr_accessor :title, :content, :writter

	def initialize(title, content, writter)
		@title = title
		@content = content
		@writter = writter
	end

	def post
		@graph = Koala::Facebook::API.new(ENV['FB_ACCESS_TOKEN'])

	    pages = @graph.get_connections('me', 'accounts')
	    page_token = pages.first['access_token']
	    @page_graph = Koala::Facebook::API.new(page_token)
	    @page_graph.put_wall_post("#{@writter.user_name} a poste un article : #{@title} sur perma-culture.herokuapp.com : \n #{@content}")
 	end

 	def perform
 		post
 	end
end