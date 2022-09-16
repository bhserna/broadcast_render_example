class Tweet < ApplicationRecord
  include Broadcasts
  
  after_create_commit :broadcast_on_create
  after_update_commit :broadcast_on_upate
  after_destroy_commit :broadcast_on_destroy

  def broadcast_on_create
    broadcast_render_later_to :tweets, partial: "tweets/on_create"
  end

  def broadcast_on_upate
    broadcast_replace_later_to :tweets
  end

  def breodcast_on_destroy
    broadcast_render_to :tweets, partial: "tweets/on_destroy"
  end
end
