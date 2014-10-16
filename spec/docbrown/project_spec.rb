require 'spec_helper'
require 'fileutils'
require 'pathname'
require 'yaml'

describe DocBrown::ProjectFinder do
  describe "#prjname" do
    let (:project_finder) { described_class.new(DUMMY_DOCBROWN_PRJPATH) }
    it "finds project given correct path" do 
      expect(project_finder.prjname).to eq DUMMY_DOCBROWN_PRJNAME
    end
    it "finds nmae of theproject given correct path" do 
      expect(project_finder.name).to eq DUMMY_DOCBROWN_NAME
    end
  end


  describe "#sync" do

    def verify_group_structure(group, expected_structure)
      # expected_structure.each do |object_name, object_children|
      #   failure_message = "expected group `#{group.basename}` to have child `#{object_name}`"
      #   object = group.children.detect { |child| child.basename == object_name }
      #   expect(group).to_not be_nil, failure_message

      #   if object.instance_of?(Xcodeproj::Project::Object::PBXGroup)
      #     object_children ||= {}
      #     found_children = object.children.map(&:basename)
      #     missing_children_in_group = object_children.keys - found_children
      #     extra_children_in_group = found_children - object_children.keys
      #     failure_message = "In group #{object.hierarchy_path}:"

      #     unless missing_children_in_group.empty?
      #       failure_message += "\n  Expected to find children: #{missing_children_in_group.join(", ")}"
      #     end

      #     unless extra_children_in_group.empty?
      #       failure_message += "\n  Did not expect to find children: #{extra_children_in_group.join(", ")}"
      #     end
      #     failure_message = "Expected #{object_name} to have #{object_children.count} children, found #{object.children.count}"
      #     expect(object_children.count).to eq(object.children.count), failure_message
      #     verify_group_structure(object, object_children) if object_children.count > 0
      #   end
      # end
    end

    def verify_file_structure(dir_pathname, expected_structure)
      # expected_structure.each do |entry_name, entry_entries|
      #   entry_pathname = dir_pathname + entry_name
      #   expect(File.exist?(entry_pathname) || Dir.exists?(entry_pathname)).to be(true), "Expected #{entry_pathname} to exist"

      #   if File.directory?(entry_pathname)
      #     entry_entries ||= {}
      #     found_entries = entry_pathname.entries.reject { |e| [".", ".."].include?(e.to_s) }.map(&:to_s)
      #     missing_entries_on_file_system = entry_entries.keys - found_entries
      #     extra_entries_on_file_system = found_entries - entry_entries.keys
      #     failure_message = "In #{entry_pathname}:"

      #     unless missing_entries_on_file_system.empty?
      #       failure_message += "\n  Expected to find entries: #{missing_entries_on_file_system.join(", ")}"
      #     end

      #     unless extra_entries_on_file_system.empty?
      #       failure_message += "\n  Did not expect to find entries: #{extra_entries_on_file_system.join(", ")}"
      #     end

      #     expect(missing_entries_on_file_system.count + extra_entries_on_file_system.count).to be(0), failure_message
      #     verify_file_structure(entry_pathname, entry_entries) if entry_entries.count > 0
      #   end
      # end
    end

    def expected_file_structure
      YAML::load_file(File.expand_path("../expected_file_structure.yml", __FILE__))
    end

    def expected_group_structure
      YAML::load_file(File.expand_path("../expected_group_structure.yml", __FILE__))
    end

    describe "with no additional options" do

      before(:all) do
        # DUMMY_SYNX_TEST_PROJECT.sync(:output => StringIO.new)
      end

      it "should have the correct physical file structure" do
        # verify_file_structure(Pathname(DUMMY_SYNX_TEST_PROJECT_PATH).parent, expected_file_structure)
      end

      it "should not have modified the Xcode group structure, except for fixing double file references" do
        # verify_group_structure(DUMMY_SYNX_TEST_PROJECT.main_group, expected_group_structure)
      end

      it "should have updated the pch and info.plist build setting paths" do
        # # dummy target
        # DUMMY_SYNX_TEST_PROJECT.targets.first.each_build_settings do |bs|
        #   expect(bs["GCC_PREFIX_HEADER"]).to eq("dummy/Supporting Files/dummy-Prefix.pch")
        #   expect(bs["INFOPLIST_FILE"]).to be_nil
        # end

        # # dummyTests target
        # DUMMY_SYNX_TEST_PROJECT.targets[1].each_build_settings do |bs|
        #   expect(bs["GCC_PREFIX_HEADER"]).to eq("dummyTests/Supporting Files/dummyTests-Prefix.pch")
        #   expect(bs["INFOPLIST_FILE"]).to eq("dummyTests/Supporting Files/dummyTests-Info.plist")
        # end
      end
    end
  end
end