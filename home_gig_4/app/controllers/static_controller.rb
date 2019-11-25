class StaticController < ApplicationController
  def about
    render 'about'
  end

  def contactus
    render 'contactus'
  end

  def faq
    render 'faq'
  end

  def privacy
    render 'privacy'
  end

  def sitemap
    render 'sitemap'
  end

  def tos
    render 'tos'
  end


end
