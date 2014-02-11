class PostsController < ApplicationController

  authorize_resource

  before_filter :get_category

  def index
    @posts = @category.posts.order("posts.created_at").includes(:category, :user)

    @posts = @posts.where("posts.category_id = ?", params[:category_id]) if params[:category_id].present?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = @category.posts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = @category.posts.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = @category.posts.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @category.posts.build(params[:post])
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to category_path(@category), notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to category_path(@category), notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to category_path(@category), notice: 'Post was deleted.' }
      format.json { head :no_content }
    end
  end

  private

    def get_category
      @category = Category.find(params[:category_id])
    end
end
