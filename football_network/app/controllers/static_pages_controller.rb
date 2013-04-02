require 'rss'
class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
  def help
  end

  def about
  end

  def contact
  end

  def news
        begin
          @latest_football_posts = RSS::Parser.parse(open('http://www.skysports.com/rss/0,20514,11661,00.xml').read, false).items[0...10]
        rescue
          # Do nothing, just continue.  The view will skip the football post section if the feed is nil.
          @latest_football_posts = nil
        end
      end
    end
