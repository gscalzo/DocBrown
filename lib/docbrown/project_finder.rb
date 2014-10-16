module DocBrown    
    class ProjectFinder
        def initialize(path)
            @path = path
        end

        def prjname
            files = Dir["#{@path}/*.xcodeproj"]
            return File.basename(files.first) unless files.empty?
        end

        def name
            prjname.split('.').first
        end
    end
end