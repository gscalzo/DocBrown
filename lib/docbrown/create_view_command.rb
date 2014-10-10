require "docbrown/template_finder"

module DocBrown
    class CreateViewCommand
        
        def initialize(name)
            @name = name
        end

        def execute
            puts "CreateViewCommand #{@name}"
            finder = TemplateFinder.new
            files = finder.templates_for('view')
            puts finder.expands(files)

            # --- find templates
            # copy the files given the package
            # replace the macro
            # update the project
        end

    end
end