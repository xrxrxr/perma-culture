# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts
  # GET /posts.json
  def index
    session[:conversations] ||= []
    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
    @post = Post.new
    @comment = Comment.new
    @categories = Category.all
                                 
    if current_user.categories.empty?
      @posts = Post.all.reverse
    else
      @posts = Post.all.reverse
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @categories = Category.all
  end

  # POST /posts
  # POST /posts.json
  def create
    @comment = Comment.new
    @post = Post.new(title: params[:post][:title],
                    content: params[:post][:content],
                    category: Category.find(params[:post][:category]),
                    writter: current_user)

    if @post.save
      respond_to do |format|
        format.js
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      end
    else
      format.html { render :new }
    end
  end


  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.js
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :content, :category)
  end
end
