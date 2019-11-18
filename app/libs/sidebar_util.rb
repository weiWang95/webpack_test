class SidebarUtil
  class << self
    def controller_name(name)
      sidebar_controller_map[name]
    end

    def sidebar_controller_map
      @_sidebar_controller_map ||= YAML.load_file(Rails.root.join('config', 'sidebar.yml'))
    end
  end
end