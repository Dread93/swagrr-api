class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  # before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

  # GET /posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    attach_base64_to_model(params[:post][:image],@post,'image')
    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if can_edit? && @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    if can_edit? && @post.update(comment_params)
      @post.destroy
    else
      render json: { message: "Not your post, dog" }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def can_edit?
      current_dog.posts.include? @post
    end

    # def set_s3_direct_post
    #   @s3_direct_post = S3_BUCKET.presigned_post(key: "posts/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
    # end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:image_url, :caption, :location, :dog_id)
    end
end
