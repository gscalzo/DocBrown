module DocBrown    
    class TemplateFinder
        def root_dir
            "."
        end

        def templates_dir
            File.expand_path('../../../templates', __FILE__)
        end

        def templates_for(type)
            Dir.entries("#{templates_dir}/#{type}").select { |f| f.end_with?"swift"}.map { |t| "#{type}/#{t}"  }
        end

        def expands(files)
            files.map { |t| "#{templates_dir}/#{t}"  }
        end

        def create_path(package)
            full_path = root_dir + "/" + package.gsub('.', '/')
            FileUtils.mkdir_p(full_path)
        end


    end
end
