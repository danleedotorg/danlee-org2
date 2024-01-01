class AdminRoutes
  attr_reader :helper_names

  def initialize
    @helper_names = Rails.application.routes.named_routes.helper_names
  end

  def helper_names
    filter_helper_names!
    @helper_names
  end

  def filter_helper_names!
    @helper_names.filter! do |name|
      does_not_raise_eval_error?(name) && has_wanted_prefix?(name) && has_wanted_suffix?(name)
    end
  end

  private

  def has_wanted_prefix?(name)
    !(name.starts_with?('rails') || name.starts_with?('turbo') || name.starts_with?('new_rails'))
  end

  def has_wanted_suffix?(name)
    name.ends_with?('_path')
  end

  def does_not_raise_eval_error?(name)
    begin
      eval("Rails.application.routes.url_helpers.#{name}")
      true
    rescue StandardError => _e
      false
    end
  end
end
