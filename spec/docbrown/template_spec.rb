require 'spec_helper'

describe DocBrown::TemplateFinder do
  describe '#template_path' do
    let (:finder) { described_class.new }

    it "returns the list of the available templates" do
        expect(finder.templates_for('view')).to eq view_templates
    end

    it "expands the template file path" do
        template_files = finder.templates_for 'view'
        def finder.templates_dir
            "template_dir_for_test"
        end

        expect(finder.expands(template_files)).to eq expanded_templates
    end

  end


  def view_templates
      ["<%= viewname %>ViewController+Layout.swift", 
        "<%= viewname %>ViewController+Render.swift", 
        "<%= viewname %>ViewController+Setup.swift", 
        "<%= viewname %>ViewController+Style.swift", 
        "<%= viewname %>ViewController+TableView.swift", 
        "<%= viewname %>ViewController+TextFieldDelegate.swift", 
        "<%= viewname %>ViewController.swift", 
        "<%= viewname %>ViewModel.swift"].map { |t| "view/#{t}"  }
  end
  
  def template_dir_for_test
    "template_dir_for_test"
  end


  def expanded_templates
    view_templates.map { |t| "#{template_dir_for_test}/#{t}"  }
  end

end