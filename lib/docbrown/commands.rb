require 'clamp'

module DocBrown

  class AbstractCommand < Clamp::Command

    option "--version", :flag, "show version" do
      puts DocBrown::VERSION
      exit(0)
    end

    def say(message)
      message = message.upcase if verbose?
      puts message
    end

  end

  class CreateModelCommand < AbstractCommand
    option ["--name", "-n"], "name", "model name"

    def execute
      say "CreateModelCommand #{name}"
    end
  end

  class CreateViewCommand < AbstractCommand
    option ["--tableview", "-tv"], :flag, "ViewController with TableView"
    option ["--textfield", "-tf"], :flag, "ViewController with Textfield"
    parameter "name", "View name", :attribute_name => :view_name
    parameter "xcodeproj", "Path to the xcodeproj", :attribute_name => :xcodeproj_path

    def execute
      say "CreateViewCommand #{name}"
    end
  end

  class CreateDataStoreCommand < AbstractCommand
    option ["--name", "-n"], "name", "datastore name"

    def execute
      say "CreateDataStoreCommand #{name}"
    end
  end

  class MainCommand < AbstractCommand

    subcommand "create:model", "Create Model.", CreateModelCommand
    subcommand "create:view", "Create View.", CreateViewCommand
    subcommand "create:datastore", "Create DataStore.", CreateDataStoreCommand

  end

end