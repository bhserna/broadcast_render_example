module Tweet::Broadcasts
  extend ActiveSupport::Concern

  included do
    after_create_commit do
      broadcast_render_later_to :tweets, partial: "tweets/on_create"
    end

    after_update_commit do
      broadcast_replace_later_to :tweets
    end

    after_destroy_commit do
      broadcast_render_to :tweets, partial: "tweets/on_destroy"
    end
  end
end