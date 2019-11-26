class StaticController < ApplicationController
  def about
    render 'about'
  end

  def contactus
    render 'contactus'
  end

  def faq
    render 'FAQ'
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

  def message
    UserMailer.with(first_name: params['first_name'], last_name: params['last_name'], email: params['email'], comment:params['comment']).contact_us_email.deliver_now
  end


end
