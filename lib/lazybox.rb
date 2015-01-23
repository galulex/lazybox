module Lazybox

  class Engine < Rails::Engine
  end

  module Helper

    def render_lazybox(options = {})
      content_tag(:div, '', id: :lazy_overlay, class: ('active' if options[:active] && content_for?(:lazybox))) +
        content_tag(:div, id: :lazybox) do
        button_tag('', id: :lazy_close, class: :visible) +
          content_tag(:div, id: :lazy_body) do
          content_for(:lazybox)
        end
      end
    end

  end
end

ActiveSupport.on_load(:action_view) do
  include Lazybox::Helper
end
