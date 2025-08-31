class BlogsController < ApplicationController
  get "/new" do
    erb :"blogs/new"
  end

  get "/:id" do
    @blog = Blog.find(params[:id])

    erb :"blogs/show"
  end

  post "/new" do
    blog = Blog.new(params["blog"])

    if blog.save
      redirect "/blogs/#{blog.id}"
    else
      erb :"blogs/new"
    end
  end
end
