class CleanProductWorker
  include Sidekiq::Worker

  def perform
    Product.recent.destroy_all
  end
end
