require "docbrown/template_finder"

module DocBrown
    class CreateViewCommand
        
        def initialize(name)
            @name = name
        end

        def execute
            puts "CreateViewCommand #{@name}"
            puts TemplateFinder.new.templates_for('view')
        end

    end
end