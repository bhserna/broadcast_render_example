class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ]

  def index
    @tweets = Tweet.order(id: :desc)
  end

  def show
  end

  def new
    @tweet = Tweet.new
  end

  def edit
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.save
    @tweet.broadcast_render_to :tweets, partial: "tweets/on_create"
  end

  def update
    @tweet.update(tweet_params)
    @tweet.broadcast_replace_to :tweets
  end

  def destroy
    @tweet.destroy
    @tweet.broadcast_render_to :tweets, partial: "tweets/on_destroy"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:body)
    end
end
