module GetModules

  extend ActiveSupport::Concern

  def get_category
    @category_roots = Category.roots
  end

end
