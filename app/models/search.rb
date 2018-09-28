class Search < ApplicationRecord

  def search_products

    products = Product.all

    products = products.where(["name LIKE?", "%#{params[:keywords]}%"]) if keywords.present?
    products = products.where(category_id: category_id) if category_id.present?
    products = products.where(sub_category_id: sub_category_id) if sub_category_id.present?
    products = products.where("price >= ?", min_price) if min_price.present?
    products = products.where("price <= ?", max_price) if max_price.present?

    return products
  end
end
