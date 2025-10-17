class BlogsController < ApplicationController
  get "/new" do
    protect!

    erb :"blogs/new"
  end

  get "/:id" do
    @blog = Blog.find_by(id: params[:id])

    if @blog
      erb :"blogs/show"
    else
      redirect "/"
    end
  end

  get "/edit/:id" do
    protect!

    @blog = Blog.find_by(id: params[:id])

    if @blog
       erb :"blogs/edit"
    else
      redirect "/"
    end
  end

  put "/:id" do
    @blog = Blog.find_by(id: params[:id])

    if @blog && @blog.update(params["blog"])
      redirect "/blogs/#{@blog.id}"
    else
      erb :"blogs/edit"
    end
  end

  post "/new" do
    protect!

    blog = Blog.new(params["blog"])

    if blog.save
      redirect "/blogs/#{blog.id}"
    else
      erb :"blogs/new"
    end
  end
end
