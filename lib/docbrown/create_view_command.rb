require "docbrown/template_finder"
require "docbrown/project_finder"

module DocBrown
    class CreateViewCommand
        
        def initialize(name, xproject, package)
            @name = name
            @xproject = xproject
            @package = package
        end

        def execute
            puts "CreateViewCommand #{@name}"
            finder = TemplateFinder.new
            files = finder.templates_for('view')
            finder.create_path('view' + @package)

            # --- find templates
            # copy the files given the package
            # replace the macro
            # update the project
        end

    end
end