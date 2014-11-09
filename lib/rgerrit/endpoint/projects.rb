
module RGerrit
  class Projects < EndPoint
    def initialize(session)
      super(session, '/projects/')
    end
    
    def list
      projects = []
      fetch( { 'd' => nil } ).each_pair do |name, info|
        projects << Project.new(name, info['id'], info['description'])
      end
      projects
    end
  end

  class Project
    attr_reader :name, :id, :desc
    
    def initialize(name, id, desc)
      @name = name
      @id = id
      @desc = desc
    end
  end
end
