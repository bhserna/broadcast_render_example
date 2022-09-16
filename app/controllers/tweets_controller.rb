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

    respond_to do |format|
      format.html { @tweet.broadcast_prepend_to :tweets }
    end
  end

  def update
    @tweet.update(tweet_params)

    respond_to do |format|
      format.html { @tweet.broadcast_replace_to :tweets }
    end
  end

  def destroy
    @tweet.destroy

    respond_to do |format|
      format.html { @tweet.broadcast_remove_to :tweets }
    end
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
