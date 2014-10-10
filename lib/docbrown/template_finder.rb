module DocBrown    
    class TemplateFinder
        def templates_dir
            File.expand_path('../../../templates', __FILE__)
        end

        def templates_for(type)
            Dir.entries("#{templates_dir}/#{type}").select { |f| f.end_with?"swift"}
        end
    end
end
