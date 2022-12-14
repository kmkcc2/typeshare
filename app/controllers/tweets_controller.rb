class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy like unlike]
  before_action :authenticate_user!
  # GET /tweets or /tweets.json
  def index
    # @tweets = current_user.tweets
    @tweets = Tweet.all.order(created_at: :DESC)
    @tweet = current_user.tweets.new 
    @user = User.find(@tweet.user_id)
  end

  # GET /tweets/1 or /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = current_user.tweets.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets or /tweets.json
  def create
    @tweet = current_user.tweets.build(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to root_path, notice: "Tweet was successfully created." }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to tweet_url(@tweet), notice: "Tweet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  # Add like to a tweet 
  def like
    @like = @tweet.likes.build({user_id: current_user.id})

    if @like.save
      redirect_to root_path
    else
      redirect_to tweets_url, alert: @like.errors
    end
  end

  def unlike
    @like = @tweet.likes.find_by(user_id: current_user.id)

    @like.destroy

    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:body, :owner_id)
    end

    def like_params
      params.permit(:id)
    end

    def check_owner
      if current_user.id != @tweet.user_id
        respond_to do |format|
          format.html { redirect_to root_path, alert: "Login as tweet owner to edit it." }
          format.json { head :no_content }
        end 
      end
    end

end
