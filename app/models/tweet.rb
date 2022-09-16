class Tweet < ApplicationRecord
  after_create_commit -> { broadcast_render_later_to :tweets, partial: "tweets/on_create" }
  after_update_commit -> { broadcast_replace_later_to :tweets }
  after_destroy_commit -> { broadcast_render_to :tweets, partial: "tweets/on_destroy" }
end
