require 'clamp'
require "docbrown/create_view_command"

module DocBrown
  module CLI
    class AbstractCommand < Clamp::Command

      option "--version", :flag, "show version" do
        puts DocBrown::VERSION
        exit(0)
      end
      option ["--xproject", "--xp"], "XPROJECT", "xproject name", :default => "auto" do |s| 
        s
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
      option ["--tableview", "--tv"], :flag, "ViewController with TableView"
      option ["--textfield", "--tf"], :flag, "ViewController with Textfield"
      option ["--package", "--pk"], "PKG", "Directory tree in which create the files, in format 'foo.bar.giff'", :default => "." do |s| 
        s
      end

      parameter "name", "View name", :attribute_name => :view_name

      def execute
        DocBrown::CreateViewCommand.new(view_name, xproject, package).execute()
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

end