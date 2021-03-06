module DocBrown    
    class ProjectFinder
        def initialize(path = '.')
            @path = path
        end

        def prjfullname
            files = Dir["#{@path}/*.xcodeproj"]
            return File.basename(files.first) unless files.empty?
            raise "No prject found in [#{@path}]"
        end

        def prjname
            prjfullname.split('.').first
        end
    end
end