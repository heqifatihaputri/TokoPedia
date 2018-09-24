module StoresHelper
  def store_author(store)
    user_signed_in? && current_user.id == store.user_id
  end
end
