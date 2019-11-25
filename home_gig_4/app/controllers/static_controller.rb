class StaticController < ApplicationController
  def about
    render about_path
  end

  def contactus
    render contactus_path
  end

  def faq
    render faq_path
  end

  def privacy
    render privacy_path
  end

  def sitemap
    render sitemap_path
  end

  def tos
    render tos_path
  end


end
