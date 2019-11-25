# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://home-gig-4.herokuapp.com/home/index"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  add '/home/index'
  add '/home/owner'
  add '/home/worker'
  add '/home/admin'
  add '/jobs/explore'
  add '/about'
  add '/contactus'
  add '/faq'
  add '/privacy'
  add '/sitemap'
  add '/tos'
  Job.find_each do |job|
    add job_path(job)
    add job_bids_path(job)
    job_reviews_path(job)
    job.bids.find_each do |_bid|
      add job_bid_path(job, _bid)
    end
    job.reviews.find_each do |_review|
      add job_review_path(job, _review)
    end
  end
  Report.find_each do |report|
    add report_path(report)
  end
  User.find_each do |user|
    add user_path(user)
  end


end
